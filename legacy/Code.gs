// --- 設定區 ---
const SHEET_ID = '1P7cEClRuGDs9qDQn3SfRhFX9qM5qMMi1k91XegbIxAo'; // 請確認這是不是你的 Sheet ID
const SHEET_NAME = 'fruits';
const CACHE_KEY = 'API_FRUIT_DATA_V4_SHARING'; // 更新版號以重置快取
const CACHE_TTL = 21600;

// --- 主入口 ---
function doGet(e) {
  // 🔥 [新增] API 模式：如果是搬家腳本來請求 (帶上 ?format=json)，就回傳 JSON 資料
  if (e && e.parameter && e.parameter.format === 'json') {
    const result = getFruitData();
    const payload = {
      fruits: result.success ? result.data : [],
      success: result.success,
      source: result.source || 'fresh'
    };
    return ContentService.createTextOutput(JSON.stringify(payload))
      .setMimeType(ContentService.MimeType.JSON);
  }

  // --- 原有的網頁渲染邏輯 (HTML) ---
  const template = HtmlService.createTemplateFromFile('index');
  
  // 1. 準備初始資料包 (SSR)
  let initialData = { 
    fruits: [], 
    scenarios: [], 
    symptoms: [],

    // 🔥 加入這行：捕捉網址參數 (如 ?id=cherry_bing)
    params: e.parameter || {},
    
    // 🔥 關鍵修復：注入當前 Web App 的網址，讓前端可以生成分享連結
    deployUrl: ScriptApp.getService().getUrl() 
  };
  
  try {
    // 呼叫下方的工具函式抓取資料
    const fruits = getFruitData(); 
    const metadata = getMetadata(); 
    
    if (fruits.success) initialData.fruits = fruits.data;
    if (metadata.success) {
      initialData.scenarios = metadata.scenarios;
      initialData.symptoms = metadata.symptoms;
    }
  } catch (err) {
    // 這裡只記錄錯誤，不讓網頁崩潰，前端會顯示空狀態
    Logger.log('SSR Injection Error: ' + err);
  }

  // 2. 將資料轉為 JSON 字串注入 HTML
  template.jsonPayload = JSON.stringify(initialData);

  return template.evaluate()
      .setTitle('水果呷對時 🍎') 
      .addMetaTag('viewport', 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no')
      .setXFrameOptionsMode(HtmlService.XFrameOptionsMode.ALLOWALL);
}

// --- 資料讀取層 (Data Layer) ---

// 1. 讀取水果主資料 (含快取機制)
function getFruitData() {
  const cachedData = getCacheLarge(CACHE_KEY);
  if (cachedData) return { success: true, data: cachedData, source: 'cache' };

  const result = fetchFromSheet();
  if (result.success && result.data.length > 0) {
    setCacheLarge(CACHE_KEY, result.data, CACHE_TTL);
  }
  return result;
}

// 2. 讀取情境與症狀資料 (Metadata)
function getMetadata() {
  const CACHE_KEY_META = "API_METADATA_V1";
  const cache = CacheService.getScriptCache();
  const cached = cache.get(CACHE_KEY_META);
  
  if (cached) return JSON.parse(cached);

  try {
    const ss = SpreadsheetApp.openById(SHEET_ID);
    
    // 讀取 Scenario (情境)
    const sheetScenario = ss.getSheetByName('scenario');
    const rawScenario = sheetScenario ? sheetScenario.getDataRange().getValues().slice(1) : [];
    const scenarios = rawScenario.map(r => ({
      group: r[0],
      name: r[1],
      desc: r[2]
    })).filter(i => i.name);

    // 讀取 Symptom (症狀)
    const sheetSymptom = ss.getSheetByName('symptom');
    const rawSymptom = sheetSymptom ? sheetSymptom.getDataRange().getValues().slice(1) : [];
    const symptoms = rawSymptom.map(r => ({
      group: r[0],
      name: r[1],
      desc: r[2]
    })).filter(i => i.name);

    const result = { success: true, scenarios, symptoms };
    cache.put(CACHE_KEY_META, JSON.stringify(result), CACHE_TTL);
    return result;

  } catch (e) {
    return { success: false, error: e.toString() };
  }
}

// 3. 真正去讀 Sheet 的苦工函式
function fetchFromSheet() {
  try {
    const ss = SpreadsheetApp.openById(SHEET_ID);
    const sheet = ss.getSheetByName(SHEET_NAME);
    if (!sheet) return { error: "No Sheet Found" };

    const data = sheet.getDataRange().getValues();
    if (data.length < 2) return { success: true, data: [], source: 'sheet' };

    const headers = data[0].map(h => h.toString().toLowerCase().trim());
    const col = (name) => {
      const idx = headers.indexOf(name.toLowerCase());
      return idx === -1 ? 999 : idx; 
    };

    const rows = data.slice(1);
    const json = (v) => { try { return v ? JSON.parse(v) : [] } catch(e){ return [] } };
    const num = (v) => { const n = Number(v); return isNaN(n) ? 0 : n; };
    const bool = (v) => !!v;

    const payload = rows.map(row => {
      const get = (idx) => (row[idx] === undefined ? '' : row[idx]);

      return {
        id:              get(col('id')),
        category:        get(col('category')),
        name:            get(col('name')),
        name_en:         get(col('name_en')),
        keywords:        get(col('keywords')),
        tagline:         get(col('hero_tagline')),
        is_premium:      bool(get(col('is_premium'))),
        is_common:       bool(get(col('is_common'))),
        curve:           json(get(col('season_curve'))),
        brix:            num(get(col('brix'))),
        acidity:         num(get(col('acidity'))),
        gi_value:        get(col('gi_value')) === 'N/A' ? null : num(get(col('gi_value'))),
        calories:        num(get(col('calories'))),
        energy_index:    num(get(col('energy_index'))),
        moisture:        num(get(col('moisture'))),
        aroma:           num(get(col('aroma'))),
        price_level:     num(get(col('price_level'))),
        color:           get(col('color_hex')) || '#CCCCCC',
        origin:          get(col('origin')),
        best_origin:     get(col('best_origin')),
        texture_desc:    get(col('texture_desc')),
        skin_edible:     get(col('skin_edible')),
        seed_edible:     get(col('seed_edible')),
        good_for:        get(col('good_for')),
        bad_for:         get(col('bad_for')),
        safety_warning:  get(col('safety_warning')),
        nutritional_value: get(col('nutritional_value')),
        
        relief_symptoms: get(col('relief_symptoms')),
        relief_mechanism: get(col('relief_mechanism')),
        scenario:        get(col('scenario')), 
        
        guide: {
          appearance:    get(col('guide_appearance')),
          detail:        get(col('guide_detail')),
          tactile:       get(col('guide_tactile')),
          sense:         get(col('guide_sense'))
        },
        storage:         get(col('storage_guide')),
        trivia:          get(col('trivia'))
      };
    });
    return { success: true, data: payload, source: 'sheet' };
  } catch (e) {
    return { error: e.toString() };
  }
}

// --- 快取系統 (Cache Utils) ---

function setCacheLarge(key, data, time) {
  const cache = CacheService.getScriptCache();
  const jsonString = JSON.stringify(data);
  const CHUNK_SIZE = 90000; // GAS Cache 上限是 100KB，我們保守抓 90KB
  
  if (jsonString.length < CHUNK_SIZE) {
    cache.put(key, jsonString, time);
    cache.remove(key + "_chunks"); 
    return;
  }
  const chunks = {};
  const chunkCount = Math.ceil(jsonString.length / CHUNK_SIZE);
  for (let i = 0; i < chunkCount; i++) {
    const chunkKey = key + "_" + i;
    const chunkData = jsonString.substr(i * CHUNK_SIZE, CHUNK_SIZE);
    chunks[chunkKey] = chunkData;
  }
  cache.putAll(chunks, time);
  cache.put(key + "_chunks", chunkCount.toString(), time);
}

function getCacheLarge(key) {
  const cache = CacheService.getScriptCache();
  const chunkCountStr = cache.get(key + "_chunks");
  if (!chunkCountStr) {
    const data = cache.get(key);
    return data ? JSON.parse(data) : null;
  }
  const chunkCount = Number(chunkCountStr);
  const keys = [];
  for (let i = 0; i < chunkCount; i++) {
    keys.push(key + "_" + i);
  }
  const chunksMap = cache.getAll(keys);
  let fullString = "";
  for (let i = 0; i < chunkCount; i++) {
    const chunkData = chunksMap[key + "_" + i];
    if (!chunkData) return null;
    fullString += chunkData;
  }
  try { return JSON.parse(fullString); } catch (e) { return null; }
}

function clearApiCache() {
  const cache = CacheService.getScriptCache();
  cache.remove(CACHE_KEY);
  cache.remove(CACHE_KEY + "_chunks");
  cache.remove("API_METADATA_V1");
  return "Cache Cleared";
}

// --- 回饋系統 (Feedback) ---
function submitUserFeedback(data) {
  const lock = LockService.getScriptLock();
  if (!lock.tryLock(5000)) {
    return { success: false, error: "System busy, please try again." };
  }

  try {
    const ss = SpreadsheetApp.openById(SHEET_ID);
    let sheet = ss.getSheetByName('Feedback'); 
    
    if (!sheet) {
      sheet = ss.insertSheet('Feedback');
      sheet.appendRow(['Timestamp', 'Device', 'Sentiment', 'Tags', 'Comment', 'Current_URL']);
      sheet.setFrozenRows(1);
    }
    
    sheet.appendRow([
      new Date(),           
      data.device,          
      data.sentiment,       
      data.tags,            
      data.comment,         
      data.url              
    ]);
    
    return { success: true };
    
  } catch (e) {
    return { success: false, error: e.toString() };
  } finally {
    lock.releaseLock();
  }
}
