-- Generated Seed Data

DELETE FROM fruits;

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'tomato_orange_honey',
  '橙蜜香小番茄',
  '小番茄',
  '[10,10,8,4,0,0,0,0,0,0,0,5]'::jsonb,
  '{"name_en":"Orange Honey Tomato","is_premium":true,"is_common":false,"tagline":"高雄美濃冬季限定，帶有獨特橙香","color":"#FFA500","keywords":"橙蜜香,黃番茄","brix":11,"acidity":4,"calories":33,"gi_value":30,"price_level":3,"energy_index":-1,"moisture":7,"aroma":6,"origin":"國產","best_origin":"高雄美濃","skin_edible":"Yes","seed_edible":"Swallow","good_for":"口乾舌燥、食慾不振","bad_for":"胃酸過多、體寒","safety_warning":"無特殊高風險","nutritional_value":"富含β-胡蘿蔔素、維生素C及葉酸，皮含豐富纖維。","relief_symptoms":"美白抗氧化,幫助消化/解膩,順暢排便","relief_mechanism":"β-胡蘿蔔素轉化維生素A護膚；酸甜生津開胃。","scenario":"懶人免動刀,低卡減負,酸甜開胃,家庭分享","trivia":"只有冬天到春天吃得到，皮厚是因為要鎖住特殊香氣。"}'::jsonb,
  '{"appearance":"果色金黃橙亮","detail":"蒂頭翠綠","tactile":"手感結實，果皮較一般紅番茄厚","sense":"帶有淡淡柳橙香氣","storage":"常溫通風保存，冷藏會影響風味","texture_desc":"果皮較厚實Q彈，肉質紮實，有嚼勁"}'::jsonb,
  ARRAY['橙蜜香','黃番茄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'tomato_saint',
  '聖女小番茄',
  '小番茄',
  '[10,9,8,6,4,2,0,0,0,2,6,9]'::jsonb,
  '{"name_en":"Saint Tomato","is_premium":false,"is_common":true,"tagline":"古早味小番茄，酸甜有致，皮脆汁多","color":"#FF4500","keywords":"聖女,紅番茄","brix":9,"acidity":5,"calories":32,"gi_value":30,"price_level":2,"energy_index":-1,"moisture":8,"aroma":3,"origin":"國產","best_origin":"台南鹽水","skin_edible":"Yes","seed_edible":"Swallow","good_for":"減重、缺乏維C","bad_for":"胃潰瘍、生理期","safety_warning":"無特殊高風險","nutritional_value":"茄紅素含量高，富含膳食纖維與維生素C。","relief_symptoms":"美白抗氧化,順暢排便","relief_mechanism":"茄紅素抗氧化；纖維助排便。","scenario":"低卡減負,懷舊古早味,懶人免動刀","trivia":"聖女其實是老品種，現在市面上很多是改良的「小女」或「玉女」。"}'::jsonb,
  '{"appearance":"果形長圓，顏色鮮紅","detail":"蒂頭完整","tactile":"手感硬實","sense":"無特殊香氣，檢查有無裂果","storage":"常溫或冷藏皆可","texture_desc":"口感脆硬，皮較厚，酸甜比明顯"}'::jsonb,
  ARRAY['聖女','紅番茄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'tomato_rosy',
  '玉女小番茄',
  '小番茄',
  '[10,10,9,8,6,3,1,1,2,5,8,10]'::jsonb,
  '{"name_en":"Rosy Tomato","is_premium":true,"is_common":false,"tagline":"皮薄爆漿的紅色珍珠，洗乾淨就能吃的懶人維他命","color":"#DC143C","keywords":"玉女,甘仔蜜,紅番茄","brix":11,"acidity":4,"calories":30,"gi_value":30,"price_level":3,"energy_index":-1,"moisture":9,"aroma":2,"origin":"國產","best_origin":"嘉義六腳","skin_edible":"Yes","seed_edible":"Swallow","good_for":"口乾舌燥、食慾不振、減重","bad_for":"體質虛寒、容易胃痛者(生食易刺激)","safety_warning":"**慢性腎臟病 (限鉀)**：番茄鉀含量較高，腎友需川燙去除鉀離子或限量。","nutritional_value":"富含茄紅素（Lycopene）、維生素C及膳食纖維，抗氧化力強。","relief_symptoms":"美白抗氧化,順暢排便,血壓調節","relief_mechanism":"茄紅素抗氧化保護血管；低GI低熱量助代謝。","scenario":"懶人免動刀,低卡減負,美顏補氣,家庭分享","trivia":"玉女番茄皮薄到幾乎感覺不到，所以很容易裂果，種植難度高。"}'::jsonb,
  '{"appearance":"果色鮮紅均勻，無綠肩","detail":"蒂頭宿存萼片要翠綠，枯黃代表久放","tactile":"果實飽滿緊實，按壓不軟塌","sense":"無特殊香氣，檢查有無裂果","storage":"冷藏保存，蒂頭若自行脫落代表過熟，需盡快吃完","texture_desc":"皮極薄，咬下爆漿，肉質細緻"}'::jsonb,
  ARRAY['玉女','甘仔蜜','紅番茄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'papaya_tainung2',
  '台農二號木瓜',
  '木瓜',
  '[7,7,7,8,9,9,9,9,9,8,8,7]'::jsonb,
  '{"name_en":"Tainung No. 2 Papaya","is_premium":false,"is_common":true,"tagline":"肉紅味甜，台灣最常見的木瓜","color":"#FF8C00","keywords":"木瓜","brix":12,"acidity":1,"calories":38,"gi_value":55,"price_level":2,"energy_index":1,"moisture":7,"aroma":6,"origin":"國產","best_origin":"屏東高樹","skin_edible":"No","seed_edible":"No","good_for":"消化不良、胃痛（適量）、產後缺乳","bad_for":"孕婦（生食）、體質偏寒","safety_warning":"無特殊高風險","nutritional_value":"富含木瓜酵素、維生素A、C及β-胡蘿蔔素。","relief_symptoms":"幫助消化/解膩,順暢排便,美白抗氧化","relief_mechanism":"木瓜酵素助蛋白質分解；纖維助排便。","scenario":"順暢排空,軟糯好咬","trivia":"木瓜酵素有助於消化蛋白質，飯後吃最好。"}'::jsonb,
  '{"appearance":"果皮轉黃（5溝黃即可）","detail":"果肚飽滿，無畸形","tactile":"按壓溝槽微軟（代表熟）","sense":"無腐爛味，蒂頭無白黴","storage":"室溫催熟至全黃冷藏","texture_desc":"肉質細緻，口感軟嫩，香甜"}'::jsonb,
  ARRAY['木瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'papaya_sunrise',
  '日昇木瓜',
  '木瓜',
  '[6,6,6,7,8,9,9,9,8,7,6,6]'::jsonb,
  '{"name_en":"Sunrise Papaya","is_premium":true,"is_common":false,"tagline":"個頭小，香氣濃郁，甜度極高","color":"#FFA500","keywords":"網室木瓜","brix":14,"acidity":1,"calories":42,"gi_value":58,"price_level":3,"energy_index":1,"moisture":7,"aroma":7,"origin":"國產","best_origin":"台南大內","skin_edible":"No","seed_edible":"No","good_for":"肉食積滯、便秘","bad_for":"孕婦（生食）","safety_warning":"無特殊高風險","nutritional_value":"香氣濃，維生素A與鉀含量豐富。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"酵素含量豐富，適合單人食用解膩。","scenario":"懶人免動刀,老饕最愛","trivia":"雖然小顆，但香氣跟甜度通常比大木瓜更好。"}'::jsonb,
  '{"appearance":"體型小巧，兩頭尖","detail":"果皮光滑，轉色均勻","tactile":"肉質細緻，手感軟","sense":"獨特花香，聞蒂頭最準","storage":"室溫催熟後冷藏","texture_desc":"肉質極細，口感綿密，香氣濃"}'::jsonb,
  ARRAY['網室木瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'papaya_red_lady',
  '紅妃木瓜',
  '木瓜',
  '[7,7,7,8,9,9,9,9,9,8,8,7]'::jsonb,
  '{"name_en":"Red Lady Papaya","is_premium":false,"is_common":false,"tagline":"果實碩大肉厚，產量高","color":"#FF4500","keywords":"大木瓜","brix":11,"acidity":1,"calories":40,"gi_value":52,"price_level":2,"energy_index":1,"moisture":8,"aroma":4,"origin":"國產","best_origin":"高雄杉林","skin_edible":"No","seed_edible":"No","good_for":"便秘、消化不良","bad_for":"腹瀉、孕婦","safety_warning":"無特殊高風險","nutritional_value":"果肉紅，茄紅素與β-胡蘿蔔素含量高。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"紅肉富含β-胡蘿蔔素與維生素A。","scenario":"家庭分享,料理加工","trivia":"因為很大顆肉又厚，通常用來打木瓜牛奶。"}'::jsonb,
  '{"appearance":"體型巨大（可達3斤）","detail":"肉厚籽少，果皮厚","tactile":"口感紮實，不軟爛","sense":"甜度中等，檢查有無壓傷","storage":"室溫催熟後冷藏","texture_desc":"肉厚紮實，口感較硬，汁多"}'::jsonb,
  ARRAY['大木瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'papaya_green',
  '青木瓜',
  '木瓜',
  '[8,8,8,9,10,10,10,10,10,9,8,8]'::jsonb,
  '{"name_en":"Green Papaya","is_premium":false,"is_common":false,"tagline":"未熟木瓜，涼拌燉湯專用","color":"#32CD32","keywords":"生木瓜","brix":4,"acidity":5,"calories":28,"gi_value":30,"price_level":1,"energy_index":-1,"moisture":6,"aroma":2,"origin":"國產","best_origin":"屏東長治","skin_edible":"No","seed_edible":"No","good_for":"產後乳汁不足、跌打損傷","bad_for":"孕婦（含收縮成分）、胃寒","safety_warning":"無特殊高風險","nutritional_value":"木瓜酵素含量最高，有助蛋白質分解，適合燉湯涼拌。","relief_symptoms":"幫助消化/解膩,補氣血/暖身","relief_mechanism":"酵素含量最高，燉湯可通乳與助消化。","scenario":"料理加工,特殊護理","trivia":"青木瓜不是品種，是木瓜還沒熟的狀態，富含木瓜酵素。"}'::jsonb,
  '{"appearance":"果皮青綠，無黃斑","detail":"果肉硬白，按壓不軟","tactile":"無斑點，手感硬","sense":"無香氣，檢查表皮有無蟲咬","storage":"冷藏保存","texture_desc":"口感硬脆，適合涼拌，無甜味"}'::jsonb,
  ARRAY['生木瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'dragonfruit_red',
  '紅肉火龍果',
  '火龍果',
  '[1,0,0,1,5,9,10,10,9,8,6,3]'::jsonb,
  '{"name_en":"Red Pitaya","is_premium":false,"is_common":true,"tagline":"含甜菜紅素，抗氧化通便神物","color":"#C71585","keywords":"火龍果,仙蜜果","brix":18,"acidity":1,"calories":50,"gi_value":50,"price_level":2,"energy_index":-1,"moisture":8,"aroma":3,"origin":"國產","best_origin":"彰化二林","skin_edible":"No","seed_edible":"Swallow","good_for":"嚴重便秘、貧血、高血壓","bad_for":"腹瀉、生理期、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"富含甜菜紅素（Betalain），具抗氧化與潤腸通便效果。","relief_symptoms":"順暢排便,血壓調節,抗發炎/免疫調節","relief_mechanism":"種子與果肉纖維促進強烈蠕動；甜菜紅素抗氧化護血管。","scenario":"順暢排空,美顏補氣","trivia":"吃完隔天排泄物會變紅色是正常的，不要嚇到報警。"}'::jsonb,
  '{"appearance":"鱗片短且密集","detail":"果身圓潤，鱗片紅","tactile":"甜度高，手感軟","sense":"無特殊香氣，檢查鱗片有無腐爛","storage":"冷藏保存","texture_desc":"口感軟糯，汁多，甜度高"}'::jsonb,
  ARRAY['火龍果','仙蜜果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'dragonfruit_white',
  '白肉火龍果',
  '火龍果',
  '[1,0,0,1,4,8,10,10,9,8,5,2]'::jsonb,
  '{"name_en":"White Pitaya","is_premium":false,"is_common":false,"tagline":"膳食纖維豐富，口感爽脆清甜","color":"#FFFAF0","keywords":"火龍果","brix":12,"acidity":2,"calories":51,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":8,"aroma":2,"origin":"國產","best_origin":"南投集集","skin_edible":"No","seed_edible":"Swallow","good_for":"便秘、糖尿病（控糖）、燥熱","bad_for":"脾胃虛寒、經期","safety_warning":"無特殊高風險","nutritional_value":"膳食纖維含量略高於紅肉，富含鉀與維生素C。","relief_symptoms":"順暢排便,血壓調節","relief_mechanism":"膳食纖維含量略高於紅肉，通便效果佳。","scenario":"順暢排空,低卡減負","trivia":"白肉的纖維比紅肉多，紅肉的甜度比白肉高。"}'::jsonb,
  '{"appearance":"鱗片長且綠","detail":"果身橢圓","tactile":"口感爽脆","sense":"帶有草香味，檢查底部有無發霉","storage":"冷藏保存","texture_desc":"口感爽脆，帶有嚼勁，清甜"}'::jsonb,
  ARRAY['火龍果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'dragonfruit_yellow',
  '麒麟果',
  '火龍果',
  '[3,2,1,1,3,6,9,10,9,7,5,4]'::jsonb,
  '{"name_en":"Yellow Pitaya","is_premium":true,"is_common":false,"tagline":"黃皮白肉，口感像燕窩，滑嫩清甜","color":"#FFD700","keywords":"黃皮火龍果,燕窩果","brix":20,"acidity":1,"calories":55,"gi_value":55,"price_level":5,"energy_index":-1,"moisture":7,"aroma":4,"origin":"國產","best_origin":"南投名間","skin_edible":"No","seed_edible":"Swallow","good_for":"頑固型便秘、免疫力差","bad_for":"腹瀉（滑腸）、體虛","safety_warning":"**強力通便**。","nutritional_value":"種子大且多，促進腸道蠕動效果極強，富含維生素C。","relief_symptoms":"順暢排便,補水/消水腫","relief_mechanism":"種子大且多，促進腸道蠕動效果極強。","scenario":"順暢排空,體面送禮","trivia":"又稱「燕窩果」，通便效果非常強烈，建議一次不要吃太多。"}'::jsonb,
  '{"appearance":"果皮黃色有刺（或已去刺）","detail":"果肉透明，種子大","tactile":"口感滑溜，手感軟","sense":"清甜無酸，檢查有無黑斑","storage":"冷藏保存","texture_desc":"口感滑溜，像燕窩，肉質細緻"}'::jsonb,
  ARRAY['黃皮火龍果','燕窩果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'dragonfruit_bicolor',
  '雙色火龍果',
  '火龍果',
  '[1,0,0,1,4,8,10,10,9,8,5,2]'::jsonb,
  '{"name_en":"Bi-color Pitaya","is_premium":false,"is_common":false,"tagline":"紅白漸層果肉，兼具脆與甜","color":"#FF69B4","keywords":"漸層火龍果","brix":15,"acidity":2,"calories":50,"gi_value":48,"price_level":3,"energy_index":-1,"moisture":8,"aroma":3,"origin":"國產","best_origin":"彰化二林","skin_edible":"No","seed_edible":"Swallow","good_for":"便秘、火氣大","bad_for":"腹瀉、體寒","safety_warning":"無特殊高風險","nutritional_value":"兼具紅白肉營養，含有甜菜紅素與膳食纖維。","relief_symptoms":"順暢排便,護眼明目","relief_mechanism":"兼具紅白肉優點，高纖通便。","scenario":"稀有嘗鮮","trivia":"是白肉跟紅肉雜交的品種，切開非常漂亮。"}'::jsonb,
  '{"appearance":"外觀似紅肉","detail":"切開紅白相間","tactile":"口感脆甜","sense":"無特殊香氣，檢查鱗片完整度","storage":"冷藏保存","texture_desc":"兼具脆與軟的口感，層次豐富"}'::jsonb,
  ARRAY['漸層火龍果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_musk',
  '網紋洋香瓜',
  '瓜類',
  '[6,4,3,5,7,9,10,8,6,5,7,8]'::jsonb,
  '{"name_en":"Muskmelon","is_premium":false,"is_common":false,"tagline":"如藝術品般的網紋，果肉軟濡香甜","color":"#90EE90","keywords":"哈密瓜(俗稱)","brix":15,"acidity":1,"calories":38,"gi_value":65,"price_level":4,"energy_index":-1,"moisture":8,"aroma":8,"origin":"進口","best_origin":"日本靜岡","skin_edible":"No","seed_edible":"Yes","good_for":"暑熱煩渴、小便不利","bad_for":"產後、病後虛弱、腹瀉","safety_warning":"**高糖警示**。","nutritional_value":"富含維生素A（β-胡蘿蔔素）、維生素C及鉀。","relief_symptoms":"補水/消水腫,血壓調節,順暢排便","relief_mechanism":"高鉀含量有助於排除鈉離子。","scenario":"體面送禮,螞蟻人","trivia":"日本阿伯勒（Earl''s）品種是最高等級，一株只留一顆果。"}'::jsonb,
  '{"appearance":"網紋立體密集（越密越好）","detail":"蒂頭呈現T字形","tactile":"底部按壓微軟（代表熟）","sense":"濃郁奶香，聞蒂頭最準","storage":"室溫後熟至底部微軟冷藏","texture_desc":"肉質軟糯，入口即化，汁多味甜"}'::jsonb,
  ARRAY['哈密瓜(俗稱)']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_earls',
  '阿魯斯哈密瓜',
  '瓜類',
  '[5,3,2,4,6,8,10,8,6,4,6,7]'::jsonb,
  '{"name_en":"Earl''s Melon","is_premium":true,"is_common":false,"tagline":"哈密瓜界的愛馬仕，入口即化","color":"#98FB98","keywords":"日本哈密瓜","brix":16,"acidity":1,"calories":40,"gi_value":65,"price_level":5,"energy_index":-1,"moisture":9,"aroma":9,"origin":"進口","best_origin":"日本靜岡","skin_edible":"No","seed_edible":"Yes","good_for":"煩熱口乾、便秘","bad_for":"脾胃虛寒、腳氣病","safety_warning":"無特殊高風險","nutritional_value":"肉質細緻，富含胺基酸（GABA）、維生素C及鉀。","relief_symptoms":"補水/消水腫,舒壓助眠,血壓調節","relief_mechanism":"含有GABA（氨基丁酸），有助放鬆神經。","scenario":"體面送禮,老饕最愛,螞蟻人","trivia":"在日本，完美的阿魯斯哈密瓜會被用來當作探病的高級禮品。"}'::jsonb,
  '{"appearance":"網紋極度立體，分布均勻","detail":"T字蒂頭飽滿翠綠","tactile":"手感沉重","sense":"麝香濃郁，檢查底部有無發霉","storage":"室溫後熟後冷藏","texture_desc":"口感綿密，如冰淇淋般融化，極致軟嫩"}'::jsonb,
  ARRAY['日本哈密瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_honeydew',
  '光皮洋香瓜',
  '瓜類',
  '[3,2,4,7,9,10,9,6,3,2,2,2]'::jsonb,
  '{"name_en":"Honeydew Melon","is_premium":false,"is_common":false,"tagline":"表皮光滑如玉，口感脆甜清爽","color":"#F0FFF0","keywords":"白蘭瓜,美濃瓜","brix":14,"acidity":1,"calories":36,"gi_value":60,"price_level":2,"energy_index":-1,"moisture":8,"aroma":5,"origin":"國產","best_origin":"台南東山","skin_edible":"No","seed_edible":"Yes","good_for":"口臭、便秘、水腫","bad_for":"腹瀉、體寒","safety_warning":"無特殊高風險","nutritional_value":"果肉多為綠色或白色，富含維生素C與鉀，維生素A較紅肉瓜少。","relief_symptoms":"補水/消水腫,順暢排便","relief_mechanism":"水分與纖維幫助軟化糞便。","scenario":"酸甜開胃,家庭分享","trivia":"跟網紋哈密瓜不同，光皮瓜通常吃起來比較脆。"}'::jsonb,
  '{"appearance":"果皮光滑無傷","detail":"顏色白皙微黃","tactile":"按壓微軟（可食）","sense":"清香淡雅，無發酵味","storage":"冷藏保存","texture_desc":"口感脆甜，肉質紮實，不軟爛"}'::jsonb,
  ARRAY['白蘭瓜','美濃瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_hami',
  '新疆哈密瓜',
  '瓜類',
  '[2,1,0,0,0,1,5,9,10,8,4,1]'::jsonb,
  '{"name_en":"Hami Melon","is_premium":false,"is_common":false,"tagline":"梭子型外觀，口感脆甜帶奶香","color":"#FFA07A","keywords":"哈密瓜","brix":17,"acidity":1,"calories":45,"gi_value":68,"price_level":3,"energy_index":-1,"moisture":6,"aroma":7,"origin":"國產","best_origin":"中國新疆","skin_edible":"No","seed_edible":"Yes","good_for":"貧血、腎病（需鉀者）、便秘","bad_for":"糖尿病、腳氣病、腹脹","safety_warning":"**高糖警示**。","nutritional_value":"果肉橘紅，富含β-胡蘿蔔素、維生素C及糖分。","relief_symptoms":"補水/消水腫,血壓調節","relief_mechanism":"橘肉富含β-胡蘿蔔素，轉化為維生素A補血護眼。","scenario":"螞蟻人,家庭分享","trivia":"古時候是進貢給清朝皇帝的貢瓜，故名哈密瓜。"}'::jsonb,
  '{"appearance":"果形長橢圓","detail":"網紋稀疏，底色金黃","tactile":"果身硬實","sense":"獨特哈密瓜香，檢查有無軟爛","storage":"室溫保存","texture_desc":"口感極脆，肉質硬實，甜度高"}'::jsonb,
  ARRAY['哈密瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_honey_world',
  '狀元瓜',
  '瓜類',
  '[2,2,4,7,9,10,8,5,2,1,1,1]'::jsonb,
  '{"name_en":"Honey World Melon","is_premium":false,"is_common":false,"tagline":"白皮網紋，肉質細緻，甜度穩定","color":"#FFFFE0","keywords":"網紋瓜","brix":15,"acidity":1,"calories":38,"gi_value":65,"price_level":2,"energy_index":-1,"moisture":8,"aroma":6,"origin":"國產","best_origin":"嘉義太保","skin_edible":"No","seed_edible":"Yes","good_for":"暑熱、口乾","bad_for":"體寒、頻尿","safety_warning":"無特殊高風險","nutritional_value":"糖度穩定，含有維生素C、B群及礦物質。","relief_symptoms":"補水/消水腫,順暢排便","relief_mechanism":"高水分與鉀助代謝。","scenario":"家庭分享","trivia":"因為容易栽培且產量穩，有「狀元」之美稱。"}'::jsonb,
  '{"appearance":"果皮白色帶稀疏網紋","detail":"果形圓潤，大小適中","tactile":"蒂頭乾燥","sense":"清甜多汁，檢查有無裂果","storage":"冷藏保存","texture_desc":"肉質細緻，口感脆甜，汁多"}'::jsonb,
  ARRAY['網紋瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_oriental',
  '美濃瓜',
  '瓜類',
  '[1,1,3,7,9,10,9,6,3,1,1,1]'::jsonb,
  '{"name_en":"Oriental Melon","is_premium":false,"is_common":true,"tagline":"皮薄可吃，香甜多汁的東方甜瓜","color":"#F5F5DC","keywords":"香瓜,梨仔瓜","brix":14,"acidity":1,"calories":35,"gi_value":60,"price_level":2,"energy_index":-1,"moisture":8,"aroma":8,"origin":"國產","best_origin":"嘉義民雄","skin_edible":"Yes","seed_edible":"Yes","good_for":"便秘、中暑、口渴","bad_for":"生理期、脾虛便溏","safety_warning":"無特殊高風險","nutritional_value":"香氣濃，連皮籽食用可攝取更多纖維與維生素C。","relief_symptoms":"補水/消水腫,順暢排便,解酒/宿醉","relief_mechanism":"連籽吃纖維更高，瓜蒂處含苦味素催吐（古法，慎用）。","scenario":"懷舊古早味,生津解渴","trivia":"美濃瓜如果不削皮，皮的營養價值其實很高。"}'::jsonb,
  '{"appearance":"果皮銀白微黃","detail":"底部臍平（代表熟）","tactile":"手感沉重","sense":"香氣濃烈，聞底部最準","storage":"室溫放至聞到香氣後冷藏","texture_desc":"肉質細緻，口感香甜軟濡，汁多"}'::jsonb,
  ARRAY['香瓜','梨仔瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_korean',
  '韓國香瓜',
  '瓜類',
  '[1,1,3,7,9,10,9,6,3,1,1,1]'::jsonb,
  '{"name_en":"Korean Melon","is_premium":false,"is_common":false,"tagline":"金黃外皮白條紋，口感像梨子般脆","color":"#FFFF00","keywords":"香瓜","brix":14,"acidity":1,"calories":34,"gi_value":60,"price_level":3,"energy_index":-1,"moisture":7,"aroma":6,"origin":"進口","best_origin":"韓國星州","skin_edible":"Yes","seed_edible":"Yes","good_for":"水腫、暑熱","bad_for":"體寒、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"富含鈣、磷及維生素C，種子含有亞麻油酸。","relief_symptoms":"補水/消水腫,順暢排便","relief_mechanism":"食用種子可增加纖維與亞麻油酸攝取。","scenario":"稀有嘗鮮","trivia":"在韓國連籽都會一起吃，據說對腸胃好。"}'::jsonb,
  '{"appearance":"黃皮白條紋（間隔明顯）","detail":"果形小巧，蒂頭鮮","tactile":"手感硬實","sense":"香氣特殊，檢查溝槽有無變黑","storage":"冷藏保存","texture_desc":"口感像梨子般脆硬，肉質紮實"}'::jsonb,
  ARRAY['香瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'melon_aurora',
  '卡蜜拉哈密瓜',
  '瓜類',
  '[3,2,4,7,9,10,9,6,3,4,6,5]'::jsonb,
  '{"name_en":"Aurora Melon","is_premium":true,"is_common":false,"tagline":"瓜界愛馬仕，皮薄如紙，整顆可吃","color":"#FFA500","keywords":"嘉義極光","brix":16,"acidity":1,"calories":38,"gi_value":65,"price_level":4,"energy_index":-1,"moisture":6,"aroma":5,"origin":"國產","best_origin":"嘉義極光","skin_edible":"Yes","seed_edible":"Yes","good_for":"煩熱口渴、便秘","bad_for":"脾胃虛寒、拉肚子","safety_warning":"無特殊高風險","nutritional_value":"口感脆甜，富含膳食纖維、維生素C及鉀。","relief_symptoms":"補水/消水腫,順暢排便","relief_mechanism":"口感脆纖維足，促進腸胃蠕動。","scenario":"體面送禮,螞蟻人","trivia":"嘉義極光（Aurora）是專屬商標，有身分證的哈密瓜。"}'::jsonb,
  '{"appearance":"網紋細緻，分佈均勻","detail":"皮極薄，看得到果肉色","tactile":"口感像水梨般硬脆","sense":"有特殊焦糖香，檢查有無撞傷","storage":"冷藏保存","texture_desc":"口感極脆，像吃水梨，肉質細緻"}'::jsonb,
  ARRAY['嘉義極光']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pepino_melon',
  '人蔘果',
  '瓜類',
  '[2,3,5,7,8,7,5,4,4,5,6,4]'::jsonb,
  '{"name_en":"Pepino Melon","is_premium":false,"is_common":false,"tagline":"低糖高水份，帶有淡淡哈密瓜香氣","color":"#FFFACD","keywords":"香瓜茄,仙果","brix":6,"acidity":1,"calories":27,"gi_value":25,"price_level":3,"energy_index":-1,"moisture":9,"aroma":6,"origin":"國產","best_origin":"澎湖","skin_edible":"Yes","seed_edible":"Swallow","good_for":"糖尿病、口乾舌燥、水腫","bad_for":"頻尿、體寒","safety_warning":"無特殊高風險","nutritional_value":"低糖低卡，富含鉀與維生素C，適合需控糖者食用。","relief_symptoms":"補水/消水腫,血壓調節","relief_mechanism":"高鉀低鈉助排水；低糖適合控糖族群。","scenario":"低卡減負,稀有嘗鮮,軟糯好咬,生津解渴","trivia":"雖然叫人蔘果，但跟人蔘完全沒關係，是茄科植物。"}'::jsonb,
  '{"appearance":"果皮金黃帶紫色條紋","detail":"表皮光滑","tactile":"按壓微軟","sense":"淡雅的瓜果香","storage":"常溫後熟，變軟更香甜","texture_desc":"口感像哈密瓜加小黃瓜，軟嫩多汁"}'::jsonb,
  ARRAY['香瓜茄','仙果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'sugarcane_red',
  '紅甘蔗',
  '甘蔗',
  '[9,10,9,8,5,2,1,1,2,5,8,9]'::jsonb,
  '{"name_en":"Red Sugarcane","is_premium":false,"is_common":true,"tagline":"啃食專用，汁多清甜，考驗牙齒","color":"#8B0000","keywords":"甘蔗","brix":18,"acidity":1,"calories":58,"gi_value":60,"price_level":1,"energy_index":0,"moisture":6,"aroma":4,"origin":"國產","best_origin":"南投埔里","skin_edible":"No","seed_edible":"No","good_for":"口乾舌燥、大便乾結、反胃嘔吐","bad_for":"糖尿病、胃寒嘔吐","safety_warning":"**高糖警示**。","nutritional_value":"主要提供蔗糖，含有鐵、鈣、磷及維生素B群。","relief_symptoms":"潤喉養肺,解酒/宿醉,順暢排便","relief_mechanism":"甘涼滋潤，生津解酒，潤喉。","scenario":"生津解渴","trivia":"烤過的甘蔗汁可以止咳化痰，是古老的偏方。"}'::jsonb,
  '{"appearance":"皮色紫紅有粉","detail":"節間長，粗細均勻","tactile":"切口新鮮，無紅心（病變）","sense":"汁多味甜，檢查表皮有無蟲蛀","storage":"切段冷藏","texture_desc":"肉質硬脆，纖維粗，汁多味甜"}'::jsonb,
  ARRAY['甘蔗']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'passionfruit_tainung1',
  '台農一號百香果',
  '百香果',
  '[2,1,1,3,5,7,10,10,10,9,8,4]'::jsonb,
  '{"name_en":"Tainung No. 1 Passion Fruit","is_premium":false,"is_common":true,"tagline":"紫紅色外皮，酸甜香氣炸彈","color":"#800080","keywords":"百香果,時計果","brix":17,"acidity":9,"calories":66,"gi_value":45,"price_level":2,"energy_index":0,"moisture":8,"aroma":10,"origin":"國產","best_origin":"南投埔里","skin_edible":"No","seed_edible":"Swallow","good_for":"咽喉炎、便秘、食慾不振","bad_for":"胃潰瘍、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"富含維生素A、C、鎂、磷、鐵及膳食纖維（種子）。","relief_symptoms":"順暢排便,舒壓助眠,美白抗氧化","relief_mechanism":"種子富含纖維；維生素A與類黃酮護眼。","scenario":"料理加工,酸甜開胃","trivia":"百香果放越久皮越皺，酸度會降低，甜度會跑出來。"}'::jsonb,
  '{"appearance":"果皮紫紅均勻","detail":"拿起來沉甸甸（水多）","tactile":"搖晃無水聲（果肉分離）","sense":"香氣濃烈，皮皺更甜","storage":"通風保存，皮皺更甜","texture_desc":"果肉為膠狀囊泡，口感滑順酸甜"}'::jsonb,
  ARRAY['百香果','時計果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'passionfruit_golden',
  '黃金百香果',
  '百香果',
  '[1,0,0,1,4,7,10,10,9,8,5,2]'::jsonb,
  '{"name_en":"Golden Passion Fruit","is_premium":true,"is_common":false,"tagline":"甜度高酸度低，帶有濃郁花香","color":"#FFD700","keywords":"甜百香","brix":18,"acidity":6,"calories":68,"gi_value":48,"price_level":3,"energy_index":0,"moisture":8,"aroma":9,"origin":"國產","best_origin":"台中新社","skin_edible":"No","seed_edible":"Swallow","good_for":"焦慮失眠、便秘","bad_for":"糖尿病、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"酸度低，維生素C與類黃酮含量豐富。","relief_symptoms":"順暢排便,美白抗氧化,護眼明目","relief_mechanism":"香氣與甜味舒緩情緒；纖維助排便。","scenario":"螞蟻人","trivia":"切開直接吃也不會覺得酸，是百香果界的甜點。"}'::jsonb,
  '{"appearance":"果皮金黃色","detail":"果形較大，蒂頭綠","tactile":"甜度極高，無酸味","sense":"有芭樂+花香，檢查果皮有無發霉","storage":"冷藏保存","texture_desc":"果肉飽滿，汁多味甜，無酸感"}'::jsonb,
  ARRAY['甜百香']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'passionfruit_starry',
  '滿天星百香果',
  '百香果',
  '[1,0,0,1,4,7,10,10,9,8,5,2]'::jsonb,
  '{"name_en":"Starry Passion Fruit","is_premium":true,"is_common":false,"tagline":"外皮有斑點，甜度高，口感滑順","color":"#C71585","keywords":"蜜糖百香","brix":17,"acidity":4,"calories":67,"gi_value":48,"price_level":3,"energy_index":0,"moisture":8,"aroma":7,"origin":"國產","best_origin":"南投埔里","skin_edible":"No","seed_edible":"Swallow","good_for":"視力疲勞、便秘","bad_for":"胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"甜度高，含有維生素A、C及多種植化素。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"維生素A含量高。","scenario":"螞蟻人,稀有嘗鮮","trivia":"因為表皮有像星星一樣的斑點而得名，甜度比台農一號高。"}'::jsonb,
  '{"appearance":"果皮紫紅有白點","detail":"果粒飽滿，果皮厚","tactile":"幾乎無酸味","sense":"清甜口感，檢查果皮完整","storage":"冷藏保存","texture_desc":"口感滑順，甜度高，酸度低"}'::jsonb,
  ARRAY['蜜糖百香']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'watermelon_red',
  '大紅西瓜',
  '西瓜',
  '[2,1,2,5,8,10,10,9,6,4,2,1]'::jsonb,
  '{"name_en":"Red Watermelon","is_premium":false,"is_common":true,"tagline":"沙沙口感，消暑解渴第一名","color":"#FF6347","keywords":"西瓜,華寶","brix":11.5,"acidity":1,"calories":32,"gi_value":72,"price_level":1,"energy_index":-2,"moisture":10,"aroma":4,"origin":"國產","best_origin":"花蓮壽豐","skin_edible":"No","seed_edible":"No","good_for":"中暑發燒、口渴心煩、水腫","bad_for":"夜尿、生理期、脾胃虛寒","safety_warning":"**高GI警示**：血糖上升快。","nutritional_value":"富含茄紅素（Lycopene）、瓜胺酸及水分，利尿消水腫。","relief_symptoms":"補水/消水腫,解酒/宿醉,血壓調節","relief_mechanism":"瓜胺酸促進尿素代謝排水；水分解熱排毒。","scenario":"生津解渴,家庭分享","trivia":"西瓜底部的圈圈越小，代表皮越薄。"}'::jsonb,
  '{"appearance":"果皮花紋清晰","detail":"蒂頭捲曲乾燥（代表熟）","tactile":"拍打聲「咚咚」響（肉聲）","sense":"底部黃色區塊小（代表皮薄）","storage":"切開後需封保鮮膜冷藏","texture_desc":"口感沙沙的（沙瓤），水分極多，甜度高"}'::jsonb,
  ARRAY['西瓜','華寶']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'watermelon_yellow',
  '小玉西瓜',
  '西瓜',
  '[3,2,4,7,9,10,10,8,5,3,2,1]'::jsonb,
  '{"name_en":"Yellow Watermelon","is_premium":false,"is_common":false,"tagline":"口感細緻清甜，適合小家庭","color":"#FFFF00","keywords":"黃肉西瓜","brix":12,"acidity":1,"calories":30,"gi_value":72,"price_level":2,"energy_index":-2,"moisture":10,"aroma":4,"origin":"國產","best_origin":"雲林二崙","skin_edible":"No","seed_edible":"No","good_for":"暑熱煩渴、小便不利","bad_for":"體寒、腹瀉、糖尿病","safety_warning":"**高GI警示**。","nutritional_value":"含有葉黃素與β-胡蘿蔔素，水分豐富，鉀含量適中。","relief_symptoms":"補水/消水腫,解酒/宿醉,潤喉養肺","relief_mechanism":"鉀離子與瓜胺酸利尿降壓。","scenario":"生津解渴,家庭分享","trivia":"以前傳說黃肉是打針？當然是假的，那是品種不同（如新蘭）。"}'::jsonb,
  '{"appearance":"果形橢圓較小","detail":"條紋整齊清晰","tactile":"皮薄，拍打聲清脆","sense":"無特殊香氣，檢查有無裂痕","storage":"冷藏保存","texture_desc":"肉質細緻，口感脆甜，無沙感"}'::jsonb,
  ARRAY['黃肉西瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'watermelon_black_beauty',
  '黑美人西瓜',
  '西瓜',
  '[3,2,4,7,9,10,10,8,5,3,2,1]'::jsonb,
  '{"name_en":"Black Beauty Watermelon","is_premium":false,"is_common":false,"tagline":"皮黑肉紅，甜度高肉質緊實","color":"#2E8B57","keywords":"長西瓜","brix":13,"acidity":1,"calories":33,"gi_value":72,"price_level":1,"energy_index":-2,"moisture":9,"aroma":4,"origin":"國產","best_origin":"雲林崙背","skin_edible":"No","seed_edible":"No","good_for":"熱病津傷、咽痛","bad_for":"手腳冰冷、拉肚子","safety_warning":"**高GI警示**。","nutritional_value":"肉質緊實，糖分高，富含茄紅素與鉀。","relief_symptoms":"補水/消水腫,解酒/宿醉,血壓調節","relief_mechanism":"大量水分降火氣，改善因燥熱引起的口臭。","scenario":"生津解渴,家庭分享","trivia":"因為皮色深吸熱快，通常會比一般西瓜早熟。"}'::jsonb,
  '{"appearance":"果皮深綠近黑","detail":"果形長橢圓","tactile":"肉質不易崩裂","sense":"甜度穩定，檢查蒂頭是否乾燥","storage":"冷藏保存","texture_desc":"肉質緊實，口感脆，不易起沙"}'::jsonb,
  ARRAY['長西瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'watermelon_seedless',
  '無籽西瓜',
  '西瓜',
  '[2,1,2,5,8,10,10,9,6,4,2,1]'::jsonb,
  '{"name_en":"Seedless Watermelon","is_premium":false,"is_common":false,"tagline":"大口吃瓜不吐籽，懶人福音","color":"#FF4500","keywords":"無子西瓜","brix":12,"acidity":1,"calories":31,"gi_value":72,"price_level":2,"energy_index":-2,"moisture":10,"aroma":3,"origin":"國產","best_origin":"花蓮鳳林","skin_edible":"No","seed_edible":"None","good_for":"暑熱、水腫","bad_for":"體虛胃寒","safety_warning":"**高GI警示**。","nutritional_value":"方便食用，營養成分與紅西瓜相似，含茄紅素。","relief_symptoms":"補水/消水腫,解酒/宿醉","relief_mechanism":"方便食用，快速補充水分利尿。","scenario":"懶人免動刀,生津解渴","trivia":"無籽西瓜是透過「三倍體」技術培育的，不是基因改造。"}'::jsonb,
  '{"appearance":"果皮花紋較淡","detail":"果形圓滾","tactile":"拍打聲沉穩","sense":"無黑籽，檢查有無水傷","storage":"冷藏保存","texture_desc":"口感脆爽，無籽干擾，肉質細"}'::jsonb,
  ARRAY['無子西瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'watermelon_diana',
  '黛安娜西瓜',
  '西瓜',
  '[2,1,2,5,8,10,10,9,6,4,2,1]'::jsonb,
  '{"name_en":"Diana Watermelon","is_premium":true,"is_common":false,"tagline":"黃皮紅肉，視覺味覺雙重驚喜","color":"#FFD700","keywords":"黃皮西瓜","brix":12,"acidity":1,"calories":32,"gi_value":72,"price_level":3,"energy_index":-2,"moisture":9,"aroma":4,"origin":"國產","best_origin":"雲林二崙","skin_edible":"No","seed_edible":"No","good_for":"心煩口渴、尿黃","bad_for":"生理期、易腹瀉","safety_warning":"**高GI警示**。","nutritional_value":"黃皮紅肉，含有茄紅素與類胡蘿蔔素，水分充足。","relief_symptoms":"補水/消水腫,美白抗氧化","relief_mechanism":"含有類胡蘿蔔素，維持黏膜健康。","scenario":"稀有嘗鮮,體面送禮","trivia":"以黛安娜王妃命名，外表貴氣十足。"}'::jsonb,
  '{"appearance":"果皮金黃色","detail":"表皮光滑無傷","tactile":"皮薄，拍打聲響亮","sense":"清甜爽口，檢查果皮有無斑點","storage":"冷藏保存","texture_desc":"肉質細緻，口感清爽，水分多"}'::jsonb,
  ARRAY['黃皮西瓜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_irwin',
  '愛文芒果',
  '芒果',
  '[0,0,1,3,8,10,8,2,0,0,0,0]'::jsonb,
  '{"name_en":"Irwin Mango","is_premium":false,"is_common":true,"tagline":"夏日的紅寶石，香氣最濃郁的經典滋味","color":"#FF4500","keywords":"檨仔,芒果,Apple Mango","brix":15,"acidity":4,"calories":42,"gi_value":55,"price_level":3,"energy_index":1,"moisture":8,"aroma":10,"origin":"國產","best_origin":"台南玉井","skin_edible":"No","seed_edible":"No","good_for":"暈車嘔吐、食慾不振、口乾舌燥","bad_for":"皮膚過敏、濕疹、傷口未癒合（發物）","safety_warning":"**過敏源 (漆酚)**：果皮含漆酚，易引發接觸性皮膚炎。","nutritional_value":"富含維生素A與β-胡蘿蔔素，有助維持暗處視覺；含有維生素C及膳食纖維。","relief_symptoms":"幫助消化/解膩,護眼明目,美白抗氧化","relief_mechanism":"富含β-胡蘿蔔素與維生素A，有助視網膜健康；酸甜口感促進唾液分泌。","scenario":"生津解渴,體面送禮,酸甜開胃","trivia":"愛文其實是美國佛羅里達引進的品種，卻在台灣發光發熱。"}'::jsonb,
  '{"appearance":"果皮油亮深紅，無黑斑","detail":"蒂頭周圍有黃色果膠滲出（蜜）","tactile":"輕按果身有彈性，不可過軟","sense":"聞蒂頭處，要有濃郁的芒果香氣","storage":"室溫催熟至香氣散發，變軟後冷藏","texture_desc":"肉質細緻，幾乎無纖維，口感軟嫩多汁"}'::jsonb,
  ARRAY['檨仔','芒果','Apple Mango']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_jinhuan',
  '金煌芒果',
  '芒果',
  '[0,0,0,2,6,9,10,5,1,0,0,0]'::jsonb,
  '{"name_en":"Jin Huan Mango","is_premium":false,"is_common":false,"tagline":"芒果界的巨無霸，口感Q彈無纖維","color":"#FFD700","keywords":"檨仔,大芒果","brix":16.5,"acidity":2,"calories":59,"gi_value":60,"price_level":2,"energy_index":0,"moisture":7,"aroma":5,"origin":"國產","best_origin":"高雄六龜","skin_edible":"No","seed_edible":"No","good_for":"腸燥便秘、津液不足、胃陰虛","bad_for":"糖尿病（升糖快）、易脹氣、過敏體質","safety_warning":"**糖尿病 (高糖)**：單顆糖分極高，建議切塊分食。","nutritional_value":"果肉纖維細緻，富含碳水化合物與維生素A，鉀含量中等。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"纖維質與果膠含量豐富，能促進腸道蠕動。","scenario":"生津解渴,家庭分享,螞蟻人","trivia":"由台灣六龜果農黃金煌先生培育，是第一個本土芒果品種。"}'::jsonb,
  '{"appearance":"果皮金黃均勻，無大塊黑斑","detail":"尾端稍微轉黃（非青色）","tactile":"摸起來像木瓜一樣微軟","sense":"無特殊香氣，重點檢查果皮是否完整無撞傷","storage":"必須室溫催熟至微軟，再放入冰箱","texture_desc":"口感Q彈，肉厚紮實，纖維極少"}'::jsonb,
  ARRAY['檨仔','大芒果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_native',
  '土芒果',
  '芒果',
  '[0,1,3,8,9,5,1,0,0,0,0,0]'::jsonb,
  '{"name_en":"Native Mango","is_premium":false,"is_common":false,"tagline":"童年的懷舊滋味，香氣是所有芒果之冠","color":"#9ACD32","keywords":"檨仔,土檨仔,情人果原料","brix":13,"acidity":8,"calories":53,"gi_value":50,"price_level":2,"energy_index":1,"moisture":9,"aroma":9,"origin":"國產","best_origin":"屏東鹽埔","skin_edible":"Bitter","seed_edible":"No","good_for":"胃氣虛弱、暈車暈船、消化不良","bad_for":"氣喘、皮膚病、過敏體質","safety_warning":"**過敏源**：建議剝皮切塊食用，直接啃食易導致嘴腫。","nutritional_value":"香氣成分豐富，含有維生素A、C及多種有機酸，有助促進唾液分泌。","relief_symptoms":"幫助消化/解膩,美白抗氧化","relief_mechanism":"有機酸與獨特香氣能刺激胃酸分泌，緩解反胃感。","scenario":"懷舊古早味,料理加工,酸甜開胃","trivia":"情人果冰99%都是用土芒果的幼果醃漬的。"}'::jsonb,
  '{"appearance":"果皮由深綠轉黃綠，帶褐色斑點","detail":"果肩（蒂頭旁）飽滿鼓起","tactile":"整顆摸起來極軟（內部化水）","sense":"隔著袋子都能聞到濃烈香氣才算熟","storage":"不耐放，買回家建議2天內吃完","texture_desc":"纖維較多，口感軟爛多汁，適合吸食"}'::jsonb,
  ARRAY['檨仔','土檨仔','情人果原料']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_summer_snow',
  '夏雪芒果',
  '芒果',
  '[0,0,0,0,1,5,10,6,1,0,0,0]'::jsonb,
  '{"name_en":"Summer Snow Mango","is_premium":true,"is_common":false,"tagline":"芒果界的LV，集愛文香與金煌甜於一身","color":"#FFA500","keywords":"高雄3號,芒果LV","brix":15.5,"acidity":3,"calories":55,"gi_value":58,"price_level":5,"energy_index":1,"moisture":7,"aroma":9,"origin":"國產","best_origin":"台東","skin_edible":"No","seed_edible":"No","good_for":"食慾不振、視覺疲勞（維生素A）","bad_for":"濕熱體質（易長痘）、過敏體質","safety_warning":"**高糖警示**：甜度極高，需適量。","nutritional_value":"結合多品種優點，維生素A與β-胡蘿蔔素含量極高，抗氧化物質豐富。","relief_symptoms":"護眼明目,美白抗氧化,幫助消化/解膩","relief_mechanism":"維生素A含量極高，保護黏膜與視力；植化素增強防禦力。","scenario":"體面送禮,老饕最愛,螞蟻人","trivia":"全台唯一擁有「專屬身分證」的芒果，每顆都有防偽標籤。"}'::jsonb,
  '{"appearance":"果皮呈現鮮豔橘黃色，無黑斑","detail":"蒂頭周圍平整","tactile":"輕按有彈性，不可過軟","sense":"靠近聞有濃郁的土芒果野香","storage":"室溫催熟至聞到香氣後冷藏","texture_desc":"肉質極細，口感綿密，無纖維感"}'::jsonb,
  ARRAY['高雄3號','芒果LV']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_black_fragrance',
  '黑香芒果',
  '芒果',
  '[0,0,0,0,0,3,8,8,2,0,0,0]'::jsonb,
  '{"name_en":"Black Fragrance Mango","is_premium":false,"is_common":false,"tagline":"帶有天然龍眼乾香氣的神祕芒果","color":"#006400","keywords":"烏香,綠皮芒果","brix":16,"acidity":1,"calories":58,"gi_value":55,"price_level":3,"energy_index":1,"moisture":6,"aroma":8,"origin":"國產","best_origin":"台南南化","skin_edible":"No","seed_edible":"No","good_for":"氣血虛弱、食慾差","bad_for":"體質燥熱、喉嚨痛","safety_warning":"無特殊高風險","nutritional_value":"含有特殊的萜烯類香氣化合物，維生素A及膳食纖維含量適中。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"糖分與營養密度高，能快速補充能量與元氣。","scenario":"老饕最愛,稀有嘗鮮","trivia":"因為皮熟了還是綠的，常被誤以為沒熟而放到爛掉。"}'::jsonb,
  '{"appearance":"果皮深綠（成熟後也是綠的）","detail":"蒂頭微乾","tactile":"觸感變軟即代表成熟，勿等變色","sense":"聞起來有明顯的龍眼乾味道","storage":"室溫放軟後冷藏，皮綠就能吃","texture_desc":"口感較紮實，肉質Q彈，纖維少"}'::jsonb,
  ARRAY['烏香','綠皮芒果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_keitt',
  '凱特芒果',
  '芒果',
  '[0,0,0,0,0,0,2,6,10,8,2,0]'::jsonb,
  '{"name_en":"Keitt Mango","is_premium":false,"is_common":false,"tagline":"九月才出的晚生種，酸甜比極佳","color":"#FFDAB9","keywords":"九月芒果,晚生種","brix":14,"acidity":5,"calories":50,"gi_value":55,"price_level":2,"energy_index":0,"moisture":7,"aroma":6,"origin":"國產","best_origin":"台南玉井","skin_edible":"No","seed_edible":"No","good_for":"胃酸不足、消化不良","bad_for":"胃潰瘍、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"晚熟品種，有機酸含量較高，富含維生素C與膳食纖維。","relief_symptoms":"順暢排便,幫助消化/解膩","relief_mechanism":"含有果酸，能幫助胃酸分泌，輔助消化。","scenario":"生津解渴,螞蟻人","trivia":"因為產季最晚，被稱為「芒果季的壓軸」。"}'::jsonb,
  '{"appearance":"果皮黃綠色帶紅暈","detail":"果形呈現卵圓形，蒂頭乾燥","tactile":"按壓微軟即可，過軟易爛","sense":"香氣較淡，檢查表皮有無壓傷","storage":"室溫催熟後冷藏","texture_desc":"肉質細緻，纖維少，口感微酸清爽"}'::jsonb,
  ARRAY['九月芒果','晚生種']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_yuwen',
  '玉文芒果',
  '芒果',
  '[0,0,0,1,5,9,10,6,1,0,0,0]'::jsonb,
  '{"name_en":"Yuwen Mango","is_premium":false,"is_common":false,"tagline":"兼具金煌的肉與愛文的香，CP值高","color":"#DC143C","keywords":"紅金煌","brix":17,"acidity":2,"calories":56,"gi_value":60,"price_level":3,"energy_index":1,"moisture":7,"aroma":6,"origin":"國產","best_origin":"台南南化","skin_edible":"No","seed_edible":"No","good_for":"體質虛寒、津液不足","bad_for":"血糖控制不佳、皮膚過敏","safety_warning":"**高糖警示**：甜度高。","nutritional_value":"果實碩大，維生素A、C及鉀離子含量豐富，糖酸比適中。","relief_symptoms":"美白抗氧化,順暢排便","relief_mechanism":"維生素A有助於維持皮膚黏膜健康，減少乾燥。","scenario":"家庭分享,螞蟻人","trivia":"是金煌與愛文的混種，遺傳了雙方的優點。"}'::jsonb,
  '{"appearance":"果皮紅色艷麗，帶有細點","detail":"果形比愛文大、比金煌圓","tactile":"按壓果肉有彈性","sense":"靠近聞帶有淡淡愛文香氣","storage":"室溫催熟後冷藏","texture_desc":"果肉肥厚，口感細滑，汁多味甜"}'::jsonb,
  ARRAY['紅金煌']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_red_dragon',
  '紅龍芒果',
  '芒果',
  '[0,0,1,4,8,9,6,1,0,0,0,0]'::jsonb,
  '{"name_en":"Red Dragon Mango","is_premium":false,"is_common":false,"tagline":"肉質細緻像水蜜桃，幾乎無纖維","color":"#FF6347","keywords":"水蜜桃芒果","brix":14,"acidity":3,"calories":52,"gi_value":55,"price_level":3,"energy_index":0,"moisture":8,"aroma":5,"origin":"國產","best_origin":"高雄六龜","skin_edible":"No","seed_edible":"No","good_for":"牙口不好長輩、食慾不振","bad_for":"糖尿病患者、易過敏者","safety_warning":"**高糖警示**：甜度高。","nutritional_value":"肉質細緻，富含膳食纖維與維生素A，易於消化吸收。","relief_symptoms":"護眼明目,幫助消化/解膩","relief_mechanism":"肉質細嫩且甜度高，適合病後恢復期開胃。","scenario":"老饕最愛,軟糯好咬","trivia":"皮極薄，剝皮時常會連肉一起撕下來，建議用切的。"}'::jsonb,
  '{"appearance":"果皮橘紅色，皮薄光滑","detail":"果形較修長，蒂頭鮮綠","tactile":"手感柔軟，像水蜜桃","sense":"香氣淡雅，檢查果皮有無裂痕","storage":"極不耐放，變軟後需立刻冷藏食用","texture_desc":"肉質極細嫩，入口即化，幾無纖維"}'::jsonb,
  ARRAY['水蜜桃芒果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_manwen',
  '慢文芒果',
  '芒果',
  '[0,0,0,0,0,0,1,5,9,8,2,0]'::jsonb,
  '{"name_en":"Manwen Mango","is_premium":false,"is_common":false,"tagline":"晚熟的愛文，讓你在秋天也能吃芒果","color":"#FF8C00","keywords":"晚生愛文","brix":15,"acidity":4,"calories":50,"gi_value":55,"price_level":2,"energy_index":1,"moisture":7,"aroma":8,"origin":"國產","best_origin":"台南楠西","skin_edible":"No","seed_edible":"No","good_for":"秋燥口乾、消化不良","bad_for":"體質燥熱、皮膚癢","safety_warning":"無特殊高風險","nutritional_value":"營養成分與愛文相似，富含β-胡蘿蔔素與鉀，有助於維持生理機能。","relief_symptoms":"順暢排便","relief_mechanism":"果肉多汁，能生津止渴，補充體液。","scenario":"生津解渴,稀有嘗鮮","trivia":"其實就是晚開花的愛文，因氣候因素晚熟。"}'::jsonb,
  '{"appearance":"外觀似愛文但果粉較厚","detail":"蒂頭乾燥無發霉","tactile":"按壓有彈性","sense":"香氣比愛文稍淡，檢查有無黑斑","storage":"室溫催熟後冷藏","texture_desc":"口感紮實，纖維適中，類似愛文"}'::jsonb,
  ARRAY['晚生愛文']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_four_seasons',
  '四季芒果',
  '芒果',
  '[6,6,7,7,8,8,8,7,6,6,5,5]'::jsonb,
  '{"name_en":"Four Seasons Mango","is_premium":false,"is_common":false,"tagline":"四季都會開花結果，隨時解饞","color":"#FFFFE0","keywords":"四季檨","brix":13,"acidity":5,"calories":48,"gi_value":52,"price_level":2,"energy_index":0,"moisture":7,"aroma":5,"origin":"國產","best_origin":"彰化","skin_edible":"No","seed_edible":"No","good_for":"口乾舌燥、胃口差","bad_for":"過敏體質、濕疹","safety_warning":"無特殊高風險","nutritional_value":"含有維生素C及蘋果酸、檸檬酸等有機酸，熱量適中。","relief_symptoms":"幫助消化/解膩,美白抗氧化","relief_mechanism":"碳水化合物提供即時熱量，緩解體力透支。","scenario":"懶人免動刀,酸甜開胃","trivia":"雖然叫四季，但冬天產的通常比較酸。"}'::jsonb,
  '{"appearance":"果皮金黃，體型較小","detail":"蒂頭處有黏液滲出","tactile":"手感微軟","sense":"香氣中等，檢查果皮完整度","storage":"室溫放軟後冷藏","texture_desc":"肉質細緻，纖維少，口感軟Q"}'::jsonb,
  ARRAY['四季檨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_honey_snow',
  '蜜雪芒果',
  '芒果',
  '[0,0,0,2,6,9,8,3,0,0,0,0]'::jsonb,
  '{"name_en":"Honey Snow Mango","is_premium":false,"is_common":false,"tagline":"擁有迷人的桃紅色，視覺味覺雙享受","color":"#FA8072","keywords":"高雄4號,桃紅芒果","brix":14,"acidity":3,"calories":54,"gi_value":56,"price_level":4,"energy_index":0,"moisture":7,"aroma":7,"origin":"國產","best_origin":"高雄","skin_edible":"No","seed_edible":"No","good_for":"視覺疲勞、食慾不振","bad_for":"皮膚過敏、濕熱體質","safety_warning":"無特殊高風險","nutritional_value":"富含天然花青素（果皮）與維生素A，果肉細緻易消化。","relief_symptoms":"美白抗氧化,順暢排便","relief_mechanism":"富含類胡蘿蔔素，對抗藍光傷害。","scenario":"稀有嘗鮮,體面送禮","trivia":"是愛文的改良後代，抗病性更好，外觀更美。"}'::jsonb,
  '{"appearance":"果皮呈現桃紅色，色澤均勻","detail":"果皮斑點少，蒂頭鮮綠","tactile":"按壓有彈性","sense":"靠近聞帶有獨特花香","storage":"室溫催熟後冷藏","texture_desc":"肉質細緻，口感軟嫩，纖維少"}'::jsonb,
  ARRAY['高雄4號','桃紅芒果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mango_haden',
  '海頓芒果',
  '芒果',
  '[0,0,0,1,5,9,6,1,0,0,0,0]'::jsonb,
  '{"name_en":"Haden Mango","is_premium":false,"is_common":false,"tagline":"台灣早期的芒果霸主，滋味濃郁","color":"#B22222","keywords":"蘋果芒果,老品種","brix":13,"acidity":6,"calories":55,"gi_value":55,"price_level":2,"energy_index":1,"moisture":8,"aroma":7,"origin":"國產","best_origin":"屏東","skin_edible":"No","seed_edible":"No","good_for":"氣虛、暈車、消化不良","bad_for":"過敏體質、皮膚病","safety_warning":"無特殊高風險","nutritional_value":"纖維質含量較高，有助促進腸道蠕動，富含維生素A。","relief_symptoms":"幫助消化/解膩,護眼明目","relief_mechanism":"濃郁的傳統芒果香氣與酸甜比，能刺激食慾。","scenario":"懷舊古早味","trivia":"是台灣光復後最早引進的美國品種之一。"}'::jsonb,
  '{"appearance":"果皮紅黃綠三色漸層","detail":"蒂頭周圍有明顯紅暈","tactile":"果肉觸感較硬實","sense":"香氣濃郁，檢查有無撞傷","storage":"室溫催熟後冷藏","texture_desc":"口感紮實，纖維稍粗，肉質厚"}'::jsonb,
  ARRAY['蘋果芒果','老品種']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mangosteen',
  '山竹',
  '其他',
  '[1,1,0,2,6,9,10,9,6,3,1,1]'::jsonb,
  '{"name_en":"Mangosteen","is_premium":false,"is_common":true,"tagline":"果后，清涼解熱，口感酸甜像優格","color":"#800080","keywords":"果后,鳳果","brix":17,"acidity":4,"calories":70,"gi_value":45,"price_level":4,"energy_index":-2,"moisture":8,"aroma":6,"origin":"進口","best_origin":"泰國尖竹汶","skin_edible":"No","seed_edible":"No","good_for":"吃過量榴槤、燥熱、燒燙傷","bad_for":"脾胃虛寒、腹瀉、生理期","safety_warning":"無特殊高風險","nutritional_value":"果殼含山酮素（Xanthones），果肉含維生素C與纖維，性寒。","relief_symptoms":"潤喉養肺,美白抗氧化,抗發炎/免疫調節","relief_mechanism":"屬性寒涼，清熱降火，中和榴槤熱氣。","scenario":"生津解渴,懷舊古早味","trivia":"山竹底部的花瓣數等於裡面的果肉瓣數。"}'::jsonb,
  '{"appearance":"果殼紫紅微軟（像網球）","detail":"蒂頭鮮綠（非乾枯）","tactile":"按壓有彈性（硬如石代表壞）","sense":"無特殊香氣，檢查有無黃色汁液（膠）","storage":"冷藏保存","texture_desc":"肉質雪白，口感像優格般滑嫩"}'::jsonb,
  ARRAY['果后','鳳果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'rambutan',
  '紅毛丹',
  '其他',
  '[0,0,0,1,4,8,10,9,6,3,0,0]'::jsonb,
  '{"name_en":"Rambutan","is_premium":false,"is_common":true,"tagline":"外型像長毛的荔枝，口感清脆酸甜","color":"#DC143C","keywords":"毛荔枝","brix":18,"acidity":3,"calories":82,"gi_value":50,"price_level":3,"energy_index":2,"moisture":7,"aroma":5,"origin":"進口","best_origin":"泰國","skin_edible":"No","seed_edible":"No","good_for":"低血壓、貧血、腹瀉","bad_for":"胃炎、上火、口乾舌燥","safety_warning":"無特殊高風險","nutritional_value":"富含維生素C、鐵、鈣及膳食纖維。","relief_symptoms":"補氣血/暖身,美白抗氧化","relief_mechanism":"含鐵量與糖分高，補血補氣。","scenario":"稀有嘗鮮","trivia":"種皮跟果肉緊連，吃的時候小心不要把硬殼皮也吃下去。"}'::jsonb,
  '{"appearance":"毛色紅潤鮮豔","detail":"無黑褐斑（代表新鮮）","tactile":"果肉離核","sense":"無酸臭味，檢查毛是否乾枯","storage":"冷藏保存","texture_desc":"肉質脆彈，像葡萄，汁多"}'::jsonb,
  ARRAY['毛荔枝']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jackfruit',
  '波羅蜜',
  '其他',
  '[3,2,2,3,5,8,10,9,7,5,4,3]'::jsonb,
  '{"name_en":"Jackfruit","is_premium":false,"is_common":true,"tagline":"世界上最大的水果，兼具香蕉鳳梨味","color":"#FFD700","keywords":"將軍木","brix":22,"acidity":1,"calories":95,"gi_value":60,"price_level":2,"energy_index":1,"moisture":5,"aroma":8,"origin":"國產","best_origin":"台東太麻里","skin_edible":"No","seed_edible":"No","good_for":"宿醉、煩熱口渴、產後乳少","bad_for":"氣滯腹脹、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"果肉含碳水化合物，種子含蛋白質，富含維生素B6。","relief_symptoms":"解酒/宿醉,舒壓助眠,順暢排便","relief_mechanism":"種子煮熟可緩解腸胃不適；果肉糖分助解酒。","scenario":"家庭分享,料理加工,懷舊古早味","trivia":"波羅蜜的種子煮熟後吃起來像菱角，非常好吃。"}'::jsonb,
  '{"appearance":"果形巨大","detail":"輕拍有空心聲（熟）","tactile":"聞到濃香（未切開即香）","sense":"果肉金黃，檢查表皮有無軟爛","storage":"切開取肉冷藏","texture_desc":"口感脆硬，肉厚，有嚼勁"}'::jsonb,
  ARRAY['將軍木']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'chempedak',
  '榴槤蜜',
  '其他',
  '[0,0,0,0,2,6,10,9,5,1,0,0]'::jsonb,
  '{"name_en":"Chempedak","is_premium":false,"is_common":false,"tagline":"波羅蜜與榴槤的親戚，味道像焦糖","color":"#DAA520","keywords":"小波羅蜜","brix":25,"acidity":1,"calories":110,"gi_value":65,"price_level":3,"energy_index":2,"moisture":4,"aroma":9,"origin":"國產","best_origin":"屏東潮州","skin_edible":"No","seed_edible":"No","good_for":"體虛、需要補熱量","bad_for":"燥熱體質、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"富含維生素A、C及碳水化合物，熱量較高。","relief_symptoms":"舒壓助眠,順暢排便,補氣血/暖身","relief_mechanism":"高熱量高糖分，溫補效果。","scenario":"螞蟻人,懷舊古早味","trivia":"雖然叫榴槤蜜，但它跟榴槤沒有親戚關係，是波羅蜜的親戚。"}'::jsonb,
  '{"appearance":"外型像小波羅蜜","detail":"果皮軟，按壓有彈性","tactile":"聞起來有瓦斯味（特色）","sense":"口感軟爛，檢查有無裂果","storage":"室溫催熟後冷藏","texture_desc":"口感極軟爛，像泥狀，極甜"}'::jsonb,
  ARRAY['小波羅蜜']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'snakefruit',
  '蛇皮果',
  '其他',
  '[6,6,6,6,6,6,6,6,6,6,6,6]'::jsonb,
  '{"name_en":"Snake Fruit","is_premium":false,"is_common":false,"tagline":"外皮像蛇鱗，口感脆硬像蘋果","color":"#8B4513","keywords":"沙叻","brix":15,"acidity":5,"calories":82,"gi_value":50,"price_level":3,"energy_index":1,"moisture":4,"aroma":6,"origin":"進口","best_origin":"印尼峇里島","skin_edible":"No","seed_edible":"No","good_for":"長期記憶力差、腹瀉","bad_for":"便秘、熱性體質","safety_warning":"無特殊高風險","nutritional_value":"含有鈣、鐵、鉀、維生素C及單寧酸（澀味來源）。","relief_symptoms":"止瀉/收斂,護眼明目","relief_mechanism":"含有單寧酸可收斂止瀉；含鉀與果膠益智。","scenario":"稀有嘗鮮","trivia":"印尼的蛇皮果比較甜，泰國的比較酸。"}'::jsonb,
  '{"appearance":"果皮紅褐像蛇皮","detail":"果實尖頭，鱗片完整","tactile":"按壓硬實，不軟","sense":"微酸帶澀，檢查蒂頭有無發霉","storage":"冷藏保存","texture_desc":"口感脆硬，像蘋果，帶有澀味"}'::jsonb,
  ARRAY['沙叻']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'longkong',
  '龍宮果',
  '其他',
  '[0,0,0,0,0,2,6,9,10,8,2,0]'::jsonb,
  '{"name_en":"Longkong","is_premium":true,"is_common":false,"tagline":"外型像馬鈴薯，口感像柚子加葡萄","color":"#F5DEB3","keywords":"蘭撒果,愛情果","brix":16,"acidity":4,"calories":60,"gi_value":55,"price_level":3,"energy_index":0,"moisture":8,"aroma":6,"origin":"進口","best_origin":"泰國南部","skin_edible":"No","seed_edible":"No","good_for":"發燒熱病、心煩","bad_for":"糖尿病、體寒","safety_warning":"無特殊高風險","nutritional_value":"富含維生素C、B群及磷、鉀等礦物質。","relief_symptoms":"潤喉養肺,幫助消化/解膩","relief_mechanism":"在東南亞被視為退燒水果。","scenario":"稀有嘗鮮,酸甜開胃","trivia":"是泰國王妃最愛的水果之一，又稱「愛情果」。"}'::jsonb,
  '{"appearance":"成串像龍眼","detail":"果皮黃褐色，無黑斑","tactile":"果肉瓣狀，手感微軟","sense":"酸甜多汁，檢查有無掉果","storage":"冷藏保存","texture_desc":"果肉瓣狀，口感像柚子，多汁"}'::jsonb,
  ARRAY['蘭撒果','愛情果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'tamarind',
  '羅望子',
  '其他',
  '[4,5,6,6,5,4,2,1,1,2,3,4]'::jsonb,
  '{"name_en":"Tamarind","is_premium":false,"is_common":false,"tagline":"酸酸甜甜的天然蜜餞，開胃助消化","color":"#8B4513","keywords":"酸豆","brix":30,"acidity":8,"calories":239,"gi_value":55,"price_level":2,"energy_index":1,"moisture":2,"aroma":5,"origin":"進口","best_origin":"泰國碧差汶","skin_edible":"No","seed_edible":"No","good_for":"妊娠嘔吐、便秘、食慾差","bad_for":"胃酸過多、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"含有酒石酸、鈣、磷及膳食纖維，有助消化。","relief_symptoms":"順暢排便,幫助消化/解膩","relief_mechanism":"酸味刺激食慾；酒石酸與纖維具輕瀉作用。","scenario":"順暢排空,料理加工","trivia":"泰式料理的酸味來源（如泰式炒河粉）就是羅望子。"}'::jsonb,
  '{"appearance":"豆莢狀棕色，像花生","detail":"果殼易碎，無蟲孔","tactile":"果肉黑褐，黏稠","sense":"酸甜黏牙，檢查有無發霉","storage":"乾燥通風保存","texture_desc":"口感黏牙，像蜜餞，酸甜軟糯"}'::jsonb,
  ARRAY['酸豆']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'coconut',
  '椰子',
  '其他',
  '[5,5,6,8,10,10,10,9,8,7,6,5]'::jsonb,
  '{"name_en":"Coconut","is_premium":false,"is_common":true,"tagline":"天然電解質水，消暑解渴神器","color":"#F0FFF0","keywords":"椰青,椰皇","brix":5,"acidity":1,"calories":354,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":10,"aroma":6,"origin":"國產","best_origin":"屏東/泰國","skin_edible":"No","seed_edible":"No","good_for":"暑熱煩渴、水腫、發燒","bad_for":"心力衰竭、頻尿、脾胃虛寒","safety_warning":"無特殊高風險","nutritional_value":"椰水含電解質（鉀、鎂），椰肉含中鏈脂肪酸（MCTs）。","relief_symptoms":"補水/消水腫,解酒/宿醉,潤喉養肺","relief_mechanism":"電解質平衡體液；利尿排出尿酸與熱氣。","scenario":"生津解渴,運動補給","trivia":"椰子水是無菌的，二戰時期曾被用來當作靜脈注射液。"}'::jsonb,
  '{"appearance":"搖晃有水聲（水滿）","detail":"椰殼完整，無裂痕","tactile":"椰青水多，椰皇肉厚","sense":"無酸臭味，檢查椰眼有無發霉","storage":"冷藏保存","texture_desc":"椰青肉嫩如果凍，椰皇肉硬脆"}'::jsonb,
  ARRAY['椰青','椰皇']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'abiu',
  '黃金果',
  '其他',
  '[6,7,8,8,7,6,6,7,8,8,7,6]'::jsonb,
  '{"name_en":"Abiu","is_premium":true,"is_common":false,"tagline":"膠原蛋白之王，口感像果凍般滑嫩","color":"#FFD700","keywords":"黃晶果,加蜜蛋黃果","brix":15,"acidity":1,"calories":60,"gi_value":50,"price_level":3,"energy_index":0,"moisture":7,"aroma":2,"origin":"國產","best_origin":"屏東高樹","skin_edible":"No","seed_edible":"No","good_for":"皮膚乾燥、體虛","bad_for":"糖尿病、痰濕體質","safety_warning":"**高糖警示**。","nutritional_value":"含有膠質（水溶性纖維）、維生素C、鈣及磷。","relief_symptoms":"美白抗氧化,順暢排便","relief_mechanism":"富含膠質（水溶性纖維）與維生素C，潤腸養顏。","scenario":"美顏補氣,體面送禮,稀有嘗鮮","trivia":"切開後要滴檸檬汁，不然會馬上變成褐色。"}'::jsonb,
  '{"appearance":"果皮金黃光滑","detail":"果皮微軟（代表熟）","tactile":"切開果肉乳白，像果凍","sense":"口感像果凍，無特殊香氣","storage":"冷藏保存，切開易氧化","texture_desc":"口感像果凍般滑嫩，膠質豐富"}'::jsonb,
  ARRAY['黃晶果','加蜜蛋黃果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'star_apple',
  '牛奶果',
  '其他',
  '[8,9,10,8,5,2,0,0,0,0,2,6]'::jsonb,
  '{"name_en":"Star Apple","is_premium":true,"is_common":false,"tagline":"切開有星星圖案，口感像果凍配牛奶","color":"#9370DB","keywords":"星蘋果","brix":14,"acidity":2,"calories":67,"gi_value":50,"price_level":3,"energy_index":0,"moisture":6,"aroma":2,"origin":"國產","best_origin":"屏東長治","skin_edible":"No","seed_edible":"No","good_for":"熱病口渴、便秘","bad_for":"糖尿病、體寒","safety_warning":"無特殊高風險","nutritional_value":"果肉含有膠質、抗氧化成分及維生素C。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"果肉膠質豐富，生津潤燥。","scenario":"稀有嘗鮮,螞蟻人","trivia":"越南的新住民帶來的品種，現在台灣也種得很好。"}'::jsonb,
  '{"appearance":"果皮紫紅或綠","detail":"按壓微軟（像柿子）","tactile":"果肉白色膠狀","sense":"淡淡奶香，檢查有無撞傷","storage":"冷藏保存","texture_desc":"口感像果凍，滑溜，帶有奶香"}'::jsonb,
  ARRAY['星蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'egg_fruit',
  '仙桃',
  '其他',
  '[8,7,6,5,4,3,2,3,5,7,9,9]'::jsonb,
  '{"name_en":"Canistel","is_premium":false,"is_common":false,"tagline":"口感像蛋黃與地瓜的混合體，營養豐富","color":"#FFA500","keywords":"蛋黃果","brix":20,"acidity":1,"calories":140,"gi_value":60,"price_level":1,"energy_index":1,"moisture":3,"aroma":6,"origin":"國產","best_origin":"嘉義番路","skin_edible":"No","seed_edible":"No","good_for":"泄瀉（收斂作用）、體虛","bad_for":"便秘、噎到（需配水）","safety_warning":"無特殊高風險","nutritional_value":"富含澱粉、維生素A、C、E及礦物質，營養價值似地瓜。","relief_symptoms":"護眼明目,止瀉/收斂,舒壓助眠","relief_mechanism":"澱粉質與單寧具收斂止瀉效果；富含類胡蘿蔔素。","scenario":"懷舊古早味,軟糯好咬","trivia":"一定要放到很軟很軟才能吃，不然會澀且難以下嚥。"}'::jsonb,
  '{"appearance":"果皮橙黃","detail":"頂端裂開代表熟","tactile":"觸感極軟（像地瓜泥）","sense":"有蛋黃香氣，檢查有無發霉","storage":"室溫催熟至極軟再吃","texture_desc":"口感像蛋黃與地瓜泥，綿密乾爽"}'::jsonb,
  ARRAY['蛋黃果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'sapodilla',
  '人心果',
  '其他',
  '[6,6,6,6,6,6,6,6,6,6,6,6]'::jsonb,
  '{"name_en":"Sapodilla","is_premium":false,"is_common":false,"tagline":"味道像黑糖冬瓜茶，口感沙沙的","color":"#8B4513","keywords":"吳鳳柿","brix":22,"acidity":1,"calories":83,"gi_value":60,"price_level":2,"energy_index":0,"moisture":4,"aroma":6,"origin":"國產","best_origin":"嘉義/雲林","skin_edible":"No","seed_edible":"No","good_for":"低血糖、肺潤","bad_for":"糖尿病、肥胖","safety_warning":"**高糖警示**。","nutritional_value":"糖分極高，含有葡萄糖、維生素C及鐵質。","relief_symptoms":"舒壓助眠,血壓調節,順暢排便","relief_mechanism":"高糖分補能；傳統認為有潤肺止咳之效。","scenario":"螞蟻人,懷舊古早味","trivia":"因為外型長得像人的心臟而得名，甜度非常高。"}'::jsonb,
  '{"appearance":"果皮褐色像馬鈴薯","detail":"按壓微軟（像奇異果）","tactile":"果肉褐色，沙沙的","sense":"黑糖甜香，檢查有無過軟","storage":"室溫催熟後冷藏","texture_desc":"口感沙沙的，像梨子，極甜"}'::jsonb,
  ARRAY['吳鳳柿']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jaboticaba',
  '樹葡萄',
  '其他',
  '[3,6,8,5,2,1,0,0,1,4,8,5]'::jsonb,
  '{"name_en":"Jaboticaba","is_premium":false,"is_common":false,"tagline":"長在樹幹上的黑珍珠，皮澀肉甜","color":"#000000","keywords":"嘉寶果","brix":14,"acidity":5,"calories":50,"gi_value":45,"price_level":3,"energy_index":0,"moisture":8,"aroma":4,"origin":"國產","best_origin":"彰化","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"風濕、水腫、腎炎","bad_for":"糖尿病、密集恐懼症","safety_warning":"無特殊高風險","nutritional_value":"皮含花青素與單寧，肉含維生素C與B群。","relief_symptoms":"護眼明目,補氣血/暖身,美白抗氧化","relief_mechanism":"皮與籽富含花青素，抗氧化力極強。","scenario":"美顏補氣,稀有嘗鮮","trivia":"皮很厚且澀，通常會吐皮，或是拿來釀酒。"}'::jsonb,
  '{"appearance":"果實紫黑發亮","detail":"果粒飽滿，無皺縮","tactile":"按壓有彈性","sense":"像葡萄但皮厚，無發酵味","storage":"冷藏保存","texture_desc":"皮澀肉甜，口感像葡萄，多汁"}'::jsonb,
  ARRAY['嘉寶果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'acerola',
  '西印度櫻桃',
  '其他',
  '[2,1,1,2,5,8,9,8,5,2,1,1]'::jsonb,
  '{"name_en":"Acerola Cherry","is_premium":true,"is_common":false,"tagline":"維生素C之王，酸到懷疑人生","color":"#DC143C","keywords":"針葉櫻桃","brix":7,"acidity":10,"calories":32,"gi_value":25,"price_level":3,"energy_index":0,"moisture":8,"aroma":3,"origin":"國產","best_origin":"台南","skin_edible":"Yes","seed_edible":"No","good_for":"壞血病、貧血、感冒","bad_for":"胃酸過多、結石體質","safety_warning":"無特殊高風險","nutritional_value":"天然維生素C含量之冠，含有生物類黃酮。","relief_symptoms":"美白抗氧化,抗發炎/免疫調節,補氣血/暖身","relief_mechanism":"維生素C含量之王，促進膠原蛋白合成與免疫功能。","scenario":"美顏補氣,螞蟻人","trivia":"它的維生素C含量是檸檬的100倍，吃一顆抵好幾顆檸檬。"}'::jsonb,
  '{"appearance":"果色鮮紅","detail":"果形凹凸不平","tactile":"極易碰傷，選無傷者","sense":"極酸，聞起來有酸味","storage":"通常加工成果汁或錠劑","texture_desc":"肉質細軟，極酸，多汁"}'::jsonb,
  ARRAY['針葉櫻桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'yumberry',
  '楊梅',
  '其他',
  '[0,0,0,0,3,9,5,0,0,0,0,0]'::jsonb,
  '{"name_en":"Yumberry","is_premium":false,"is_common":false,"tagline":"酸甜多汁，望梅止渴的真實版","color":"#8B0000","keywords":"樹梅","brix":11,"acidity":7,"calories":30,"gi_value":40,"price_level":3,"energy_index":1,"moisture":8,"aroma":6,"origin":"國產","best_origin":"桃園","skin_edible":"Yes","seed_edible":"No","good_for":"口乾、痢疾、食積","bad_for":"胃酸過多、牙痛","safety_warning":"無特殊高風險","nutritional_value":"富含花青素、維生素C及有機酸，有助消化。","relief_symptoms":"幫助消化/解膩,止瀉/收斂","relief_mechanism":"酸味收斂止瀉，生津開胃。","scenario":"生津解渴,懷舊古早味","trivia":"台灣原本就有原生種楊梅，但果實較小，現在多引進大果品種。"}'::jsonb,
  '{"appearance":"果色深紅紫黑","detail":"果粒突出像刺","tactile":"無出水，顆粒完整","sense":"酸甜交織，檢查有無果蠅","storage":"極易爛，冷藏保存","texture_desc":"肉質多汁，由許多小凸起組成，口感特殊"}'::jsonb,
  ARRAY['樹梅']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jelly_fig',
  '愛玉',
  '其他',
  '[6,5,4,3,2,2,3,5,8,10,9,8]'::jsonb,
  '{"name_en":"Jelly Fig","is_premium":false,"is_common":true,"tagline":"台灣特有種，只有台灣洗得出愛玉凍","color":"#FFFFF0","keywords":"愛玉子","brix":0,"acidity":1,"calories":2,"gi_value":null,"price_level":2,"energy_index":-1,"moisture":9,"aroma":1,"origin":"國產","best_origin":"嘉義阿里山","skin_edible":"No","seed_edible":"Swallow","good_for":"暑熱煩渴、便秘、乳汁不通","bad_for":"胃寒、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"天然果膠（水溶性纖維），熱量極低，需搭配糖水食用。","relief_symptoms":"補水/消水腫,血壓調節,順暢排便","relief_mechanism":"高鉀利尿；果膠屬水溶性纖維，清涼解熱。","scenario":"生津解渴,低卡減負,家庭分享","trivia":"全世界只有台灣有愛玉小蜂幫忙授粉，所以愛玉是正宗台灣特產。"}'::jsonb,
  '{"appearance":"果實綠色帶白點","detail":"乾燥後翻面（黃色）","tactile":"瘦果金黃，無發黑","sense":"無味，檢查有無發霉","storage":"乾燥保存，洗完需冷藏","texture_desc":"口感像果凍，滑溜清爽，無味"}'::jsonb,
  ARRAY['愛玉子']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pomegranate',
  '紅石榴',
  '其他',
  '[0,0,0,0,0,0,0,0,3,8,10,8]'::jsonb,
  '{"name_en":"Pomegranate","is_premium":true,"is_common":false,"tagline":"抗氧化界的紅寶石，喝出透亮好氣色","color":"#C71585","keywords":"石榴,抗氧化女王","brix":16,"acidity":4,"calories":83,"gi_value":55,"price_level":4,"energy_index":1,"moisture":8,"aroma":4,"origin":"進口","best_origin":"土耳其/美國","skin_edible":"No","seed_edible":"Swallow","good_for":"貧血、膚色暗沉、心血管保養","bad_for":"便秘（籽多）、胃酸過多","safety_warning":"**藥物交互作用**：影響部分降血壓/膽固醇藥物代謝。","nutritional_value":"富含安石榴苷（Punicalagin）、花青素及鞣花酸，抗氧化力極強。","relief_symptoms":"美白抗氧化,血壓調節,補氣血/暖身","relief_mechanism":"多酚類物質強效抗氧化；輔助調節血壓。","scenario":"美顏補氣,稀有嘗鮮,料理加工,懶人免動刀","trivia":"紅石榴的抗氧化力是綠茶的3倍、紅酒的1.4倍。"}'::jsonb,
  '{"appearance":"果皮紅潤緊繃，稜角明顯（皮薄肉滿）","detail":"蒂頭開裂如皇冠","tactile":"手感沉重","sense":"無特殊香氣，檢查有無發霉","storage":"常溫或冷藏，可放很久","texture_desc":"果粒如寶石般晶瑩，口感脆甜多汁"}'::jsonb,
  ARRAY['石榴','抗氧化女王']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'gooseberry_indian',
  '油甘',
  '其他',
  '[0,0,0,0,0,0,0,0,4,8,10,8]'::jsonb,
  '{"name_en":"Indian Gooseberry","is_premium":false,"is_common":false,"tagline":"入口酸澀而後回甘，維生素C是蘋果160倍","color":"#9ACD32","keywords":"餘甘子,牛甘果","brix":5,"acidity":10,"calories":44,"gi_value":35,"price_level":3,"energy_index":-1,"moisture":5,"aroma":4,"origin":"國產","best_origin":"苗栗","skin_edible":"Yes","seed_edible":"No","good_for":"喉嚨痛、三高族群、糖尿病","bad_for":"胃潰瘍、怕酸者","safety_warning":"無特殊高風險","nutritional_value":"超高維生素C、鞣質及多酚，具有強大抗氧化與降血糖潛力。","relief_symptoms":"潤喉養肺,美白抗氧化,幫助消化/解膩","relief_mechanism":"先酸後甘生津止渴；維生素C含量極高。","scenario":"稀有嘗鮮,特殊護理,料理加工,酸甜開胃","trivia":"聯合國衛生組織指定為全世界推廣種植的3種保健植物之一。"}'::jsonb,
  '{"appearance":"果實圓潤，透出淡黃綠色","detail":"表面光滑無蟲孔","tactile":"質地硬脆","sense":"無特殊香氣，主要吃其回甘味","storage":"冷藏保存，或醃漬糖/鹽","texture_desc":"初嚐極酸澀，咀嚼後滿口回甘生津"}'::jsonb,
  ARRAY['餘甘子','牛甘果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'tamarillo',
  '樹番茄',
  '其他',
  '[2,3,4,5,6,7,8,9,9,8,6,4]'::jsonb,
  '{"name_en":"Tamarillo","is_premium":false,"is_common":false,"tagline":"生長在高山的番茄，皮苦肉酸甜","color":"#8B0000","keywords":"木質番茄,洋酸茄","brix":10,"acidity":8,"calories":31,"gi_value":40,"price_level":3,"energy_index":-1,"moisture":7,"aroma":5,"origin":"國產","best_origin":"南投清境","skin_edible":"No","seed_edible":"Swallow","good_for":"高血壓、視力疲勞、便秘","bad_for":"胃酸過多、怕酸者","safety_warning":"無特殊高風險","nutritional_value":"富含維生素A、C、E及鐵質，果膠含量高。","relief_symptoms":"幫助消化/解膩,護眼明目","relief_mechanism":"酸味助消化；維生素A護眼。","scenario":"稀有嘗鮮,料理加工,美顏補氣","trivia":"吃的時候要像吃奇異果一樣用湯匙挖，皮真的很苦。"}'::jsonb,
  '{"appearance":"果皮紅得發紫，表面光滑","detail":"果形像蛋，蒂頭長","tactile":"手感微軟","sense":"有特殊的熱帶水果香氣","storage":"常溫放軟後更甜，可冷藏","texture_desc":"果皮苦澀不可食，果肉像百香果般酸甜"}'::jsonb,
  ARRAY['木質番茄','洋酸茄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'miracle_fruit',
  '神秘果',
  '其他',
  '[3,4,6,8,9,10,9,7,5,3,2,1]'::jsonb,
  '{"name_en":"Miracle Fruit","is_premium":false,"is_common":false,"tagline":"吃完它再吃檸檬會變甜的神奇魔法","color":"#DC143C","keywords":"變味果,奇蹟果","brix":2,"acidity":1,"calories":35,"gi_value":10,"price_level":4,"energy_index":0,"moisture":6,"aroma":3,"origin":"國產","best_origin":"屏東","skin_edible":"Yes","seed_edible":"Swallow","good_for":"糖尿病（想吃甜）、化療味覺改變","bad_for":"無特殊禁忌","safety_warning":"無特殊高風險","nutritional_value":"本身營養普通，主要功能是含「神秘果素」改變味覺。","relief_symptoms":"幫助消化/解膩,舒壓助眠","relief_mechanism":"改變味覺讓酸變甜，增加進食樂趣與食慾。","scenario":"稀有嘗鮮,特殊護理,螞蟻人","trivia":"含有一種醣蛋白叫「神秘果素」，能暫時改變味蕾對酸的感覺。"}'::jsonb,
  '{"appearance":"果實鮮紅橢圓，像枸杞","detail":"表皮光滑","tactile":"手感軟","sense":"無特殊香氣","storage":"冷藏保存，盡快食用","texture_desc":"果肉極少，微甜，口感像吃棗子皮"}'::jsonb,
  ARRAY['變味果','奇蹟果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'white_sapote',
  '白柿',
  '其他',
  '[0,0,0,0,2,6,9,10,8,4,0,0]'::jsonb,
  '{"name_en":"White Sapote","is_premium":false,"is_common":false,"tagline":"口感像香草冰淇淋，入口即化的綿密","color":"#90EE90","keywords":"冰淇淋果,白薩波特","brix":20,"acidity":1,"calories":90,"gi_value":65,"price_level":4,"energy_index":0,"moisture":6,"aroma":5,"origin":"國產","best_origin":"嘉義","skin_edible":"No","seed_edible":"No","good_for":"失眠、焦慮、體瘦者","bad_for":"糖尿病、肥胖","safety_warning":"**高糖警示**：甜度極高。","nutritional_value":"富含鉀、維生素C及具助眠效果的成分。","relief_symptoms":"舒壓助眠,補氣血/暖身","relief_mechanism":"特定成分有助放鬆神經；高糖補能。","scenario":"稀有嘗鮮,軟糯好咬,螞蟻人,特殊護理","trivia":"雖然叫白柿，但跟柿子沒關係，是芸香科（跟橘子親戚）。"}'::jsonb,
  '{"appearance":"果皮綠色微黃，表皮薄","detail":"果形圓潤，像青蘋果","tactile":"按壓極軟（像熟透的桃子）","sense":"淡淡的香草奶油香","storage":"室溫催熟至極軟，冷藏後風味像冰淇淋","texture_desc":"口感像奶油或冰淇淋，綿密極甜"}'::jsonb,
  ARRAY['冰淇淋果','白薩波特']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'olive_chinese',
  '橄欖',
  '其他',
  '[0,0,0,0,0,0,0,0,2,8,10,6]'::jsonb,
  '{"name_en":"Chinese Olive","is_premium":false,"is_common":false,"tagline":"生吃苦澀，醃漬後回甘，潤喉聖品","color":"#32CD32","keywords":"青橄欖,尖橄欖","brix":3,"acidity":10,"calories":85,"gi_value":30,"price_level":2,"energy_index":0,"moisture":5,"aroma":4,"origin":"國產","best_origin":"彰化寶山","skin_edible":"Yes","seed_edible":"No","good_for":"喉嚨痛、酒醉、消化不良","bad_for":"便秘（澀味重）、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"富含鈣質、維生素C及單寧酸，有助清熱解毒。","relief_symptoms":"潤喉養肺,幫助消化/解膩,解酒/宿醉","relief_mechanism":"傳統潤喉食材；酸澀味助解酒消食。","scenario":"懷舊古早味,料理加工,特殊護理","trivia":"台灣的橄欖跟做橄欖油的油橄欖是不一樣的品種喔。"}'::jsonb,
  '{"appearance":"果形兩頭尖，像紡錘","detail":"果皮青綠光滑","tactile":"質地極硬","sense":"清香，帶有草本味","storage":"常溫通風，通常加工後保存","texture_desc":"生食硬脆苦澀，醃漬後脆甜回甘"}'::jsonb,
  ARRAY['青橄欖','尖橄欖']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'gac_fruit',
  '木鱉果',
  '其他',
  '[0,0,0,0,0,2,6,9,10,8,4,0]'::jsonb,
  '{"name_en":"Gac Fruit","is_premium":false,"is_common":false,"tagline":"茄紅素是番茄的70倍，需煮熟食用的超級食物","color":"#FF4500","keywords":"天堂果,長生果","brix":4,"acidity":2,"calories":90,"gi_value":35,"price_level":3,"energy_index":0,"moisture":6,"aroma":3,"origin":"國產","best_origin":"台東","skin_edible":"No","seed_edible":"No","good_for":"乾眼症、夜盲症、攝護腺腫大","bad_for":"腹瀉者","safety_warning":"**生食禁忌**：種子有微毒，需煮熟食用。","nutritional_value":"茄紅素與β-胡蘿蔔素含量極高，富含油脂助吸收。","relief_symptoms":"護眼明目,抗發炎/免疫調節","relief_mechanism":"茄紅素與胡蘿蔔素含量驚人，強效護眼抗炎。","scenario":"料理加工,稀有嘗鮮,美顏補氣,特殊護理","trivia":"種子長得像鱉（甲魚），所以叫木鱉果，是顧眼睛神器。"}'::jsonb,
  '{"appearance":"果皮橘紅有軟刺","detail":"剖開果肉鮮紅，種子像鱉","tactile":"手感軟","sense":"淡淡瓜果香","storage":"冷藏保存，建議盡快煮食","texture_desc":"果肉像酪梨般油潤，需煮熟，無特殊味道"}'::jsonb,
  ARRAY['天堂果','長生果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'cactus_pear',
  '仙人掌果',
  '其他',
  '[0,0,0,0,2,6,9,10,8,4,0,0]'::jsonb,
  '{"name_en":"Cactus Pear","is_premium":false,"is_common":false,"tagline":"澎湖特產，紫紅色果汁，清涼消暑","color":"#C71585","keywords":"仙人掌果,澎湖紅蘋果","brix":13,"acidity":4,"calories":41,"gi_value":45,"price_level":3,"energy_index":-1,"moisture":9,"aroma":6,"origin":"國產","best_origin":"澎湖","skin_edible":"No","seed_edible":"Swallow","good_for":"水腫、口乾舌燥、曬傷","bad_for":"脾胃虛寒、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"富含甜菜紅素、抗氧化劑及鉀，具有消炎退火功效。","relief_symptoms":"美白抗氧化,補水/消水腫","relief_mechanism":"甜菜紅素抗氧化；水分多清熱。","scenario":"稀有嘗鮮,料理加工,生津解渴","trivia":"吃完嘴巴跟排泄物都會變紅色的，不要驚慌。"}'::jsonb,
  '{"appearance":"果皮紫紅有刺（小心！）","detail":"頂端有凹陷","tactile":"按壓微軟","sense":"清淡草本香","storage":"冷藏保存","texture_desc":"果肉多汁，口感像火龍果但種子硬"}'::jsonb,
  ARRAY['仙人掌果','澎湖紅蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'water_caltrop',
  '菱角',
  '其他',
  '[0,0,0,0,0,0,0,0,4,10,8,2]'::jsonb,
  '{"name_en":"Water Caltrop","is_premium":false,"is_common":true,"tagline":"水中落花生，口感鬆軟像栗子","color":"#2F4F4F","keywords":"龍角,水栗","brix":8,"acidity":1,"calories":115,"gi_value":45,"price_level":2,"energy_index":0,"moisture":4,"aroma":5,"origin":"國產","best_origin":"台南官田","skin_edible":"No","seed_edible":"No","good_for":"體虛消瘦、老人小孩、腹瀉","bad_for":"便秘（吃多難消化）、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"富含澱粉、蛋白質及抗性澱粉，有助於腸道健康。","relief_symptoms":"順暢排便,補氣血/暖身","relief_mechanism":"抗性澱粉助腸道；澱粉補能暖身。","scenario":"懷舊古早味,軟糯好咬,料理加工,家庭分享","trivia":"菱角其實是澱粉類，熱量跟白飯差不多，不能當水果狂吃。"}'::jsonb,
  '{"appearance":"外殼紫黑堅硬，像牛角","detail":"兩角尖銳","tactile":"按壓不動，極硬","sense":"無特殊氣味","storage":"常溫通風或剝殼冷凍","texture_desc":"口感鬆軟綿密，帶有淡淡清香"}'::jsonb,
  ARRAY['龍角','水栗']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'chestnut',
  '板栗',
  '其他',
  '[0,0,0,0,0,0,0,0,2,8,10,10]'::jsonb,
  '{"name_en":"Chinese Chestnut","is_premium":false,"is_common":true,"tagline":"乾果之王，香甜鬆軟，補腎益氣","color":"#8B4513","keywords":"栗子,毛栗","brix":10,"acidity":1,"calories":196,"gi_value":60,"price_level":3,"energy_index":1,"moisture":3,"aroma":8,"origin":"國產","best_origin":"嘉義中埔","skin_edible":"No","seed_edible":"No","good_for":"腎虛腰痛、頻尿、腹瀉","bad_for":"便秘、脹氣、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"富含碳水化合物、蛋白質、B群及鉀，中醫視為補腎良方。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"溫補腎陽；豐富纖維助排便。","scenario":"懷舊古早味,軟糯好咬,料理加工,特殊護理","trivia":"栗子維生素C含量其實比蘋果還高，別以為它只有澱粉。"}'::jsonb,
  '{"appearance":"外殼深褐光亮，底部絨毛少","detail":"果形圓鼓","tactile":"質地堅硬","sense":"生栗子無味，熟栗子香甜","storage":"冷藏或冷凍保存","texture_desc":"煮熟後口感鬆軟綿密，香甜可口"}'::jsonb,
  ARRAY['栗子','毛栗']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'kiwi_gold',
  '黃金奇異果',
  '奇異果',
  '[0,0,0,0,2,6,9,10,10,8,4,0]'::jsonb,
  '{"name_en":"Gold Kiwi","is_premium":true,"is_common":true,"tagline":"口感像花蜜般香甜，維生素C是柳丁的3倍","color":"#E4D00A","keywords":"陽光金圓頭,獼猴桃","brix":16,"acidity":3,"calories":60,"gi_value":48,"price_level":4,"energy_index":-1,"moisture":9,"aroma":6,"origin":"進口","best_origin":"紐西蘭","skin_edible":"No","seed_edible":"Swallow","good_for":"嘴破口角炎、便秘、感冒","bad_for":"腹瀉者、頻尿者","safety_warning":"無特殊高風險","nutritional_value":"富含維生素C、E及鉀，營養密度極高，無毛口感佳。","relief_symptoms":"美白抗氧化,順暢排便,幫助消化/解膩","relief_mechanism":"維生素C含量極高促進膠原蛋白；奇異果酵素助消化。","scenario":"螞蟻人,懶人免動刀,美顏補氣,順暢排空,體面送禮","trivia":"黃金奇異果的維生素C含量比綠色奇異果高，但膳食纖維是綠色的比較多。"}'::jsonb,
  '{"appearance":"果皮光滑無毛（或毛極短），顏色古銅","detail":"蒂頭按壓微軟","tactile":"整顆手感微軟有彈性（太硬會酸）","sense":"帶有熱帶水果香氣","storage":"硬果冷藏可放久，室溫催熟至軟","texture_desc":"肉質細緻，口感綿密，汁多無渣"}'::jsonb,
  ARRAY['陽光金圓頭','獼猴桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'kiwi_red',
  '紅心奇異果',
  '奇異果',
  '[0,0,0,0,0,0,0,0,2,8,9,5]'::jsonb,
  '{"name_en":"Red Kiwi","is_premium":true,"is_common":false,"tagline":"中心一抹紅，帶有莓果香氣的稀有品種","color":"#ADFF2F","keywords":"紅寶石奇異果,紅陽","brix":18,"acidity":2,"calories":60,"gi_value":50,"price_level":5,"energy_index":-1,"moisture":8,"aroma":7,"origin":"進口","best_origin":"紐西蘭","skin_edible":"No","seed_edible":"Swallow","good_for":"抗氧化、心血管保養","bad_for":"腹瀉者、體寒者","safety_warning":"無特殊高風險","nutritional_value":"含有花青素（紅心處）與維生素C，抗氧化能力強。","relief_symptoms":"護眼明目,美白抗氧化","relief_mechanism":"花青素與維C協同作用，保護眼睛與皮膚。","scenario":"稀有嘗鮮,螞蟻人,美顏補氣,體面送禮","trivia":"紅心奇異果是所有奇異果中甜度最高的，且抗氧化力最強。"}'::jsonb,
  '{"appearance":"果形較小，表皮無毛光亮","detail":"切開中心呈放射狀紅色","tactile":"按壓微軟即可食用","sense":"帶有特殊莓果與花香","storage":"極易過熟，買回需冷藏並盡快食用","texture_desc":"肉質最細緻，甜度最高，帶有莓果香"}'::jsonb,
  ARRAY['紅寶石奇異果','紅陽']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'kiwi_green',
  '綠奇異果',
  '奇異果',
  '[3,2,2,4,7,9,10,10,9,8,6,4]'::jsonb,
  '{"name_en":"Green Kiwi","is_premium":false,"is_common":true,"tagline":"膳食纖維與酵素的雙重王者，便秘救星","color":"#8FBC8F","keywords":"獼猴桃,Zespri","brix":13,"acidity":7,"calories":58,"gi_value":39,"price_level":3,"energy_index":-2,"moisture":8,"aroma":4,"origin":"進口","best_origin":"紐西蘭","skin_edible":"No","seed_edible":"Swallow","good_for":"便秘、消化不良、大魚大肉後","bad_for":"腹瀉者、頻尿者、怕酸者","safety_warning":"無特殊高風險","nutritional_value":"富含奇異果酵素（Actinidin）與膳食纖維，維C含量雖輸黃金但仍高。","relief_symptoms":"順暢排便,幫助消化/解膩","relief_mechanism":"奇異果酵素分解蛋白質；豐富膳食纖維促進強烈蠕動。","scenario":"順暢排空,低卡減負,酸甜開胃,懶人免動刀","trivia":"其實奇異果原產於中國（叫獼猴桃），是被紐西蘭發揚光大的。"}'::jsonb,
  '{"appearance":"果皮棕色且佈滿細毛","detail":"蒂頭按壓微軟（代表熟）","tactile":"整顆手感微軟有彈性（像握網球）","sense":"帶有清新的草本果香","storage":"硬果需室溫催熟（可放蘋果），變軟後冷藏","texture_desc":"口感軟糯，帶有細小籽的顆粒感，酸度明顯"}'::jsonb,
  ARRAY['獼猴桃','Zespri']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_pearl',
  '珍珠芭樂',
  '芭樂',
  '[10,9,8,7,5,5,5,6,8,9,10,10]'::jsonb,
  '{"name_en":"Pearl Guava","is_premium":false,"is_common":true,"tagline":"國民水果，脆甜適中，維C冠軍","color":"#90EE90","keywords":"芭樂,那拔,拔仔","brix":10,"acidity":3,"calories":38,"gi_value":30,"price_level":1,"energy_index":0,"moisture":6,"aroma":5,"origin":"國產","best_origin":"高雄燕巢","skin_edible":"Yes","seed_edible":"Yes","good_for":"牙齦出血、糖尿病（低GI）、腹瀉","bad_for":"嚴重便秘（籽）、剛拔牙者","safety_warning":"無特殊高風險","nutritional_value":"維生素C含量極高（水果之冠），富含膳食纖維與抗氧化力。","relief_symptoms":"順暢排便,美白抗氧化,血壓調節","relief_mechanism":"維C之王預防壞血病；低GI高纖維增加飽足感。","scenario":"低卡減負,家庭分享,美顏補氣","trivia":"皮越皺代表越甜，千萬別挑太光滑的。"}'::jsonb,
  '{"appearance":"果皮凹凸不平（珠粒多）","detail":"顏色淡綠（白霧狀）","tactile":"手感沉重，硬實","sense":"清脆有聲，太軟不好吃","storage":"塑膠袋綁緊冷藏","texture_desc":"口感脆甜，肉質細緻，清爽"}'::jsonb,
  ARRAY['芭樂','那拔','拔仔']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_emperor',
  '帝王芭樂',
  '芭樂',
  '[9,9,8,6,4,3,3,4,6,8,10,10]'::jsonb,
  '{"name_en":"Emperor Guava","is_premium":true,"is_common":false,"tagline":"巨無霸芭樂，肉厚脆度高，帶酸香","color":"#32CD32","keywords":"大芭樂","brix":11,"acidity":3,"calories":39,"gi_value":30,"price_level":2,"energy_index":0,"moisture":7,"aroma":5,"origin":"國產","best_origin":"高雄燕巢","skin_edible":"Yes","seed_edible":"Yes","good_for":"減重、三高族群","bad_for":"便秘、牙口不好","safety_warning":"無特殊高風險","nutritional_value":"果肉厚實，維生素C與纖維含量豐富，口感脆。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"果肉厚實纖維多，耐咀嚼增加飽足感。","scenario":"低卡減負,家庭分享","trivia":"因為保留了土芭樂的酸香，被稱為芭樂界的帝王。"}'::jsonb,
  '{"appearance":"體型巨大，果形圓","detail":"果皮較厚，珠粒明顯","tactile":"肉質極脆，敲擊聲響","sense":"酸甜比明顯，檢查有無黑斑","storage":"塑膠袋綁緊冷藏","texture_desc":"肉質極脆，厚實，咬勁佳"}'::jsonb,
  ARRAY['大芭樂']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_crystal',
  '水晶芭樂',
  '芭樂',
  '[8,8,7,6,4,4,4,5,7,8,9,9]'::jsonb,
  '{"name_en":"Crystal Guava","is_premium":false,"is_common":false,"tagline":"種子極少，肉質硬脆，像是吃無籽芭樂","color":"#98FB98","keywords":"無籽芭樂","brix":12,"acidity":2,"calories":37,"gi_value":30,"price_level":3,"energy_index":0,"moisture":6,"aroma":4,"origin":"國產","best_origin":"彰化社頭","skin_edible":"Yes","seed_edible":"None","good_for":"糖尿病、牙齦出血","bad_for":"便秘","safety_warning":"無特殊高風險","nutritional_value":"無籽肉厚，膳食纖維與維生素C含量高。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"維生素C含量高。","scenario":"懶人免動刀,家庭分享","trivia":"雖然好吃但產量少，是市場上的搶手貨。"}'::jsonb,
  '{"appearance":"果形扁圓，像南瓜","detail":"表面粗糙，果臍縮","tactile":"肉厚籽少，非常硬","sense":"口感極脆，無特殊香氣","storage":"塑膠袋綁緊冷藏","texture_desc":"口感極硬脆，肉厚無籽，清甜"}'::jsonb,
  ARRAY['無籽芭樂']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_redheart',
  '紅心芭樂',
  '芭樂',
  '[8,7,6,5,4,4,5,6,8,9,10,9]'::jsonb,
  '{"name_en":"Red Heart Guava","is_premium":false,"is_common":false,"tagline":"富含茄紅素，香氣濃郁，口感軟糯","color":"#F08080","keywords":"紅肉芭樂","brix":9,"acidity":4,"calories":40,"gi_value":30,"price_level":2,"energy_index":0,"moisture":8,"aroma":7,"origin":"國產","best_origin":"宜蘭員山","skin_edible":"Yes","seed_edible":"Yes","good_for":"抗氧化、高血壓","bad_for":"便秘（籽）","safety_warning":"無特殊高風險","nutritional_value":"富含茄紅素與類胡蘿蔔素，抗氧化能力優於白肉芭樂。","relief_symptoms":"美白抗氧化,血壓調節,護眼明目,順暢排便","relief_mechanism":"茄紅素抗氧化保護血管；類胡蘿蔔素護眼。","scenario":"美顏補氣,懷舊古早味,軟糯好咬","trivia":"紅心芭樂通常是用來吃軟的，不是吃脆的。"}'::jsonb,
  '{"appearance":"果肉粉紅色（切開才知）","detail":"皮黃綠，通常較軟","tactile":"口感軟糯（吃軟不吃脆）","sense":"土芭樂香氣濃郁","storage":"塑膠袋綁緊冷藏","texture_desc":"口感軟糯（吃軟不吃硬），香氣濃"}'::jsonb,
  ARRAY['紅肉芭樂']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_watermelon',
  '西瓜芭樂',
  '芭樂',
  '[7,7,6,5,4,4,5,6,7,8,8,8]'::jsonb,
  '{"name_en":"Watermelon Guava","is_premium":false,"is_common":false,"tagline":"綠皮紅肉，切開像西瓜，口感清脆","color":"#FF6347","keywords":"彩虹芭樂","brix":9,"acidity":3,"calories":38,"gi_value":30,"price_level":3,"energy_index":0,"moisture":7,"aroma":2,"origin":"國產","best_origin":"彰化","skin_edible":"Yes","seed_edible":"Yes","good_for":"糖尿病、減重","bad_for":"便秘","safety_warning":"無特殊高風險","nutritional_value":"含有茄紅素與維生素C，低熱量高纖維。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"維生素C增強免疫。","scenario":"稀有嘗鮮","trivia":"雖然長得像紅心芭樂，但口感是脆的，且沒有濃郁香味。"}'::jsonb,
  '{"appearance":"皮綠肉紅，外觀像珍珠","detail":"無特殊香氣","tactile":"口感清脆，不軟綿","sense":"無土芭樂味，檢查表皮有無黑點","storage":"塑膠袋綁緊冷藏","texture_desc":"口感清脆，肉質細，無軟綿感"}'::jsonb,
  ARRAY['彩虹芭樂']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_perfume',
  '香水芭樂',
  '芭樂',
  '[6,6,5,4,3,3,4,6,8,9,9,7]'::jsonb,
  '{"name_en":"Perfume Guava","is_premium":false,"is_common":false,"tagline":"香氣傳千里，口感軟綿甜度高","color":"#FFFFE0","keywords":"軟芭樂","brix":13,"acidity":2,"calories":42,"gi_value":32,"price_level":2,"energy_index":0,"moisture":9,"aroma":9,"origin":"國產","best_origin":"彰化社頭","skin_edible":"Yes","seed_edible":"Yes","good_for":"牙口不好、腹瀉","bad_for":"便秘","safety_warning":"無特殊高風險","nutritional_value":"軟糯口感，適合牙口不好者，富含維生素C。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"軟糯口感適合老人攝取纖維。","scenario":"軟糯好咬,料理加工","trivia":"通常用來打果汁或做辦桌甜點，香氣非常強烈。"}'::jsonb,
  '{"appearance":"果形圓潤","detail":"成熟後變黃","tactile":"口感軟綿，手感軟","sense":"香氣極濃，隔著袋子聞得到","storage":"塑膠袋綁緊冷藏","texture_desc":"口感軟綿，入口即化，香氣重"}'::jsonb,
  ARRAY['軟芭樂']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'guava_moon',
  '中山月拔',
  '芭樂',
  '[4,3,2,1,0,0,0,0,1,5,8,6]'::jsonb,
  '{"name_en":"Moon Guava","is_premium":false,"is_common":false,"tagline":"皮黃肉白，專門用來做加工或吃軟","color":"#FFFF00","keywords":"宜蘭芭樂","brix":9,"acidity":6,"calories":45,"gi_value":30,"price_level":2,"energy_index":0,"moisture":7,"aroma":6,"origin":"國產","best_origin":"宜蘭頭城","skin_edible":"Yes","seed_edible":"Yes","good_for":"食慾不振","bad_for":"怕軟爛口感者","safety_warning":"無特殊高風險","nutritional_value":"香氣濃，果膠含量高，維生素C豐富。","relief_symptoms":"止瀉/收斂,幫助消化/解膩","relief_mechanism":"濃郁香氣能刺激食慾。","scenario":"料理加工,懷舊古早味","trivia":"宜蘭名產「紅心芭樂凍」或「芭樂乾」通常是用這種做的。"}'::jsonb,
  '{"appearance":"果皮黃色","detail":"果肉白色","tactile":"極軟爛（加工用）","sense":"香氣濃郁，檢查有無爛掉","storage":"極易爛，需冷藏","texture_desc":"口感極軟爛，適合牙口不好者"}'::jsonb,
  ARRAY['宜蘭芭樂']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_ponkan',
  '椪柑',
  '柑橘',
  '[8,5,2,0,0,0,0,0,0,2,7,10]'::jsonb,
  '{"name_en":"Ponkan Mandarin","is_premium":false,"is_common":true,"tagline":"皮肉分離好剝，果肉柔軟多汁","color":"#FFA500","keywords":"橘子,柑仔,寬皮柑","brix":12,"acidity":3,"calories":45,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":7,"aroma":6,"origin":"國產","best_origin":"台中東勢","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"肺熱咳嗽（黃痰）、酒醉口渴","bad_for":"風寒咳嗽（白痰）、氣虛胃寒","safety_warning":"無特殊高風險","nutritional_value":"富含維生素C、檸檬酸及膳食纖維（橘絡），有助抗氧化與腸道健康。","relief_symptoms":"潤喉養肺,幫助消化/解膩,解酒/宿醉","relief_mechanism":"柑橘酸有助分解酒精；陳皮(橘絡)有助理氣化痰。","scenario":"拜拜祈福,家庭分享,懶人免動刀","trivia":"椪柑的「椪」就是指皮肉分離、膨膨的樣子。"}'::jsonb,
  '{"appearance":"果皮橙黃，底部有凹陷","detail":"蒂頭周圍皺褶明顯","tactile":"拿起來有「浮浮」的感覺（代表皮肉分離）","sense":"聞蒂頭無霉味，有柑橘清香","storage":"通風保存，放幾天辭水後更甜","texture_desc":"果肉柔軟，汁多渣少，纖維細緻"}'::jsonb,
  ARRAY['橘子','柑仔','寬皮柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_tankan',
  '桶柑',
  '柑橘',
  '[9,10,8,4,1,0,0,0,0,0,0,4]'::jsonb,
  '{"name_en":"Tankan","is_premium":false,"is_common":false,"tagline":"過年必備的「年柑」，風味濃郁","color":"#FF8C00","keywords":"年柑,橘子,柑仔","brix":11,"acidity":4,"calories":48,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":8,"aroma":6,"origin":"國產","best_origin":"宜蘭員山","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"食慾不振、燥熱口渴","bad_for":"痰濕體質、風寒感冒","safety_warning":"無特殊高風險","nutritional_value":"含有類黃酮素（Flavonoids）與維生素C，鉀含量適中。","relief_symptoms":"潤喉養肺,美白抗氧化","relief_mechanism":"酸甜生津，水分多能滋潤喉嚨。","scenario":"拜拜祈福,體面送禮","trivia":"因為以前是用木桶裝運，所以叫桶柑。"}'::jsonb,
  '{"appearance":"果皮橙紅，油胞細緻","detail":"蒂頭平整，無枯萎","tactile":"手感沉重（代表水分足）","sense":"柑橘香氣重，檢查果皮有無軟爛","storage":"可套袋冷藏保存較久","texture_desc":"肉質細緻，汁多，纖維適中"}'::jsonb,
  ARRAY['年柑','橘子','柑仔']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_murcott',
  '茂谷柑',
  '柑橘',
  '[9,10,8,2,0,0,0,0,0,0,0,3]'::jsonb,
  '{"name_en":"Murcott Tangerine","is_premium":false,"is_common":false,"tagline":"皮薄汁多，甜度極高的柑橘之王","color":"#FF7F50","keywords":"橘子,蜜柑","brix":14,"acidity":5,"calories":50,"gi_value":45,"price_level":3,"energy_index":-1,"moisture":9,"aroma":7,"origin":"國產","best_origin":"台中東勢","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"熱病後津液不足、口乾","bad_for":"血糖控制不佳、胃酸過多","safety_warning":"**高糖警示**：甜度高。","nutritional_value":"糖酸比高，富含維生素C、有機酸及礦物質鉀。","relief_symptoms":"美白抗氧化,抗發炎/免疫調節","relief_mechanism":"維生素C幫助鐵質吸收，改善氣色並增強免疫。","scenario":"體面送禮,拜拜祈福,生津解渴","trivia":"是寬皮柑與甜橙的混種，難怪這麼甜。"}'::jsonb,
  '{"appearance":"果形扁圓，皮光滑亮麗","detail":"蒂頭微凹，果梗細","tactile":"手感極重（密度高）","sense":"皮薄可透光，檢查有無曬傷痕跡","storage":"皮薄易失水，需冷藏或快吃","texture_desc":"果肉極細緻，水分爆漿，纖維極少"}'::jsonb,
  ARRAY['橘子','蜜柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_sugar',
  '砂糖橘',
  '柑橘',
  '[10,8,3,0,0,0,0,0,0,0,4,9]'::jsonb,
  '{"name_en":"Sugar Mandarin","is_premium":false,"is_common":false,"tagline":"小小一顆，甜到心坎裡，幾乎無酸","color":"#FFA07A","keywords":"一口橘,珍珠柑","brix":16,"acidity":1,"calories":53,"gi_value":50,"price_level":3,"energy_index":1,"moisture":8,"aroma":5,"origin":"國產","best_origin":"南投中寮","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"食少納呆、消化不良","bad_for":"痰多咳嗽、糖尿病","safety_warning":"**高糖警示**：極易過量。","nutritional_value":"果糖含量高，含有維生素C及β-隱黃素（Beta-cryptoxanthin）。","relief_symptoms":"潤喉養肺,美白抗氧化","relief_mechanism":"小巧易食且甜度高，適合生病沒胃口時補充能量。","scenario":"懶人免動刀,螞蟻人","trivia":"因為甜度像砂糖一樣而得名。"}'::jsonb,
  '{"appearance":"果形小，皮粗糙無光澤","detail":"果皮易剝，蒂頭綠","tactile":"果身極軟（皮薄肉軟）","sense":"無特殊異味，檢查有無發霉（極易發霉）","storage":"極易發霉，需冷藏且保持乾燥","texture_desc":"肉質極細嫩，入口即化，無渣"}'::jsonb,
  ARRAY['一口橘','珍珠柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_emperor',
  '帝王柑',
  '柑橘',
  '[5,2,0,0,0,0,0,0,0,1,6,9]'::jsonb,
  '{"name_en":"Emperor Mandarin","is_premium":false,"is_common":false,"tagline":"皮薄好剝，清甜不膩，有檸檬香","color":"#FFD700","keywords":"貢柑","brix":11,"acidity":2,"calories":46,"gi_value":40,"price_level":3,"energy_index":-1,"moisture":9,"aroma":4,"origin":"國產","best_origin":"苗栗卓蘭","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"燥熱咳嗽、口渴","bad_for":"體寒胃痛、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"皮薄，富含揮發性精油（果皮）與維生素C，有機酸含量較低。","relief_symptoms":"美白抗氧化,抗發炎/免疫調節","relief_mechanism":"性質較平和，汁多潤喉，不易生痰。","scenario":"酸甜開胃,懶人免動刀","trivia":"雖然叫帝王柑，但其實性情溫和清爽。"}'::jsonb,
  '{"appearance":"果皮黃綠色（不需全黃）","detail":"皮薄如紙，油胞細","tactile":"手感結實","sense":"帶有淡淡檸檬香","storage":"通風保存","texture_desc":"果肉細緻，水分多，口感清爽"}'::jsonb,
  ARRAY['貢柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_beauty',
  '美人柑',
  '柑橘',
  '[10,9,5,1,0,0,0,0,0,0,0,5]'::jsonb,
  '{"name_en":"Beauty Mandarin","is_premium":false,"is_common":false,"tagline":"果皮紅艷，造型像鐘，果肉細嫩","color":"#FF4500","keywords":"紅柑,美女柑","brix":12,"acidity":5,"calories":44,"gi_value":45,"price_level":3,"energy_index":-1,"moisture":9,"aroma":8,"origin":"國產","best_origin":"苗栗獅潭","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"食積氣滯、口乾","bad_for":"胃酸過多、胃潰瘍","safety_warning":"無特殊高風險","nutritional_value":"富含類胡蘿蔔素、維生素C及膳食纖維，水分含量高。","relief_symptoms":"美白抗氧化,補水/消水腫","relief_mechanism":"富含纖維與水分，促進代謝。","scenario":"體面送禮,稀有嘗鮮","trivia":"又名「紅柑」，是柑橘中外型最特殊的。"}'::jsonb,
  '{"appearance":"果皮橘紅，油胞明顯","detail":"蒂頭處隆起像鼻子（頸部明顯）","tactile":"皮薄汁多，手感沉","sense":"香氣濃烈，檢查頸部有無腐爛","storage":"皮薄易爛，建議冷藏","texture_desc":"肉質細嫩，汁多味濃，纖維少"}'::jsonb,
  ARRAY['紅柑','美女柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_fremont',
  '佛利蒙柑',
  '柑橘',
  '[3,1,0,0,0,0,0,0,0,2,7,9]'::jsonb,
  '{"name_en":"Fremont Mandarin","is_premium":false,"is_common":false,"tagline":"果肉深橙色，風味濃厚酸甜明顯","color":"#FF6347","keywords":"福柑","brix":13,"acidity":4,"calories":49,"gi_value":45,"price_level":2,"energy_index":0,"moisture":8,"aroma":6,"origin":"國產","best_origin":"台東","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"消化不良、食慾差","bad_for":"胃酸過多、空腹","safety_warning":"無特殊高風險","nutritional_value":"果色深橙，β-胡蘿蔔素與維生素C含量高，風味濃郁。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"維生素C含量高，強化身體防禦機制。","scenario":"料理加工,美顏補氣","trivia":"雖然個頭小，但維生素C含量驚人。"}'::jsonb,
  '{"appearance":"果皮深橙紅色，色澤艷麗","detail":"果形扁圓，大小適中","tactile":"皮薄多汁，按壓微軟","sense":"風味極濃，檢查蒂頭有無脫落","storage":"冷藏保存","texture_desc":"果肉柔軟，汁多，風味濃厚"}'::jsonb,
  ARRAY['福柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_haili',
  '海梨柑',
  '柑橘',
  '[8,6,2,0,0,0,0,0,0,0,2,7]'::jsonb,
  '{"name_en":"Haili Tangor","is_premium":false,"is_common":false,"tagline":"酸度極低，口感脆甜，水分較少","color":"#FFD700","keywords":"海梨仔","brix":10,"acidity":2,"calories":42,"gi_value":40,"price_level":2,"energy_index":-2,"moisture":7,"aroma":3,"origin":"國產","best_origin":"新竹芎林","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"熱咳、口乾舌燥","bad_for":"體質虛寒、風寒咳嗽","safety_warning":"無特殊高風險","nutritional_value":"酸度極低，含有維生素C與纖維，對胃部刺激較小。","relief_symptoms":"潤喉養肺,幫助消化/解膩","relief_mechanism":"酸度低刺激小，水分充足滋潤咽喉。","scenario":"螞蟻人,耐放存糧","trivia":"因為水分較少，吃起來不會滴得到處都是。"}'::jsonb,
  '{"appearance":"果皮光滑橙黃","detail":"蒂頭平整","tactile":"按壓較硬實，水分較少","sense":"聞起來幾乎無酸味","storage":"耐儲存，通風即可","texture_desc":"口感硬脆，水分較少，無酸味"}'::jsonb,
  ARRAY['海梨仔']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_orange',
  '柳丁',
  '柑橘',
  '[10,8,4,1,0,0,0,0,0,1,5,10]'::jsonb,
  '{"name_en":"Taiwan Orange","is_premium":false,"is_common":true,"tagline":"台灣國民水果，香甜便宜又營養","color":"#FFA500","keywords":"柳橙,印子柑","brix":12,"acidity":3,"calories":42,"gi_value":45,"price_level":1,"energy_index":0,"moisture":8,"aroma":6,"origin":"國產","best_origin":"雲林古坑","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"酒後口渴、噁心嘔吐、陰虛火旺","bad_for":"飯前空腹、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"富含維生素C、膳食纖維（果膠）及類黃酮，有助於抗氧化。","relief_symptoms":"美白抗氧化,血壓調節,順暢排便","relief_mechanism":"豐富維生素C抗氧化；膳食纖維促進排便。","scenario":"家庭分享,料理加工,美顏補氣","trivia":"季末（1月後）的柳丁雖然醜，但最甜。"}'::jsonb,
  '{"appearance":"果形中小，皮薄光滑","detail":"底部有圓圈（印子）明顯","tactile":"手感沉重，皮貼合果肉","sense":"帶有清香，絕不可有酒味（發酵）","storage":"常溫通風可放2週","texture_desc":"纖維細緻，汁多，口感清甜"}'::jsonb,
  ARRAY['柳橙','印子柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_navel',
  '臍橙',
  '柑橘',
  '[8,5,1,0,0,0,0,0,0,0,3,9]'::jsonb,
  '{"name_en":"Navel Orange","is_premium":true,"is_common":false,"tagline":"柑橘界的勞斯萊斯，無籽多汁","color":"#FF8C00","keywords":"財丁,肚臍丁","brix":13,"acidity":4,"calories":48,"gi_value":48,"price_level":3,"energy_index":0,"moisture":9,"aroma":8,"origin":"國產","best_origin":"台東成功","skin_edible":"Bitter","seed_edible":"None","good_for":"氣滯胸悶、口渴","bad_for":"血糖控制不佳、胃寒","safety_warning":"無特殊高風險","nutritional_value":"無籽，維生素C含量高，富含檸檬酸與鉀。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"鉀離子助排鈉降壓；維C含量高。","scenario":"體面送禮,拜拜祈福,懶人免動刀","trivia":"底部的肚臍其實是一個發育不全的小果實。"}'::jsonb,
  '{"appearance":"果形碩大，顏色橙黃","detail":"底部有明顯「肚臍」（副果）","tactile":"手感極重","sense":"香氣高雅，檢查肚臍處有無發霉","storage":"皮薄易失水，建議套袋冷藏","texture_desc":"肉質細緻，無籽，多汁爽口"}'::jsonb,
  ARRAY['財丁','肚臍丁']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_valencia',
  '晚倫西亞橙',
  '柑橘',
  '[0,1,6,9,8,4,1,0,0,0,0,0]'::jsonb,
  '{"name_en":"Valencia Orange","is_premium":false,"is_common":false,"tagline":"台灣唯一的夏天柳丁，酸甜有勁","color":"#FF7F50","keywords":"香丁,晚生橙","brix":12,"acidity":6,"calories":46,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":9,"aroma":9,"origin":"國產","best_origin":"台東東河","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"暑熱口渴、消化不良","bad_for":"胃酸過多、牙齒敏感","safety_warning":"無特殊高風險","nutritional_value":"酸度較高，富含維生素C、檸檬酸及橙皮苷。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"豐富果糖與水分加速酒精代謝；酸味開胃。","scenario":"酸甜開胃,料理加工","trivia":"因為成熟期長達14個月，又叫「香丁」。"}'::jsonb,
  '{"appearance":"果皮橙黃，略顯粗糙","detail":"果形長圓，蒂頭新鮮","tactile":"汁水量大，手感重","sense":"香氣濃郁，檢查果皮有無軟爛","storage":"冷藏保存","texture_desc":"汁水量大，纖維適中，口感紮實"}'::jsonb,
  ARRAY['香丁','晚生橙']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_blood',
  '血橙',
  '柑橘',
  '[7,6,4,1,0,0,0,0,0,0,0,4]'::jsonb,
  '{"name_en":"Blood Orange","is_premium":false,"is_common":false,"tagline":"果肉帶有血絲般的紅色，富含花青素","color":"#DC143C","keywords":"紅肉柳丁","brix":13,"acidity":5,"calories":48,"gi_value":48,"price_level":4,"energy_index":0,"moisture":9,"aroma":7,"origin":"進口","best_origin":"義大利西西里","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"氣血循環差、食慾不振","bad_for":"胃潰瘍、體質虛寒","safety_warning":"無特殊高風險","nutritional_value":"含有豐富的花青素（Anthocyanin）與維生素C，具強抗氧化力。","relief_symptoms":"補氣血/暖身,美白抗氧化,血壓調節","relief_mechanism":"花青素與維C協同作用，抗氧化並改善循環。","scenario":"美顏補氣,稀有嘗鮮","trivia":"切開像紅寶石一樣，非常適合作沙拉或調酒。"}'::jsonb,
  '{"appearance":"果皮帶有紅暈（像腮紅）","detail":"表皮油胞細緻","tactile":"手感結實","sense":"帶有覆盆子香氣","storage":"冷藏保存","texture_desc":"肉質細緻，帶有特殊莓果風味"}'::jsonb,
  ARRAY['紅肉柳丁']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_wentan',
  '麻豆文旦',
  '柑橘',
  '[0,0,0,0,0,0,0,4,10,7,2,0]'::jsonb,
  '{"name_en":"Wentan Pomelo","is_premium":false,"is_common":true,"tagline":"中秋必吃，果肉細緻甘甜","color":"#9ACD32","keywords":"柚子,文旦柚","brix":11,"acidity":3,"calories":33,"gi_value":30,"price_level":2,"energy_index":-2,"moisture":8,"aroma":7,"origin":"國產","best_origin":"台南麻豆","skin_edible":"No","seed_edible":"Swallow","good_for":"酒醉、口臭、消化不良（肉食）","bad_for":"體質虛寒、腹瀉、服降壓藥者","safety_warning":"**藥物交互作用**：避開高血壓/降血脂藥。","nutritional_value":"富含維生素C、膳食纖維及柚皮苷，鈉含量低，鉀含量高。","relief_symptoms":"幫助消化/解膩,解酒/宿醉,血壓調節","relief_mechanism":"豐富纖維促進大腸蠕動；柚皮苷助消化。","scenario":"拜拜祈福,順暢排空,耐放存糧","trivia":"老欉文旦通常比較小顆，皮也比較薄。"}'::jsonb,
  '{"appearance":"果形上尖下寬（不倒翁狀）","detail":"毛孔（油胞）細緻，底部寬平","tactile":"按壓底部微軟（代表辭水）","sense":"聞起來有文旦清香，無油耗味","storage":"通風「辭水」（消水）後風味最佳","texture_desc":"肉質細緻甘甜，辭水後口感軟米"}'::jsonb,
  ARRAY['柚子','文旦柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_red_pomelo',
  '紅文旦',
  '柑橘',
  '[0,0,0,0,0,0,0,0,2,8,9,4]'::jsonb,
  '{"name_en":"Red Pomelo","is_premium":false,"is_common":false,"tagline":"果肉鮮紅厚實，酸甜多汁，體型大","color":"#F08080","keywords":"紅肉柚子","brix":10,"acidity":4,"calories":35,"gi_value":30,"price_level":3,"energy_index":-1,"moisture":9,"aroma":6,"origin":"國產","best_origin":"台南麻豆","skin_edible":"No","seed_edible":"Swallow","good_for":"氣滯胸悶、消化不良","bad_for":"胃寒者、生理期、服藥者","safety_warning":"**藥物交互作用**：避開特定藥物。","nutritional_value":"果肉紅色含有茄紅素與β-胡蘿蔔素，維生素C含量高於白文旦。","relief_symptoms":"補氣血/暖身,幫助消化/解膩,血壓調節","relief_mechanism":"鉀離子含量高；紅色果肉含抗氧化營養素。","scenario":"拜拜祈福,美顏補氣","trivia":"紅文旦的抗氧化能力比白文旦更高。"}'::jsonb,
  '{"appearance":"果形巨大，呈洋梨形","detail":"果皮粗厚，油胞大","tactile":"手感極重（水分足）","sense":"柚香濃厚，檢查表皮有無蟲蛀","storage":"耐儲存，可放1-2個月","texture_desc":"肉質厚實，水分多，口感紮實"}'::jsonb,
  ARRAY['紅肉柚子']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_white_pomelo',
  '大白柚',
  '柑橘',
  '[0,0,0,0,0,0,0,0,1,6,10,8]'::jsonb,
  '{"name_en":"White Pomelo","is_premium":false,"is_common":false,"tagline":"白露後的珍饈，汁多甘甜，這才是老饕首選","color":"#FFFFE0","keywords":"白柚","brix":10,"acidity":4,"calories":38,"gi_value":30,"price_level":3,"energy_index":-2,"moisture":8,"aroma":6,"origin":"國產","best_origin":"彰化二水","skin_edible":"No","seed_edible":"Swallow","good_for":"咳嗽氣喘（熱咳）、便秘、酒醉","bad_for":"身體虛寒、腹瀉、服藥者","safety_warning":"**藥物交互作用**：避開特定藥物。","nutritional_value":"果實大，維生素C與水分豐富，含有柚皮苷等植化素。","relief_symptoms":"解酒/宿醉,幫助消化/解膩,順暢排便","relief_mechanism":"中醫認為白柚有化痰止咳之效；水分多助代謝酒精。","scenario":"順暢排空,老饕最愛,耐放存糧","trivia":"俗諺「內行人吃白柚，外行人吃文旦」。"}'::jsonb,
  '{"appearance":"果形扁圓巨大","detail":"果皮黃綠，色澤均勻","tactile":"按壓微軟（代表辭水）","sense":"清甜回甘香氣，檢查底部有無腐爛","storage":"通風保存，越放越甜","texture_desc":"肉質豐厚，水分極多，口感軟嫩"}'::jsonb,
  ARRAY['白柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_xishi',
  '西施柚',
  '柑橘',
  '[0,0,0,0,0,0,0,0,0,5,10,8]'::jsonb,
  '{"name_en":"Xishi Pomelo","is_premium":false,"is_common":false,"tagline":"果肉粉紅如西施臉蛋，纖維細緻","color":"#FFC0CB","keywords":"蜜柚","brix":12,"acidity":2,"calories":37,"gi_value":35,"price_level":3,"energy_index":-1,"moisture":9,"aroma":5,"origin":"國產","best_origin":"高雄燕巢","skin_edible":"No","seed_edible":"Swallow","good_for":"食積不化、口乾","bad_for":"腹瀉、體寒、服藥者","safety_warning":"**藥物交互作用**：避開特定藥物。","nutritional_value":"果肉粉紅含有類胡蘿蔔素，纖維細緻，富含維生素C。","relief_symptoms":"幫助消化/解膩,補水/消水腫","relief_mechanism":"纖維細緻幫助腸胃蠕動。","scenario":"酸甜開胃,體面送禮","trivia":"是泰國柚改良品種，口感最細緻的柚子。"}'::jsonb,
  '{"appearance":"表面光滑，絨層透粉紅","detail":"果形圓潤，蒂頭平","tactile":"摸起來像棉花糖般軟（皮軟）","sense":"香氣淡雅，檢查表皮有無黑斑","storage":"通風保存","texture_desc":"肉質極細緻，入口即化，纖維少"}'::jsonb,
  ARRAY['蜜柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_honey_pomelo',
  '蜜柚',
  '柑橘',
  '[0,0,0,0,0,0,0,0,2,7,10,6]'::jsonb,
  '{"name_en":"Honey Pomelo","is_premium":false,"is_common":false,"tagline":"果形圓滾滾，少了文旦的尖頭，口感清甜","color":"#F5F5DC","keywords":"綠皮葡萄柚","brix":11,"acidity":3,"calories":36,"gi_value":35,"price_level":2,"energy_index":-1,"moisture":9,"aroma":4,"origin":"國產","best_origin":"嘉義竹崎","skin_edible":"No","seed_edible":"Swallow","good_for":"胃陰不足、口渴","bad_for":"糖尿病、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"酸度低，含有維生素C及可溶性纖維，水分充足。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"低鈉高鉀，有助於血壓穩定。","scenario":"酸甜開胃,家庭分享","trivia":"又稱「綠皮葡萄柚」，但沒有葡萄柚的苦味。"}'::jsonb,
  '{"appearance":"果形圓球狀","detail":"果皮光滑綠色，無稜角","tactile":"手感沉重","sense":"無苦味，聞起來清香","storage":"通風保存","texture_desc":"肉質軟嫩，水分多，口感清甜"}'::jsonb,
  ARRAY['綠皮葡萄柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_grapefruit_white',
  '葡萄柚',
  '柑橘',
  '[4,2,0,0,0,0,0,0,1,5,9,8]'::jsonb,
  '{"name_en":"White Grapefruit","is_premium":false,"is_common":true,"tagline":"富含維C與膳食纖維，減重好幫手","color":"#FFFFE0","keywords":"白肉葡萄柚","brix":9,"acidity":8,"calories":33,"gi_value":25,"price_level":2,"energy_index":-2,"moisture":10,"aroma":7,"origin":"國產","best_origin":"嘉義竹崎","skin_edible":"No","seed_edible":"Swallow","good_for":"食慾不振、飲酒過量、孕婦（補葉酸）","bad_for":"服用降血壓/血脂藥者（絕對禁忌）、體寒","safety_warning":"**藥物交互作用 (粗體)**：絕對禁止與降血壓/血脂藥同食。","nutritional_value":"富含維生素C、柚皮苷及膳食纖維，鉀含量高。","relief_symptoms":"血壓調節,解酒/宿醉,美白抗氧化","relief_mechanism":"鉀離子助排水；特有香氣與成分助代謝。","scenario":"低卡減負,順暢排空","trivia":"吃葡萄柚減肥是因為它能降低胰島素濃度，不是因為它燃脂。"}'::jsonb,
  '{"appearance":"果皮黃色，皮薄光滑","detail":"果形扁圓，蒂頭完整","tactile":"手感沉重（水分足）","sense":"帶有微苦的柚香，檢查有無壓傷","storage":"通風或冷藏皆可","texture_desc":"果粒感明顯，水分多，纖維稍粗"}'::jsonb,
  ARRAY['白肉葡萄柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_grapefruit_ruby',
  '紅寶石葡萄柚',
  '柑橘',
  '[3,2,0,0,0,0,0,0,2,6,9,7]'::jsonb,
  '{"name_en":"Ruby Grapefruit","is_premium":false,"is_common":false,"tagline":"果肉粉紅，甜度比白肉高，酸苦味較低","color":"#FF6347","keywords":"紅肉葡萄柚","brix":10,"acidity":7,"calories":37,"gi_value":25,"price_level":3,"energy_index":-2,"moisture":10,"aroma":6,"origin":"國產","best_origin":"南非/美國","skin_edible":"No","seed_edible":"Swallow","good_for":"心血管保健、消化不良","bad_for":"服用特定藥物者、胃酸過多","safety_warning":"**藥物交互作用**：絕對禁止與降血壓/血脂藥同食。","nutritional_value":"含有茄紅素、β-胡蘿蔔素及維生素C，抗氧化成分豐富。","relief_symptoms":"美白抗氧化,血壓調節,補水/消水腫","relief_mechanism":"茄紅素抗氧化，保護心血管與免疫系統。","scenario":"低卡減負,美顏補氣","trivia":"粉紅色的肉是因為含有番茄紅素。"}'::jsonb,
  '{"appearance":"果皮帶有紅暈","detail":"皮薄光滑，油胞細","tactile":"按壓有彈性","sense":"香氣較甜，無發酵味","storage":"冷藏保存","texture_desc":"肉質細緻，水分多，口感較白肉軟"}'::jsonb,
  ARRAY['紅肉葡萄柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_grapefruit_star',
  '星紅寶石葡萄柚',
  '柑橘',
  '[3,2,0,0,0,0,0,0,2,6,9,7]'::jsonb,
  '{"name_en":"Star Ruby Grapefruit","is_premium":true,"is_common":false,"tagline":"果肉深紅，皮薄汁多，葡萄柚中的極品","color":"#8B0000","keywords":"深紅葡萄柚","brix":11,"acidity":6,"calories":38,"gi_value":28,"price_level":3,"energy_index":-1,"moisture":10,"aroma":6,"origin":"進口","best_origin":"南非","skin_edible":"No","seed_edible":"Swallow","good_for":"抗氧化需求、便秘","bad_for":"服用特定藥物者、體寒","safety_warning":"**藥物交互作用**：絕對禁止與特定藥物同食。","nutritional_value":"茄紅素含量最高，富含抗氧化劑與膳食纖維。","relief_symptoms":"美白抗氧化,血壓調節","relief_mechanism":"極高維生素C促進膠原蛋白生成。","scenario":"美顏補氣,稀有嘗鮮","trivia":"這是目前世界上果肉顏色最紅的葡萄柚品種。"}'::jsonb,
  '{"appearance":"皮最薄，果色深紅","detail":"表面極光滑，無皺縮","tactile":"手感最重（密度最高）","sense":"甜香明顯","storage":"冷藏保存","texture_desc":"肉質最細緻，水分最多，口感極佳"}'::jsonb,
  ARRAY['深紅葡萄柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_sweetie',
  '甜葡萄柚',
  '柑橘',
  '[6,5,2,0,0,0,0,0,0,2,6,8]'::jsonb,
  '{"name_en":"Sweetie","is_premium":false,"is_common":false,"tagline":"綠皮卻很甜，完全沒有酸澀味","color":"#90EE90","keywords":"青皮葡萄柚","brix":12,"acidity":2,"calories":35,"gi_value":30,"price_level":3,"energy_index":-1,"moisture":9,"aroma":4,"origin":"進口","best_origin":"以色列","skin_edible":"No","seed_edible":"Swallow","good_for":"怕酸想補充維C、口乾","bad_for":"服用特定藥物者","safety_warning":"**藥物交互作用**：絕對禁止與特定藥物同食。","nutritional_value":"酸度低，保留葡萄柚的柚皮苷與維生素C，苦味成分較少。","relief_symptoms":"補水/消水腫,血壓調節","relief_mechanism":"鉀含量豐富，且無酸澀感易入口。","scenario":"螞蟻人,稀有嘗鮮","trivia":"是以色列培育的品種，打破葡萄柚就是酸苦的印象。"}'::jsonb,
  '{"appearance":"果皮長青（綠色）","detail":"果形像柚子，蒂頭綠","tactile":"按壓微軟（皮厚肉軟）","sense":"清香無苦味","storage":"通風保存","texture_desc":"肉質柔軟，汁多，無酸澀感"}'::jsonb,
  ARRAY['青皮葡萄柚']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_calamansi',
  '四季桔',
  '柑橘',
  '[7,7,7,7,8,8,8,7,7,7,7,7]'::jsonb,
  '{"name_en":"Calamansi","is_premium":false,"is_common":false,"tagline":"酸勁十足，調飲佐料必備","color":"#FFA500","keywords":"金桔檸檬,公孫桔","brix":11,"acidity":9,"calories":32,"gi_value":20,"price_level":1,"energy_index":-1,"moisture":8,"aroma":7,"origin":"國產","best_origin":"屏東九如","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"咽喉腫痛、食積氣滯","bad_for":"胃酸過多、牙齒敏感","safety_warning":"無特殊高風險","nutritional_value":"酸度高，富含維生素C、檸檬酸及橘皮苷。","relief_symptoms":"潤喉養肺,美白抗氧化,解酒/宿醉","relief_mechanism":"酸性成分刺激唾液分泌潤喉；金桔苷助化痰。","scenario":"料理加工,潤喉護嗓","trivia":"台灣路邊攤的「金桔檸檬」通常都是用這個四季桔做的，不是真的金桔。"}'::jsonb,
  '{"appearance":"果色金黃或青綠","detail":"果皮光滑，油胞細","tactile":"果實雖軟但有彈性","sense":"酸氣撲鼻，檢查有無發霉","storage":"冷藏保存","texture_desc":"果肉柔軟，汁多酸勁強"}'::jsonb,
  ARRAY['金桔檸檬','公孫桔']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_kumquat',
  '金桔',
  '柑橘',
  '[9,8,6,3,1,0,0,0,0,2,6,9]'::jsonb,
  '{"name_en":"Kumquat","is_premium":false,"is_common":true,"tagline":"連皮吃的迷你柑橘，理氣化痰","color":"#FF8C00","keywords":"金柑,鹹金桔","brix":14,"acidity":7,"calories":55,"gi_value":30,"price_level":2,"energy_index":1,"moisture":4,"aroma":9,"origin":"國產","best_origin":"屏東九如","skin_edible":"Yes","seed_edible":"Swallow","good_for":"咳嗽痰多、胸悶鬱氣、喉嚨乾癢","bad_for":"空腹食用、胃潰瘍","safety_warning":"無特殊高風險","nutritional_value":"連皮食用，富含維生素C、金桔苷及膳食纖維，有助喉嚨保養。","relief_symptoms":"潤喉養肺,幫助消化/解膩,解酒/宿醉","relief_mechanism":"果皮含揮發性精油與維生素P，理氣止咳。","scenario":"潤喉護嗓,懶人免動刀,料理加工","trivia":"皮是甜的，肉是酸的，所以一定要整顆吃才好吃。"}'::jsonb,
  '{"appearance":"果色金黃均勻","detail":"蒂頭翠綠，無枯萎","tactile":"按壓有彈性，不可過軟","sense":"湊近聞皮有精油香","storage":"冷藏保存","texture_desc":"皮脆肉酸，口感層次豐富"}'::jsonb,
  ARRAY['金柑','鹹金桔']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_yilan_kumquat',
  '宜蘭金棗',
  '柑橘',
  '[10,9,5,1,0,0,0,0,0,0,2,7]'::jsonb,
  '{"name_en":"Yilan Kumquat","is_premium":false,"is_common":false,"tagline":"呈橢圓形，皮甜肉酸，生津止渴","color":"#FFA500","keywords":"金柑,長實金柑","brix":15,"acidity":5,"calories":65,"gi_value":35,"price_level":2,"energy_index":1,"moisture":5,"aroma":8,"origin":"國產","best_origin":"宜蘭礁溪","skin_edible":"Yes","seed_edible":"Swallow","good_for":"寒咳（煮湯）、脹氣、消化不良","bad_for":"糖尿病（蜜餞）、蛀牙","safety_warning":"無特殊高風險","nutritional_value":"果皮甜，富含類黃酮、維生素C及揮發性精油。","relief_symptoms":"潤喉養肺,幫助消化/解膩","relief_mechanism":"幫助理氣消食，生津止渴。","scenario":"潤喉護嗓,懶人免動刀,料理加工","trivia":"宜蘭是全台唯一量產金棗的地方，多加工成蜜餞。"}'::jsonb,
  '{"appearance":"果形橢圓長條","detail":"果皮金黃無瑕","tactile":"手感結實，皮肉緊貼","sense":"香氣濃郁，無發酵味","storage":"冷藏保存","texture_desc":"皮甜肉酸，口感爽脆，肉質紮實"}'::jsonb,
  ARRAY['金柑','長實金柑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_lemon',
  '檸檬',
  '柑橘',
  '[6,5,4,5,7,9,10,9,8,7,7,6]'::jsonb,
  '{"name_en":"Lemon","is_premium":false,"is_common":true,"tagline":"維C寶庫，料理提味神隊友","color":"#32CD32","keywords":"利檬,Lemon","brix":8,"acidity":10,"calories":33,"gi_value":20,"price_level":2,"energy_index":-1,"moisture":9,"aroma":9,"origin":"國產","best_origin":"屏東九如","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"暑熱口渴、懷孕嘔吐、咽喉炎","bad_for":"胃潰瘍、胃酸過多、牙齒敏感","safety_warning":"**牙齒酸蝕**：喝完需漱口。","nutritional_value":"富含檸檬酸、維生素C及鉀，果皮含檸檬精油（Limonene）。","relief_symptoms":"美白抗氧化,幫助消化/解膩,解酒/宿醉","relief_mechanism":"維生素C增強白血球活性；酸味刺激肝臟解毒酵素。","scenario":"美顏補氣,料理加工,烘焙","trivia":"檸檬放久了變黃叫黃檸檬？錯，那是不同品種。"}'::jsonb,
  '{"appearance":"果皮綠色且油亮（勿選啞光）","detail":"蒂頭鮮綠，無枯黃","tactile":"手感微軟代表皮薄汁多","sense":"香氣濃烈，檢查表皮有無水傷","storage":"冷藏或切片冷凍","texture_desc":"汁多味酸，果肉細緻"}'::jsonb,
  ARRAY['利檬','Lemon']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_lime',
  '萊姆',
  '柑橘',
  '[5,4,3,4,6,9,10,9,7,6,5,5]'::jsonb,
  '{"name_en":"Lime","is_premium":false,"is_common":false,"tagline":"無籽檸檬，皮薄汁多，酸味較溫和","color":"#006400","keywords":"無籽檸檬,Lime","brix":8,"acidity":9,"calories":30,"gi_value":20,"price_level":3,"energy_index":-1,"moisture":9,"aroma":7,"origin":"國產","best_origin":"屏東","skin_edible":"Bitter","seed_edible":"None","good_for":"食慾不振、中暑","bad_for":"胃酸過多、空腹","safety_warning":"無特殊高風險","nutritional_value":"含有檸檬酸、維生素C及類黃酮，無籽方便食用。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"清香酸味刺激食慾；維生素C抗氧化。","scenario":"料理加工,烘焙","trivia":"分辨檸檬跟萊姆不是看顏色，是看「有沒有籽」和「果皮厚度」。"}'::jsonb,
  '{"appearance":"果皮光滑黃綠色","detail":"屁股平整無乳突（檸檬有乳突）","tactile":"皮極薄，按壓微軟","sense":"香氣較檸檬淡，帶有清香","storage":"冷藏保存","texture_desc":"無籽，汁多，果肉細緻"}'::jsonb,
  ARRAY['無籽檸檬','Lime']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_perfume_lemon',
  '香水檸檬',
  '柑橘',
  '[8,8,8,8,8,8,8,8,8,8,8,8]'::jsonb,
  '{"name_en":"Perfume Lemon","is_premium":false,"is_common":false,"tagline":"果形修長，酸度低，香氣極其濃郁","color":"#FFFF00","keywords":"香檸","brix":9,"acidity":8,"calories":35,"gi_value":25,"price_level":2,"energy_index":0,"moisture":8,"aroma":10,"origin":"國產","best_origin":"花蓮","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"熱咳、咽痛、煩躁","bad_for":"胃寒、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"果皮厚含豐富果膠與精油，維生素C含量豐富。","relief_symptoms":"美白抗氧化,解酒/宿醉","relief_mechanism":"果皮富含精油與多酚，具抗氧化與美膚效果。","scenario":"美顏補氣,料理加工","trivia":"皮沒有苦味，可以直接切片沾梅粉吃。"}'::jsonb,
  '{"appearance":"果形長橢圓","detail":"果皮有明顯凹凸（不光滑）","tactile":"按壓軟代表汁多","sense":"有特殊香茅味，檢查有無蟲咬","storage":"通風保存","texture_desc":"果皮厚但可食，汁多，香氣重"}'::jsonb,
  ARRAY['香檸']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_xiangmeng',
  '扁實檸檬',
  '柑橘',
  '[0,0,0,0,0,0,2,6,9,10,6,2]'::jsonb,
  '{"name_en":"Taiwan Tangerine","is_premium":false,"is_common":false,"tagline":"台灣原生種「香檬」，維生素C是檸檬30倍","color":"#32CD32","keywords":"山桔仔,台灣香檬","brix":10,"acidity":10,"calories":32,"gi_value":25,"price_level":3,"energy_index":-1,"moisture":8,"aroma":9,"origin":"國產","best_origin":"屏東","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"三高族群、疲勞","bad_for":"胃潰瘍、怕酸者","safety_warning":"無特殊高風險","nutritional_value":"富含川陳皮素（Nobiletin）與橘皮素，維生素C含量極高。","relief_symptoms":"舒壓助眠,血壓調節,抗發炎/免疫調節","relief_mechanism":"川陳皮素(Nobiletin)有助代謝；香氣舒緩壓力。","scenario":"美顏補氣,料理加工,特殊護理","trivia":"雖然很酸，但含有的川陳皮素（抗老化成分）極高。"}'::jsonb,
  '{"appearance":"果形極小扁圓","detail":"果皮凹凸不平","tactile":"手感硬實","sense":"有強烈橘子香氣","storage":"冷藏保存","texture_desc":"汁多味酸，果肉細小"}'::jsonb,
  ARRAY['山桔仔','台灣香檬']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_finger_lime',
  '手指檸檬',
  '柑橘',
  '[4,4,4,5,6,7,8,8,7,6,5,4]'::jsonb,
  '{"name_en":"Finger Lime","is_premium":true,"is_common":false,"tagline":"水果界的魚子醬，咬破會爆珠","color":"#FF69B4","keywords":"澳洲手指檸檬","brix":8,"acidity":10,"calories":30,"gi_value":20,"price_level":5,"energy_index":0,"moisture":7,"aroma":8,"origin":"進口","best_origin":"澳洲","skin_edible":"Yes","seed_edible":"Swallow","good_for":"食慾差、消化不良","bad_for":"密集恐懼症、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"含有高量維生素C、檸檬酸及抗氧化成分，型態特殊。","relief_symptoms":"幫助消化/解膩,美白抗氧化","relief_mechanism":"酸味與特殊的爆珠口感能解油膩。","scenario":"稀有嘗鮮,體面送禮","trivia":"澳洲引進的貴族水果，價格非常高昂。"}'::jsonb,
  '{"appearance":"果形像手指，長條狀","detail":"表皮顏色均勻（紅/綠/黑）","tactile":"輕壓有些微彈性","sense":"有萊姆香氣，檢查有無斷裂","storage":"冷藏保存","texture_desc":"果粒如魚卵般爆珠，口感爽脆"}'::jsonb,
  ARRAY['澳洲手指檸檬']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'citrus_meyer',
  '黃檸檬',
  '柑橘',
  '[6,6,6,6,6,6,6,6,6,6,6,6]'::jsonb,
  '{"name_en":"Meyer Lemon","is_premium":false,"is_common":false,"tagline":"酸度柔和帶花香，西式料理必備","color":"#FFFF00","keywords":"梅爾檸檬","brix":9,"acidity":8,"calories":32,"gi_value":25,"price_level":3,"energy_index":-1,"moisture":9,"aroma":8,"origin":"進口","best_origin":"美國加州","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"西式料理解膩、口乾","bad_for":"胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"酸度較溫和，含有檸檬酸、維生素C及鉀。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"溫和的酸味與花香能開胃。","scenario":"烘焙,料理加工","trivia":"梅爾檸檬是檸檬跟橘子的混種，所以比較不酸。"}'::jsonb,
  '{"appearance":"果皮鮮黃色","detail":"表面光滑，毛孔細","tactile":"手感微軟（皮薄）","sense":"有淡淡花香，無發酵味","storage":"冷藏保存","texture_desc":"果肉細緻，汁多，酸度柔和"}'::jsonb,
  ARRAY['梅爾檸檬']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'persimmon_fuyu',
  '甜柿',
  '柿子',
  '[0,0,0,0,0,0,0,0,2,8,10,6]'::jsonb,
  '{"name_en":"Fuyu Persimmon","is_premium":false,"is_common":true,"tagline":"免脫澀直接吃，口感像蘋果般脆甜","color":"#FF8C00","keywords":"富有柿,日本柿","brix":16,"acidity":1,"calories":60,"gi_value":55,"price_level":3,"energy_index":-1,"moisture":6,"aroma":3,"origin":"國產","best_origin":"台中摩天嶺","skin_edible":"Yes","seed_edible":"No","good_for":"肺熱咳嗽、高血壓、便秘","bad_for":"貧血、空腹、搭配螃蟹（胃石）","safety_warning":"**胃石症**：勿空腹/配蟹。","nutritional_value":"富含維生素A、C、鉀及果膠，單寧含量較澀柿低。","relief_symptoms":"解酒/宿醉,血壓調節","relief_mechanism":"鉀離子降壓；單寧酸與酵素加速酒精分解。","scenario":"體面送禮,家庭分享","trivia":"甜柿在樹上就會自己脫澀，所以摘下來洗乾淨就能吃。"}'::jsonb,
  '{"appearance":"果色橙紅均勻","detail":"果形扁圓，萼片綠","tactile":"手感沉重，硬脆","sense":"脆甜無澀，檢查萼片下有無蟲糞","storage":"冷藏保存","texture_desc":"口感硬脆，像蘋果，肉質細"}'::jsonb,
  ARRAY['富有柿','日本柿']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'persimmon_jiro',
  '次郎甜柿',
  '柿子',
  '[0,0,0,0,0,0,0,0,3,9,9,5]'::jsonb,
  '{"name_en":"Jiro Persimmon","is_premium":false,"is_common":false,"tagline":"果形方正，口感比富有更脆硬","color":"#FFA500","keywords":"次郎","brix":15,"acidity":1,"calories":58,"gi_value":55,"price_level":3,"energy_index":-1,"moisture":5,"aroma":3,"origin":"國產","best_origin":"苗栗泰安","skin_edible":"Yes","seed_edible":"No","good_for":"熱渴、便血","bad_for":"體寒、胃酸過多","safety_warning":"**胃石症**：勿空腹。","nutritional_value":"口感脆，含有β-胡蘿蔔素、維生素C及膳食纖維。","relief_symptoms":"解酒/宿醉,血壓調節","relief_mechanism":"鉀含量豐富。","scenario":"家庭分享","trivia":"因為果形方正，很容易辨認，口感比富有柿更硬一些。"}'::jsonb,
  '{"appearance":"果形呈方形","detail":"有四條明顯溝紋","tactile":"質地硬脆","sense":"甜度高，無澀味","storage":"冷藏保存","texture_desc":"口感比富有更硬脆，肉質紮實"}'::jsonb,
  ARRAY['次郎']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'persimmon_astringent',
  '澀柿',
  '柿子',
  '[0,0,0,0,0,0,0,0,4,10,8,2]'::jsonb,
  '{"name_en":"Astringent Persimmon","is_premium":false,"is_common":false,"tagline":"需加工脫澀（水柿/紅柿），軟糯爆漿","color":"#FF4500","keywords":"水柿,紅柿,軟柿","brix":14,"acidity":3,"calories":55,"gi_value":55,"price_level":2,"energy_index":-2,"moisture":7,"aroma":3,"origin":"國產","best_origin":"嘉義番路","skin_edible":"Yes","seed_edible":"No","good_for":"甲狀腺腫大、高血壓","bad_for":"便秘、缺鐵性貧血","safety_warning":"**胃石症**：勿空腹。","nutritional_value":"脫澀後食用，單寧轉化不溶性，富含維生素A與糖分。","relief_symptoms":"止瀉/收斂,血壓調節","relief_mechanism":"未脫澀的單寧酸具收斂作用；柿餅上的柿霜潤肺。","scenario":"懷舊古早味,軟糯好咬","trivia":"未脫澀前絕對不能吃，會澀到舌頭麻掉。"}'::jsonb,
  '{"appearance":"果形尖圓","detail":"果皮橘紅（紅柿）","tactile":"按壓極軟（紅柿才可吃）","sense":"無澀味（需試吃或看軟度）","storage":"軟柿冷藏，硬柿室溫","texture_desc":"脫澀後口感軟爛，像果凍（紅柿）"}'::jsonb,
  ARRAY['水柿','紅柿','軟柿']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'persimmon_pencil',
  '筆柿',
  '柿子',
  '[1,0,0,0,0,0,0,0,0,1,6,10]'::jsonb,
  '{"name_en":"Pencil Persimmon","is_premium":false,"is_common":false,"tagline":"形狀像毛筆，甜度是柿子中最高的","color":"#FF6347","keywords":"長柿","brix":18,"acidity":1,"calories":62,"gi_value":58,"price_level":2,"energy_index":-1,"moisture":6,"aroma":3,"origin":"國產","best_origin":"台中","skin_edible":"Yes","seed_edible":"No","good_for":"體虛、咳嗽（柿餅）","bad_for":"糖尿病、消化不良","safety_warning":"**高糖/胃石症**。","nutritional_value":"糖度極高，乾燥成柿餅後富含膳食纖維與礦物質。","relief_symptoms":"解酒/宿醉,美白抗氧化","relief_mechanism":"做成柿餅後糖分濃縮，快速補給能量。","scenario":"螞蟻人,料理加工","trivia":"通常做成柿餅，甜度會濃縮到像糖果一樣。"}'::jsonb,
  '{"appearance":"果形長條如筆","detail":"果色深紅","tactile":"按壓軟爛（像水球）","sense":"甜如蜂蜜，檢查有無破皮","storage":"冷藏保存","texture_desc":"口感極軟爛，甜度濃縮，像蜜糖"}'::jsonb,
  ARRAY['長柿']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'persimmon_bull_heart',
  '牛心柿',
  '柿子',
  '[0,0,0,0,0,0,0,0,4,10,8,2]'::jsonb,
  '{"name_en":"Bull Heart Persimmon","is_premium":false,"is_common":true,"tagline":"經石灰脫澀的脆柿，口感像餅乾一樣脆","color":"#FFD700","keywords":"水柿,脆柿","brix":14,"acidity":1,"calories":65,"gi_value":55,"price_level":2,"energy_index":-1,"moisture":5,"aroma":2,"origin":"國產","best_origin":"嘉義番路","skin_edible":"Yes","seed_edible":"No","good_for":"腹瀉（收斂）、高血壓","bad_for":"便秘、貧血、空腹","safety_warning":"**胃石症**：勿空腹食用或配螃蟹。","nutritional_value":"富含果膠、鉀及維生素A，單寧酸已轉化不溶性。","relief_symptoms":"止瀉/收斂,解酒/宿醉","relief_mechanism":"單寧酸具收斂作用；鉀助解酒。","scenario":"懷舊古早味,軟糯好咬,料理加工,耐放存糧","trivia":"外面白白的粉是石灰，不是發霉，是要讓它脫澀用的。"}'::jsonb,
  '{"appearance":"果形像牛心，果皮黃綠色（有白色石灰粉）","detail":"蒂頭鮮綠","tactile":"質地極硬，敲擊有聲","sense":"無特殊香氣，吃的是口感","storage":"常溫保存，不要水洗（會變軟）","texture_desc":"口感極硬脆，像吃餅乾或青蘋果"}'::jsonb,
  ARRAY['水柿','脆柿']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_north',
  '北蕉',
  '香蕉',
  '[8,8,8,9,9,8,7,7,7,8,8,8]'::jsonb,
  '{"name_en":"Cavendish Banana","is_premium":false,"is_common":true,"tagline":"台灣最常見的香蕉，香甜軟糯","color":"#FFFFE0","keywords":"弓蕉,香蕉","brix":19,"acidity":2,"calories":85,"gi_value":55,"price_level":1,"energy_index":-1,"moisture":4,"aroma":8,"origin":"國產","best_origin":"高雄旗山","skin_edible":"No","seed_edible":"None","good_for":"腸燥便秘（乾硬便）、憂鬱心煩、高血壓","bad_for":"脾胃虛寒（拉肚子）、腎臟病（限鉀）","safety_warning":"**高鉀警示**：鉀含量高，腎友需限量。","nutritional_value":"富含鉀離子有助血壓調節，含有色胺酸有助合成血清素，高GI水果。","relief_symptoms":"順暢排便,血壓調節,舒壓助眠","relief_mechanism":"富含鉀離子調節電解質預防抽筋；色胺酸助合成血清素穩定情緒。","scenario":"生津解渴,順暢排空,家庭分享,軟糯好咬","trivia":"香蕉的彎度跟品種有關，跟甜度無關。"}'::jsonb,
  '{"appearance":"果皮轉黃且有褐斑（芝麻斑）","detail":"果梗切口新鮮，無發黑腐爛","tactile":"果身飽滿有彈性，不軟爛","sense":"無異味（發酵味），檢查有無壓傷","storage":"掛在通風處，不宜冷藏（會變黑）","texture_desc":"口感軟糯，質地細緻，香甜濃郁"}'::jsonb,
  ARRAY['弓蕉','香蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_lady_finger',
  '芭蕉',
  '香蕉',
  '[7,7,7,8,9,9,9,8,7,7,7,7]'::jsonb,
  '{"name_en":"Lady Finger Banana","is_premium":false,"is_common":false,"tagline":"口感Q彈帶酸，風味獨特","color":"#F5DEB3","keywords":"弓蕉,酸蕉","brix":18,"acidity":5,"calories":95,"gi_value":52,"price_level":2,"energy_index":0,"moisture":5,"aroma":6,"origin":"國產","best_origin":"南投中寮","skin_edible":"No","seed_edible":"None","good_for":"熱結便秘、煩渴","bad_for":"體質虛寒、胃痛","safety_warning":"**高鉀警示**：鉀含量高。","nutritional_value":"抗性澱粉含量較一般香蕉高，富含膳食纖維與鉀，有助增加飽足感。","relief_symptoms":"順暢排便,補水/消水腫","relief_mechanism":"抗性澱粉與膳食纖維含量高，促進腸道蠕動。","scenario":"順暢排空,懷舊古早味","trivia":"芭蕉熱量比一般香蕉高，減重者注意。"}'::jsonb,
  '{"appearance":"果形短胖，稜角明顯","detail":"蒂頭較粗且鮮綠","tactile":"按壓果身要軟才好吃","sense":"湊近聞帶有微酸的果香","storage":"通風保存，需完全熟透才吃","texture_desc":"口感Q彈，肉質紮實，帶有嚼勁"}'::jsonb,
  ARRAY['弓蕉','酸蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_kluaikhai',
  '旦蕉',
  '香蕉',
  '[5,5,6,7,8,9,9,8,7,6,5,5]'::jsonb,
  '{"name_en":"Kluai Khai Banana","is_premium":false,"is_common":false,"tagline":"皮薄如紙，甜度驚人的「一口蕉」","color":"#FFD700","keywords":"一口蕉,雞蛋蕉","brix":22,"acidity":1,"calories":98,"gi_value":60,"price_level":3,"energy_index":1,"moisture":3,"aroma":9,"origin":"國產","best_origin":"屏東","skin_edible":"No","seed_edible":"None","good_for":"體虛消瘦、便秘","bad_for":"糖尿病、腹瀉者","safety_warning":"**高糖警示**：極甜。","nutritional_value":"糖分密度高，富含碳水化合物與鉀，快速補充能量。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"高密度碳水化合物，運動前後的能量補給站。","scenario":"懶人免動刀,螞蟻人","trivia":"皮薄到透光，又稱「雞蛋蕉」。"}'::jsonb,
  '{"appearance":"果形極小，皮薄透光","detail":"果皮金黃無斑，蒂頭新鮮","tactile":"輕輕一捏皮肉分離","sense":"香氣帶有明顯蛋香","storage":"極易過熟，買回要快吃","texture_desc":"肉質綿密，口感滑順，甜度極高"}'::jsonb,
  ARRAY['一口蕉','雞蛋蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_red',
  '紅皮蕉',
  '香蕉',
  '[4,4,5,6,8,9,9,8,6,5,4,4]'::jsonb,
  '{"name_en":"Red Banana","is_premium":false,"is_common":false,"tagline":"果皮紫紅色，帶有淡淡蘋果香","color":"#A52A2A","keywords":"蘋果蕉","brix":18,"acidity":3,"calories":90,"gi_value":55,"price_level":3,"energy_index":0,"moisture":5,"aroma":7,"origin":"國產","best_origin":"屏東","skin_edible":"No","seed_edible":"None","good_for":"情緒低落、便秘","bad_for":"腎臟病、腸胃虛寒","safety_warning":"**高鉀警示**：鉀含量高。","nutritional_value":"含有類胡蘿蔔素與花青素，鉀與鎂含量豐富。","relief_symptoms":"護眼明目,順暢排便","relief_mechanism":"含有較多β-胡蘿蔔素與花青素，抗氧化護眼。","scenario":"稀有嘗鮮,視覺系","trivia":"肉質軟黏，口感像奶油。"}'::jsonb,
  '{"appearance":"果皮呈現暗紫紅色","detail":"果指較短肥，排列緊密","tactile":"手感軟糯，不可過硬","sense":"湊近聞帶有淡淡蘋果香氣","storage":"通風保存","texture_desc":"肉質軟黏，口感像奶油，纖維少"}'::jsonb,
  ARRAY['蘋果蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_rose',
  '玫瑰蕉',
  '香蕉',
  '[5,5,6,8,9,9,8,7,6,5,5,5]'::jsonb,
  '{"name_en":"Rose Banana","is_premium":false,"is_common":false,"tagline":"細長秀氣，帶有淡淡玫瑰香","color":"#FFC0CB","keywords":"拜拜蕉","brix":20,"acidity":2,"calories":92,"gi_value":58,"price_level":3,"energy_index":0,"moisture":4,"aroma":9,"origin":"國產","best_origin":"南投","skin_edible":"No","seed_edible":"None","good_for":"消化不良、便秘","bad_for":"腎臟病、腹瀉","safety_warning":"**高糖/高鉀**。","nutritional_value":"香氣成分特殊，含有維生素B6、C及膳食纖維。","relief_symptoms":"舒壓助眠,順暢排便","relief_mechanism":"纖維細緻，較易消化，減少腸胃負擔。","scenario":"稀有嘗鮮,視覺系","trivia":"是野生蕉馴化而來，抗病力強。"}'::jsonb,
  '{"appearance":"果形細長秀氣","detail":"果皮黃亮，兩端尖細","tactile":"手感微軟","sense":"聞起來有淡淡玫瑰花香","storage":"通風保存","texture_desc":"肉質細緻，口感軟糯，香氣特殊"}'::jsonb,
  ARRAY['拜拜蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_latundan',
  '呂宋蕉',
  '香蕉',
  '[6,6,7,8,9,9,8,7,6,6,6,6]'::jsonb,
  '{"name_en":"Latundan Banana","is_premium":false,"is_common":false,"tagline":"帶有特殊的果酸味，口感清爽","color":"#FFFACD","keywords":"南洋蕉","brix":17,"acidity":4,"calories":88,"gi_value":52,"price_level":2,"energy_index":-1,"moisture":5,"aroma":6,"origin":"國產","best_origin":"屏東","skin_edible":"No","seed_edible":"None","good_for":"熱病煩渴、便秘","bad_for":"胃寒痛、腹瀉","safety_warning":"**高鉀警示**。","nutritional_value":"帶有果酸，富含維生素C與膳食纖維，熱量較一般香蕉略低。","relief_symptoms":"順暢排便,血壓調節","relief_mechanism":"果膠豐富，有助於潤腸通便。","scenario":"稀有嘗鮮,酸甜開胃","trivia":"在菲律賓是最受歡迎的品種之一。"}'::jsonb,
  '{"appearance":"果皮黃中帶青，略顯粗糙","detail":"果指較短，排列整齊","tactile":"手感結實","sense":"清香解膩，檢查果皮有無裂開","storage":"通風保存","texture_desc":"口感綿密，略帶粉質，酸甜適中"}'::jsonb,
  ARRAY['南洋蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_emperor',
  '帝王芭蕉',
  '香蕉',
  '[6,6,7,8,9,9,8,7,6,6,6,6]'::jsonb,
  '{"name_en":"Emperor Banana","is_premium":true,"is_common":false,"tagline":"公認最好吃的芭蕉，肉質細緻","color":"#DAA520","keywords":"皇帝蕉","brix":19,"acidity":3,"calories":90,"gi_value":55,"price_level":3,"energy_index":0,"moisture":5,"aroma":6,"origin":"國產","best_origin":"高雄","skin_edible":"No","seed_edible":"None","good_for":"體虛便秘、痔瘡出血","bad_for":"腎臟病、脾虛泄瀉","safety_warning":"**高鉀警示**。","nutritional_value":"肉質細緻，富含果膠、鉀、鎂及維生素B群。","relief_symptoms":"舒壓助眠,順暢排便","relief_mechanism":"營養密度高，鉀含量豐富助降壓。","scenario":"老饕最愛,順暢排空","trivia":"古時候是進貢給皇帝吃的，故名帝王蕉。"}'::jsonb,
  '{"appearance":"果形較一般芭蕉長","detail":"稜角較不明顯，轉黃均勻","tactile":"手感Q彈","sense":"香氣濃郁，檢查有無壓傷","storage":"通風保存","texture_desc":"肉質細緻Q彈，口感極佳，無酸味"}'::jsonb,
  ARRAY['皇帝蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'banana_honey',
  '蜜蕉',
  '香蕉',
  '[5,5,6,7,9,9,8,7,6,5,5,5]'::jsonb,
  '{"name_en":"Honey Banana","is_premium":false,"is_common":false,"tagline":"甜度高，口感綿密","color":"#F0E68C","keywords":"山蕉","brix":21,"acidity":2,"calories":96,"gi_value":58,"price_level":2,"energy_index":1,"moisture":4,"aroma":7,"origin":"國產","best_origin":"台南","skin_edible":"No","seed_edible":"None","good_for":"運動後疲勞、消瘦","bad_for":"糖尿病、腎臟病","safety_warning":"**高熱量**：熱量較高。","nutritional_value":"碳水化合物密度高，提供高熱量與鉀，適合運動後補充。","relief_symptoms":"舒壓助眠,順暢排便","relief_mechanism":"熱量高，鉀離子豐富，適合高強度運動後補充。","scenario":"生津解渴,特殊護理","trivia":"常生長在山區，又稱山蕉。"}'::jsonb,
  '{"appearance":"果柄較長，彎曲度大","detail":"果尾尖細，皮厚","tactile":"手感黏密微軟","sense":"甜味濃厚，檢查表皮黑斑不宜過多","storage":"通風保存","texture_desc":"肉質黏密，口感紮實，甜度濃縮"}'::jsonb,
  ARRAY['山蕉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'peach_lalashan',
  '拉拉山水蜜桃',
  '核果',
  '[0,0,0,0,2,8,10,6,1,0,0,0]'::jsonb,
  '{"name_en":"Lalashan Peach","is_premium":true,"is_common":false,"tagline":"高山雲霧孕育，皮薄汁多氣味香","color":"#FFB6C1","keywords":"水蜜桃","brix":14,"acidity":2,"calories":39,"gi_value":42,"price_level":5,"energy_index":1,"moisture":9,"aroma":10,"origin":"國產","best_origin":"桃園拉拉山","skin_edible":"Yes","seed_edible":"No","good_for":"氣血虧虛、面黃肌瘦、乾咳","bad_for":"內熱上火、糖尿病、嬰兒（絨毛）","safety_warning":"無特殊高風險","nutritional_value":"皮薄汁多，富含鐵質、維生素C及多酚類，抗氧化。","relief_symptoms":"補氣血/暖身,順暢排便,美白抗氧化","relief_mechanism":"鐵質含量在水果中尚可，補氣血；維C助美白。","scenario":"體面送禮,酸甜開胃","trivia":"真正的拉拉山水蜜桃蒂頭周圍會有「平坦」的特徵。"}'::jsonb,
  '{"appearance":"表面絨毛明顯","detail":"縫合線淺，蒂頭周圍平坦","tactile":"按壓極軟（小心輕摸）","sense":"香氣濃郁，檢查盒底有無出水","storage":"極易碰傷，原盒冷藏","texture_desc":"肉質極細緻，柔軟多汁，入口即化"}'::jsonb,
  ARRAY['水蜜桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'peach_import',
  '進口水蜜桃',
  '核果',
  '[0,0,0,0,2,6,9,10,8,4,1,0]'::jsonb,
  '{"name_en":"Imported Peach","is_premium":false,"is_common":true,"tagline":"個頭大，口感較紮實，價格較親民","color":"#FFC0CB","keywords":"加州桃,日本桃","brix":13,"acidity":3,"calories":42,"gi_value":40,"price_level":3,"energy_index":1,"moisture":8,"aroma":8,"origin":"進口","best_origin":"美國/日本","skin_edible":"Yes","seed_edible":"No","good_for":"便秘、皮膚乾燥","bad_for":"糖尿病、熱性體質","safety_warning":"無特殊高風險","nutritional_value":"口感較硬，纖維較多，含有維生素A、C及鉀。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"果膠與纖維含量豐富。","scenario":"體面送禮,家庭分享","trivia":"通常指美國或智利進口的桃子，比較耐放。"}'::jsonb,
  '{"appearance":"顏色紅潤，絨毛較少","detail":"縫合線明顯","tactile":"手感較硬，耐壓","sense":"香氣較淡，室溫放軟後才有香味","storage":"室溫放軟後冷藏","texture_desc":"口感硬脆，肉質紮實，耐儲運"}'::jsonb,
  ARRAY['加州桃','日本桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'nectarine',
  '甜桃',
  '核果',
  '[2,1,0,0,3,7,9,8,4,1,1,1]'::jsonb,
  '{"name_en":"Nectarine","is_premium":false,"is_common":false,"tagline":"表面光滑無毛，口感脆甜像李子","color":"#DC143C","keywords":"油桃","brix":12,"acidity":5,"calories":44,"gi_value":40,"price_level":2,"energy_index":1,"moisture":7,"aroma":6,"origin":"進口","best_origin":"美國加州","skin_edible":"Yes","seed_edible":"No","good_for":"津液不足、便秘","bad_for":"熱性體質、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"無絨毛，富含維生素C、A及膳食纖維，口感似李子。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"連皮吃纖維多；維生素C含量不錯。","scenario":"懶人免動刀,家庭分享","trivia":"又稱油桃，是桃子的一種變異，不是李子混種。"}'::jsonb,
  '{"appearance":"果皮光滑油亮（無毛）","detail":"顏色鮮紅","tactile":"觸感硬實，像李子","sense":"甜中帶酸，無特殊香氣","storage":"冷藏保存","texture_desc":"口感脆硬，肉質紮實，帶皮吃口感佳"}'::jsonb,
  ARRAY['油桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'peach_flat',
  '蟠桃',
  '核果',
  '[1,1,0,0,2,6,9,8,4,1,0,0]'::jsonb,
  '{"name_en":"Flat Peach","is_premium":false,"is_common":false,"tagline":"形狀扁平像甜甜圈，甜度極高","color":"#FF69B4","keywords":"扁桃,飛碟桃","brix":15,"acidity":2,"calories":45,"gi_value":42,"price_level":4,"energy_index":1,"moisture":8,"aroma":8,"origin":"進口","best_origin":"西班牙","skin_edible":"Yes","seed_edible":"No","good_for":"缺鐵貧血、經期後","bad_for":"上火、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"甜度高，含有維生素C、鐵及多種氨基酸。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"含鐵量與維生素C輔助造血。","scenario":"稀有嘗鮮,螞蟻人","trivia":"傳說中王母娘娘開趴吃的桃子就是這種。"}'::jsonb,
  '{"appearance":"形狀扁平，像飛碟","detail":"果窩深陷","tactile":"肉質細緻，邊緣微軟","sense":"香氣濃，檢查果皮有無裂痕","storage":"冷藏保存","texture_desc":"肉質細緻，口感軟糯，甜度高"}'::jsonb,
  ARRAY['扁桃','飛碟桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'peach_yingge',
  '鶯歌桃',
  '核果',
  '[0,0,0,4,9,8,2,0,0,0,0,0]'::jsonb,
  '{"name_en":"Yingge Peach","is_premium":false,"is_common":false,"tagline":"口感硬脆，醃漬桃子的最佳原料","color":"#F08080","keywords":"脆桃,醃桃","brix":10,"acidity":6,"calories":38,"gi_value":35,"price_level":1,"energy_index":0,"moisture":5,"aroma":4,"origin":"國產","best_origin":"桃園鶯歌","skin_edible":"Yes","seed_edible":"No","good_for":"消化不良（醃漬）、口乾","bad_for":"胃酸過多、牙齒敏感","safety_warning":"無特殊高風險","nutritional_value":"質地硬，有機酸含量高，通常醃漬後食用。","relief_symptoms":"順暢排便,補氣血/暖身","relief_mechanism":"通常醃漬食用，酸甜味助開胃消食。","scenario":"懷舊古早味,料理加工","trivia":"因為尾巴尖尖像鶯歌鳥的嘴巴而得名。"}'::jsonb,
  '{"appearance":"果頂尖尖像鳥嘴","detail":"果色偏青紅","tactile":"質地極硬，像石頭","sense":"酸澀味重，主要檢查有無蟲蛀","storage":"通常醃漬後食用","texture_desc":"口感極硬脆，酸澀，適合醃漬"}'::jsonb,
  ARRAY['脆桃','醃桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_red',
  '紅肉李',
  '核果',
  '[0,0,0,2,8,10,4,0,0,0,0,0]'::jsonb,
  '{"name_en":"Red Flesh Plum","is_premium":false,"is_common":true,"tagline":"果肉鮮紅酸甜，釀酒醃漬皆宜","color":"#8B0000","keywords":"李子,桃接李","brix":12,"acidity":7,"calories":48,"gi_value":35,"price_level":2,"energy_index":0,"moisture":8,"aroma":5,"origin":"國產","best_origin":"苗栗大湖","skin_edible":"Yes","seed_edible":"No","good_for":"陰虛內熱、肝硬化腹水、便秘","bad_for":"脾胃虛寒、胃酸過多、潰瘍","safety_warning":"無特殊高風險","nutritional_value":"果皮果肉皆紅，富含花青素、維生素C及膳食纖維。","relief_symptoms":"幫助消化/解膩,補氣血/暖身,順暢排便","relief_mechanism":"促進胃酸與消化酶分泌；花青素與鐵助氣色。","scenario":"料理加工,酸甜開胃,美顏補氣","trivia":"花青素含量極高，抗氧化效果好。"}'::jsonb,
  '{"appearance":"果皮紫黑有果粉","detail":"果形圓潤","tactile":"按壓微軟（太硬會酸）","sense":"酸味明顯，無發酵味","storage":"室溫放軟或醃漬","texture_desc":"口感軟嫩多汁，皮酸肉甜"}'::jsonb,
  ARRAY['李子','桃接李']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_yellow',
  '黃肉李',
  '核果',
  '[0,0,0,2,7,10,5,0,0,0,0,0]'::jsonb,
  '{"name_en":"Yellow Flesh Plum","is_premium":false,"is_common":false,"tagline":"果肉金黃，完熟後蜜甜多汁","color":"#FFD700","keywords":"宜蘭李","brix":13,"acidity":5,"calories":50,"gi_value":38,"price_level":2,"energy_index":0,"moisture":8,"aroma":6,"origin":"國產","best_origin":"宜蘭","skin_edible":"Yes","seed_edible":"No","good_for":"陰虛發熱、口渴","bad_for":"胃酸過多、痰濕體質","safety_warning":"無特殊高風險","nutritional_value":"富含類胡蘿蔔素、維生素A及糖分，完熟時質地軟。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"酸甜口感刺激味蕾。","scenario":"料理加工,螞蟻人","trivia":"又稱「宜蘭李」，完全成熟時甜度驚人。"}'::jsonb,
  '{"appearance":"果皮黃中帶紅","detail":"果形微尖","tactile":"完熟時極軟","sense":"蜜香味重，檢查有無裂果","storage":"室溫放軟後冷藏","texture_desc":"完熟時口感極軟爛，像果醬"}'::jsonb,
  ARRAY['宜蘭李']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_dino_egg',
  '恐龍蛋',
  '核果',
  '[0,0,0,0,0,2,6,9,8,4,0,0]'::jsonb,
  '{"name_en":"Pluot","is_premium":false,"is_common":false,"tagline":"李子與杏的混種，花斑外皮口感極甜","color":"#A0522D","keywords":"杏李","brix":15,"acidity":3,"calories":52,"gi_value":40,"price_level":4,"energy_index":0,"moisture":7,"aroma":6,"origin":"進口","best_origin":"美國加州","skin_edible":"Yes","seed_edible":"No","good_for":"津液不足、便秘","bad_for":"糖尿病、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"杏李混種，糖度極高，富含維生素A、C及鉀。","relief_symptoms":"順暢排便,幫助消化/解膩","relief_mechanism":"維生素A護眼；纖維助排便。","scenario":"螞蟻人,懶人免動刀","trivia":"學名是「杏李」，兼具杏的香氣與李子的甜味。"}'::jsonb,
  '{"appearance":"果皮有斑點像蛋","detail":"果粉厚（越多越好）","tactile":"肉質細緻，手感結實","sense":"甜度極高，無特殊香氣","storage":"冷藏保存","texture_desc":"肉質細緻，口感Q彈，甜度高"}'::jsonb,
  ARRAY['杏李']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_watermelon',
  '西瓜李',
  '核果',
  '[0,0,0,0,1,6,9,5,0,0,0,0]'::jsonb,
  '{"name_en":"Watermelon Plum","is_premium":false,"is_common":false,"tagline":"綠皮紅肉，咬開像小西瓜一樣驚喜","color":"#DC143C","keywords":"櫻桃李","brix":14,"acidity":4,"calories":46,"gi_value":38,"price_level":3,"energy_index":0,"moisture":8,"aroma":5,"origin":"國產","best_origin":"台中梨山","skin_edible":"Yes","seed_edible":"No","good_for":"食積不化、口乾","bad_for":"脾胃虛寒","safety_warning":"無特殊高風險","nutritional_value":"果肉鮮紅，含有花青素、維生素C及有機酸。","relief_symptoms":"幫助消化/解膩,美白抗氧化","relief_mechanism":"酸度較高，解油膩助消化。","scenario":"稀有嘗鮮,酸甜開胃","trivia":"外表不起眼，切開卻是鮮豔的紅色，反差萌代表。"}'::jsonb,
  '{"appearance":"果皮青綠（熟了也是綠）","detail":"果形圓潤","tactile":"口感脆酸，手感硬","sense":"有特殊李子香，檢查有無變軟","storage":"冷藏保存","texture_desc":"口感脆酸，肉質紮實，皮薄"}'::jsonb,
  ARRAY['櫻桃李']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_grafted',
  '桃接李',
  '核果',
  '[0,0,0,4,9,7,1,0,0,0,0,0]'::jsonb,
  '{"name_en":"Grafted Plum","is_premium":false,"is_common":false,"tagline":"透過嫁接技術，口感更脆甜","color":"#800000","keywords":"李子","brix":11,"acidity":6,"calories":45,"gi_value":35,"price_level":2,"energy_index":0,"moisture":7,"aroma":4,"origin":"國產","best_origin":"苗栗泰安","skin_edible":"Yes","seed_edible":"No","good_for":"消化不良、腹脹","bad_for":"胃酸過多、牙齒敏感","safety_warning":"無特殊高風險","nutritional_value":"口感脆，含有鈣、磷、鐵及維生素B群。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"口感脆硬纖維多。","scenario":"酸甜開胃,懷舊古早味","trivia":"是把李子接在桃樹上？錯，是把不同品種的李子互相嫁接。"}'::jsonb,
  '{"appearance":"果形較小，深紅色","detail":"果皮紅潤光滑","tactile":"口感脆硬，不軟","sense":"酸甜適中，檢查有無裂痕","storage":"冷藏保存","texture_desc":"口感脆硬，酸甜適中，肉質細"}'::jsonb,
  ARRAY['李子']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_black',
  '加州黑李',
  '核果',
  '[2,1,0,0,0,3,7,9,8,4,1,1]'::jsonb,
  '{"name_en":"Black Plum","is_premium":false,"is_common":false,"tagline":"皮黑肉黃，口感脆硬，耐儲存","color":"#2F4F4F","keywords":"黑李,恐龍蛋(誤稱)","brix":13,"acidity":4,"calories":55,"gi_value":38,"price_level":2,"energy_index":0,"moisture":7,"aroma":5,"origin":"進口","best_origin":"美國加州","skin_edible":"Yes","seed_edible":"No","good_for":"便秘、肝熱","bad_for":"脾虛泄瀉","safety_warning":"無特殊高風險","nutritional_value":"果皮含花青素，果肉含維生素A，耐儲存。","relief_symptoms":"順暢排便,幫助消化/解膩,抗發炎/免疫調節","relief_mechanism":"深紫色果皮含花青素；纖維助排便。","scenario":"耐放存糧,家庭分享","trivia":"是市面上最常見的進口李子品種，非常耐放。"}'::jsonb,
  '{"appearance":"果皮黑亮，無果粉","detail":"果形圓整","tactile":"質地硬脆，耐放","sense":"酸度較低，無特殊香氣","storage":"冷藏保存","texture_desc":"口感硬脆，肉質紮實，耐放"}'::jsonb,
  ARRAY['黑李','恐龍蛋(誤稱)']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'cherry_bing',
  '紅櫻桃',
  '核果',
  '[8,5,1,0,0,4,9,8,4,1,2,6]'::jsonb,
  '{"name_en":"Bing Cherry","is_premium":false,"is_common":true,"tagline":"補鐵聖品，色澤紅潤，口感紮實","color":"#8B0000","keywords":"櫻桃,車厘子","brix":18,"acidity":3,"calories":63,"gi_value":22,"price_level":4,"energy_index":1,"moisture":7,"aroma":6,"origin":"進口","best_origin":"美國華盛頓","skin_edible":"Yes","seed_edible":"No","good_for":"手腳冰冷、貧血、關節風濕","bad_for":"燥熱體質、喉嚨痛、便秘","safety_warning":"無特殊高風險","nutritional_value":"富含鐵質、花青素及褪黑激素，有助補血與睡眠。","relief_symptoms":"補氣血/暖身,泌尿與痛風護理,舒壓助眠","relief_mechanism":"含褪黑激素助眠；花青素助排尿酸；鐵質補血。","scenario":"美顏補氣,體面送禮,特殊護理","trivia":"櫻桃含有褪黑激素，有助於改善睡眠品質。"}'::jsonb,
  '{"appearance":"果色深紫紅（越深越甜）","detail":"果梗翠綠（非褐色）","tactile":"硬度高有彈性，不軟爛","sense":"無異味，檢查蒂頭有無凹陷發霉","storage":"極易腐壞，不洗冷藏","texture_desc":"肉質硬脆，有彈性，多汁"}'::jsonb,
  ARRAY['櫻桃','車厘子']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'cherry_rainier',
  '白櫻桃',
  '核果',
  '[2,1,0,0,0,5,10,7,1,0,0,1]'::jsonb,
  '{"name_en":"Rainier Cherry","is_premium":true,"is_common":false,"tagline":"嬌貴的白雪公主，甜度更高更細緻","color":"#FFDAB9","keywords":"白櫻","brix":20,"acidity":2,"calories":65,"gi_value":25,"price_level":5,"energy_index":1,"moisture":7,"aroma":5,"origin":"進口","best_origin":"美國華盛頓","skin_edible":"Yes","seed_edible":"No","good_for":"氣血虛弱、疲勞","bad_for":"糖尿病、上火","safety_warning":"無特殊高風險","nutritional_value":"甜度高，含有維生素C、A及鉀，花青素較紅櫻桃少。","relief_symptoms":"泌尿與痛風護理,舒壓助眠,美白抗氧化","relief_mechanism":"含褪黑激素；高糖分補充體力。","scenario":"體面送禮,螞蟻人","trivia":"甜度比紅櫻桃高，但因為容易碰傷，價格通常貴一倍。"}'::jsonb,
  '{"appearance":"果皮金黃帶粉紅","detail":"表面有光澤，無褐斑","tactile":"口感細軟，易碰傷","sense":"甜如蜂蜜，檢查盒底有無壓傷","storage":"極易碰傷，原盒冷藏","texture_desc":"口感細軟，皮薄多汁，肉質細"}'::jsonb,
  ARRAY['白櫻']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apricot',
  '杏桃',
  '核果',
  '[0,0,0,0,2,6,9,5,0,0,0,0]'::jsonb,
  '{"name_en":"Apricot","is_premium":false,"is_common":true,"tagline":"帶有獨特麝香味，富含維生素A","color":"#FFA500","keywords":"杏子","brix":12,"acidity":4,"calories":48,"gi_value":35,"price_level":4,"energy_index":1,"moisture":6,"aroma":7,"origin":"進口","best_origin":"土耳其","skin_edible":"Yes","seed_edible":"No","good_for":"肺虛咳喘、津傷口渴","bad_for":"產婦、濕熱體質、小兒","safety_warning":"無特殊高風險","nutritional_value":"富含β-胡蘿蔔素（維生素A原）、維生素E及鉀。","relief_symptoms":"潤喉養肺,順暢排便,護眼明目","relief_mechanism":"極豐富的維生素A與β-胡蘿蔔素，滋潤眼睛與皮膚。","scenario":"美顏補氣,稀有嘗鮮","trivia":"杏仁其實就是杏桃的種子核仁。"}'::jsonb,
  '{"appearance":"果皮金黃有絨毛","detail":"縫合線深","tactile":"手感微軟","sense":"麝香味濃，檢查有無撞傷","storage":"室溫放軟後冷藏","texture_desc":"肉質軟綿，纖維少，口感像水蜜桃"}'::jsonb,
  ARRAY['杏子']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'plum_green',
  '梅子',
  '核果',
  '[0,0,8,10,4,0,0,0,0,0,0,0]'::jsonb,
  '{"name_en":"Green Plum","is_premium":false,"is_common":true,"tagline":"望梅止渴，鹼性食物之王（加工後）","color":"#32CD32","keywords":"青梅","brix":4,"acidity":10,"calories":35,"gi_value":25,"price_level":1,"energy_index":0,"moisture":5,"aroma":5,"origin":"國產","best_origin":"南投信義","skin_edible":"No","seed_edible":"No","good_for":"久咳失音、久瀉、蛔蟲腹痛","bad_for":"感冒初期（表邪未解）、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"有機酸（檸檬酸、蘋果酸）含量極高，鹼性食品，需加工食用。","relief_symptoms":"幫助消化/解膩,解酒/宿醉,止瀉/收斂","relief_mechanism":"酸收作用止瀉；有機酸殺菌並助消化（需加工）。","scenario":"料理加工,懷舊古早味","trivia":"生吃梅子會中毒（含氰酸），一定要加工後才能吃。"}'::jsonb,
  '{"appearance":"果皮青綠有絨毛","detail":"果實硬實，無斑點","tactile":"極酸澀，不可生食","sense":"清香撲鼻，主要檢查有無蟲蛀","storage":"不可生食，需醃漬","texture_desc":"肉質硬脆，極酸，需加工"}'::jsonb,
  ARRAY['青梅']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'loquat',
  '枇杷',
  '核果',
  '[0,3,9,10,3,0,0,0,0,0,0,0]'::jsonb,
  '{"name_en":"Loquat","is_premium":true,"is_common":false,"tagline":"春季限定的黃金果實，潤肺止咳第一名","color":"#FFD700","keywords":"琵琶果,蘆橘","brix":12,"acidity":3,"calories":47,"gi_value":45,"price_level":5,"energy_index":-1,"moisture":8,"aroma":5,"origin":"國產","best_origin":"台中太平","skin_edible":"No","seed_edible":"No","good_for":"咳嗽痰多、喉嚨乾癢","bad_for":"脾虛泄瀉、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"富含維生素A、β-胡蘿蔔素及苦杏仁苷（止咳）。","relief_symptoms":"潤喉養肺,止瀉/收斂","relief_mechanism":"傳統潤肺食材；含有苦杏仁苷輔助鎮咳。","scenario":"特殊護理,軟糯好咬,體面送禮,季節限定","trivia":"枇杷的種子含有微量氰苷，千萬不能咬碎吞食。"}'::jsonb,
  '{"appearance":"果皮金黃有絨毛（絨毛完整代表新鮮）","detail":"果形圓潤，蒂頭無皺縮","tactile":"手感柔軟，不可按壓","sense":"清香淡雅，無發酵味","storage":"極嬌貴，常溫保存，兩天內吃完","texture_desc":"肉質軟嫩多汁，纖維細緻，入口即化"}'::jsonb,
  ARRAY['琵琶果','蘆橘']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'lychee_yuherpao',
  '玉荷包荔枝',
  '荔枝',
  '[0,0,0,1,8,10,2,0,0,0,0,0]'::jsonb,
  '{"name_en":"Yuherpao Lychee","is_premium":true,"is_common":false,"tagline":"皮紅帶綠，肉厚籽小，爆漿口感","color":"#FFB6C1","keywords":"荔枝,妃子笑","brix":18,"acidity":3,"calories":65,"gi_value":70,"price_level":4,"energy_index":2,"moisture":9,"aroma":8,"origin":"國產","best_origin":"高雄大樹","skin_edible":"No","seed_edible":"No","good_for":"脾虛泄瀉、呃逆、五更瀉","bad_for":"陰虛火旺、口臭、糖尿病、空腹","safety_warning":"**荔枝病**：空腹勿食。","nutritional_value":"維生素C含量極高，富含鉀與葡萄糖。","relief_symptoms":"補氣血/暖身,美白抗氧化,舒壓助眠","relief_mechanism":"高糖分補給能量；維生素C與鐵改善氣色。","scenario":"體面送禮,螞蟻人,軟糯好咬","trivia":"皮帶綠色不是沒熟，是玉荷包的特色，這時候最好吃。"}'::jsonb,
  '{"appearance":"果皮刺手（凸起明顯）","detail":"顏色紅中帶綠（綠多紅少）","tactile":"手感飽滿，輕捏有彈性","sense":"清香酸甜，檢查蒂頭有無蟲粉","storage":"噴水報紙包好冷藏","texture_desc":"肉厚籽小，口感Q彈多汁，爆漿"}'::jsonb,
  ARRAY['荔枝','妃子笑']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'lychee_blackleaf',
  '黑葉荔枝',
  '荔枝',
  '[0,0,0,0,2,9,10,2,0,0,0,0]'::jsonb,
  '{"name_en":"Black Leaf Lychee","is_premium":false,"is_common":true,"tagline":"香氣濃郁，傳統荔枝味，甜度高","color":"#8B0000","keywords":"荔枝,烏葉","brix":17,"acidity":4,"calories":60,"gi_value":70,"price_level":2,"energy_index":2,"moisture":8,"aroma":7,"origin":"國產","best_origin":"台中霧峰","skin_edible":"No","seed_edible":"No","good_for":"寒性胃痛、失眠健忘","bad_for":"長痘痘、喉嚨痛、便秘","safety_warning":"**荔枝病**：空腹勿食。","nutritional_value":"香氣濃，含有維生素C、B群及多種氨基酸。","relief_symptoms":"補氣血/暖身,舒壓助眠","relief_mechanism":"中醫認為荔枝補益心脾，適合氣血虛弱型失眠。","scenario":"懷舊古早味,家庭分享","trivia":"是台灣產量最大的荔枝品種，香氣最經典。"}'::jsonb,
  '{"appearance":"果皮平滑圓潤（不刺手）","detail":"顏色暗紅","tactile":"果肉Q彈，手感結實","sense":"荔枝香氣濃，無酒味","storage":"噴水報紙包好冷藏","texture_desc":"肉質Q彈，纖維稍多，香氣濃"}'::jsonb,
  ARRAY['荔枝','烏葉']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'lychee_nomi',
  '糯米荔枝',
  '荔枝',
  '[0,0,0,0,0,3,10,5,0,0,0,0]'::jsonb,
  '{"name_en":"No-mi Lychee","is_premium":false,"is_common":false,"tagline":"肉質軟糯Q彈，帶有特殊糯米香","color":"#DC143C","keywords":"糯米糍","brix":19,"acidity":2,"calories":68,"gi_value":72,"price_level":4,"energy_index":2,"moisture":8,"aroma":7,"origin":"國產","best_origin":"南投草屯","skin_edible":"No","seed_edible":"No","good_for":"心悸、貧血、畏寒","bad_for":"熱性體質、牙齦腫痛","safety_warning":"**荔枝病**：空腹勿食。","nutritional_value":"口感Q，富含維生素C、糖分及鉀。","relief_symptoms":"補氣血/暖身,舒壓助眠","relief_mechanism":"能量密度高，補氣血。","scenario":"老饕最愛","trivia":"因為果肉口感像糯米滋粑一樣Q彈而得名。"}'::jsonb,
  '{"appearance":"果皮鮮紅偏紫","detail":"表面棘刺微刺","tactile":"口感軟糯，核小","sense":"特殊米香，檢查表皮有無裂果","storage":"噴水報紙包好冷藏","texture_desc":"肉質軟糯Q彈，像麻糬，口感特殊"}'::jsonb,
  ARRAY['糯米糍']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'lychee_gooseegg',
  '鵝蛋荔枝',
  '荔枝',
  '[0,0,0,0,1,6,10,3,0,0,0,0]'::jsonb,
  '{"name_en":"Goose Egg Lychee","is_premium":false,"is_common":false,"tagline":"巨大如鵝蛋，果肉厚實，視覺震撼","color":"#FF6347","keywords":"巨無霸荔枝","brix":16,"acidity":3,"calories":63,"gi_value":68,"price_level":4,"energy_index":2,"moisture":9,"aroma":6,"origin":"國產","best_origin":"屏東","skin_edible":"No","seed_edible":"No","good_for":"身體虛弱、手腳冰冷","bad_for":"燥熱體質、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"果實大，含有碳水化合物、蛋白質及維生素C。","relief_symptoms":"補氣血/暖身,舒壓助眠","relief_mechanism":"屬性溫熱，有助促進血液循環。","scenario":"稀有嘗鮮,體面送禮","trivia":"雖然很大顆，但種子通常也比較大。"}'::jsonb,
  '{"appearance":"體型巨大，像雞蛋","detail":"果皮紅艷，龜裂片大","tactile":"肉厚汁多，手感重","sense":"甜度適中，檢查蒂頭有無出水","storage":"噴水報紙包好冷藏","texture_desc":"肉厚汁多，口感紮實，纖維較粗"}'::jsonb,
  ARRAY['巨無霸荔枝']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_honey',
  '蜜梨',
  '梨',
  '[0,0,0,0,0,0,2,6,10,8,2,0]'::jsonb,
  '{"name_en":"Honey Pear","is_premium":false,"is_common":false,"tagline":"生長在高海拔的珍品，果肉細緻如蜜","color":"#F5F5DC","keywords":"福壽梨","brix":12,"acidity":2,"calories":42,"gi_value":32,"price_level":3,"energy_index":-1,"moisture":8,"aroma":4,"origin":"國產","best_origin":"台中梨山","skin_edible":"Yes","seed_edible":"Yes","good_for":"熱咳、痰黃黏稠、口乾舌燥","bad_for":"寒咳（白痰）、生理期、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"果肉細緻，含有果糖、鉀及維生素B群。","relief_symptoms":"潤喉養肺,解酒/宿醉,補水/消水腫","relief_mechanism":"性質甘涼，能潤肺生津，緩解燥熱。","scenario":"潤喉護嗓,老饕最愛","trivia":"只有在梨山等高海拔地區才能種出品質好的蜜梨。"}'::jsonb,
  '{"appearance":"果皮綠褐色","detail":"果點細小密集","tactile":"手感沉重","sense":"帶有蜂蜜香氣，檢查果皮有無擦傷","storage":"冷藏保存","texture_desc":"肉質細緻，入口即化，汁多"}'::jsonb,
  ARRAY['福壽梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_top_grafted',
  '高接梨',
  '梨',
  '[0,0,0,0,1,5,10,8,4,1,0,0]'::jsonb,
  '{"name_en":"Top-grafted Pear","is_premium":false,"is_common":true,"tagline":"台灣農業奇蹟，平地也能吃到的溫帶梨","color":"#F0E68C","keywords":"寄接梨","brix":11,"acidity":3,"calories":38,"gi_value":32,"price_level":2,"energy_index":-1,"moisture":9,"aroma":3,"origin":"國產","best_origin":"苗栗卓蘭","skin_edible":"Yes","seed_edible":"Yes","good_for":"發燒口渴、小便黃赤、咽喉痛","bad_for":"脾胃虛寒、產後、拉肚子","safety_warning":"無特殊高風險","nutritional_value":"水分含量高，富含鉀離子，有助於維持電解質平衡。","relief_symptoms":"潤喉養肺,解酒/宿醉","relief_mechanism":"水分極多可沖淡口腔異味；加速酒精代謝。","scenario":"生津解渴,家庭分享","trivia":"把溫帶梨的花苞嫁接在熱帶梨樹上，是台灣首創技術。"}'::jsonb,
  '{"appearance":"果皮黃褐色，色澤均勻","detail":"果形圓整，蒂頭新鮮","tactile":"果肉硬實，按壓不軟","sense":"無酒精味（過熟），檢查有無壓傷","storage":"冷藏保存","texture_desc":"口感脆甜，水分多，肉質細"}'::jsonb,
  ARRAY['寄接梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_shinko',
  '新興梨',
  '梨',
  '[0,0,0,0,0,0,2,8,9,6,2,0]'::jsonb,
  '{"name_en":"Shinko Pear","is_premium":false,"is_common":false,"tagline":"果實碩大，口感清脆，耐儲存","color":"#DEB887","keywords":"青梨","brix":11,"acidity":3,"calories":40,"gi_value":32,"price_level":2,"energy_index":-1,"moisture":9,"aroma":3,"origin":"國產","best_origin":"苗栗三灣","skin_edible":"Yes","seed_edible":"Yes","good_for":"肺熱咳嗽、酒醉","bad_for":"寒性體質、夜尿頻繁","safety_warning":"無特殊高風險","nutritional_value":"耐儲存，含有膳食纖維、石細胞（助消化）及鉀。","relief_symptoms":"潤喉養肺,補水/消水腫","relief_mechanism":"潤燥效果佳，適合秋季保養呼吸道。","scenario":"耐放存糧,家庭分享","trivia":"因為皮厚耐磨，是市面上最常見的梨子品種之一。"}'::jsonb,
  '{"appearance":"果皮青褐色","detail":"表皮較粗糙","tactile":"質地較硬，重量感足","sense":"聞起來無異味","storage":"冷藏可放很久","texture_desc":"口感清脆，肉質較硬，耐儲存"}'::jsonb,
  ARRAY['青梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_hosui',
  '豐水梨',
  '梨',
  '[0,0,0,0,0,2,8,9,5,1,0,0]'::jsonb,
  '{"name_en":"Hosui Pear","is_premium":false,"is_common":false,"tagline":"肉質細緻，入口即化，甜度高","color":"#DAA520","keywords":"水梨","brix":12,"acidity":3,"calories":36,"gi_value":34,"price_level":3,"energy_index":-1,"moisture":9,"aroma":4,"origin":"國產","best_origin":"台中東勢","skin_edible":"Yes","seed_edible":"Yes","good_for":"津液不足、聲音沙啞","bad_for":"手腳冰冷、生理期","safety_warning":"無特殊高風險","nutritional_value":"水分極高，含有天門冬胺酸，有助消除疲勞。","relief_symptoms":"潤喉養肺,解酒/宿醉","relief_mechanism":"水分爆漿滋潤咽喉；鉀離子助排水。","scenario":"生津解渴,軟糯好咬","trivia":"因為水分多到像水一樣，所以叫豐水梨。"}'::jsonb,
  '{"appearance":"果皮黃褐色有斑點","detail":"皮薄，摸起來細緻","tactile":"按壓微軟（水分極多）","sense":"無特殊香氣，重點檢查有無出水","storage":"不耐放，需盡快冷藏食用","texture_desc":"肉質極細，入口即化，水分爆多"}'::jsonb,
  ARRAY['水梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_kosui',
  '幸水梨',
  '梨',
  '[0,0,0,0,0,4,9,7,2,0,0,0]'::jsonb,
  '{"name_en":"Kosui Pear","is_premium":false,"is_common":false,"tagline":"早生品種，帶有淡淡焦糖香","color":"#BDB76B","keywords":"早生梨","brix":12,"acidity":2,"calories":38,"gi_value":34,"price_level":3,"energy_index":-1,"moisture":9,"aroma":4,"origin":"國產","best_origin":"台中東勢","skin_edible":"Yes","seed_edible":"Yes","good_for":"暑熱煩渴、乾咳","bad_for":"脾胃虛寒、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"碳水化合物與水分為主，含有少量維生素C與鉀。","relief_symptoms":"潤喉養肺,解酒/宿醉","relief_mechanism":"清脆口感與糖分能提神醒腦。","scenario":"稀有嘗鮮,生津解渴","trivia":"是產季最早的梨子，看到它就知道梨子季開始了。"}'::jsonb,
  '{"appearance":"果皮褐色帶綠","detail":"體型較小，扁圓","tactile":"口感酥脆，手感硬","sense":"有特殊焦糖香","storage":"冷藏保存","texture_desc":"口感酥脆，肉質細緻，早生種"}'::jsonb,
  ARRAY['早生梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_snow',
  '雪梨',
  '梨',
  '[9,6,2,0,0,0,0,0,0,0,2,7]'::jsonb,
  '{"name_en":"Snow Pear","is_premium":false,"is_common":false,"tagline":"梨中之王，巨大多汁，燉湯首選","color":"#FFFFF0","keywords":"大雪梨","brix":12,"acidity":2,"calories":42,"gi_value":35,"price_level":4,"energy_index":-2,"moisture":8,"aroma":3,"origin":"國產","best_origin":"台中梨山","skin_edible":"Yes","seed_edible":"Yes","good_for":"肺燥乾咳、便秘、發燒","bad_for":"寒咳、脾虛便溏","safety_warning":"無特殊高風險","nutritional_value":"果實巨大，水分與鉀含量豐富，含有水溶性纖維。","relief_symptoms":"潤喉養肺,解酒/宿醉,補水/消水腫","relief_mechanism":"燉煮後潤肺效果更佳；纖維助排便。","scenario":"拜拜祈福,潤喉護嗓,家庭分享","trivia":"因為果肉雪白且產於雪季（冬天）而得名。"}'::jsonb,
  '{"appearance":"體型巨大圓潤","detail":"果皮黃白，表面粗糙","tactile":"手感極重（密度高）","sense":"聞蒂頭處清甜，無發酵味","storage":"冷藏可保存極久","texture_desc":"肉質雪白細緻，水分多，口感脆"}'::jsonb,
  ARRAY['大雪梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_baodao',
  '寶島甘露梨',
  '梨',
  '[1,0,0,0,0,0,0,1,4,9,8,4]'::jsonb,
  '{"name_en":"Baodao Ganlu Pear","is_premium":true,"is_common":false,"tagline":"台灣本土育成的巨無霸，有甘蔗香","color":"#F5F5DC","keywords":"甘露梨","brix":13,"acidity":1,"calories":40,"gi_value":36,"price_level":4,"energy_index":0,"moisture":10,"aroma":5,"origin":"國產","best_origin":"苗栗卓蘭","skin_edible":"Yes","seed_edible":"Yes","good_for":"口乾舌燥、咽痛音啞","bad_for":"體質虛寒、頻尿","safety_warning":"無特殊高風險","nutritional_value":"果心小肉多，富含水分、膳食纖維及天然果糖。","relief_symptoms":"潤喉養肺,解酒/宿醉","relief_mechanism":"巨大水分與清甜口感，有效清潔口腔與潤喉。","scenario":"體面送禮,生津解渴,家庭分享","trivia":"切開後不泡鹽水也不會變黑，是台灣之光。"}'::jsonb,
  '{"appearance":"果形巨大扁圓","detail":"果梗粗壯","tactile":"果身硬實，手感沉","sense":"帶有甘蔗甜香","storage":"冷藏保存","texture_desc":"肉質極細，無渣，水分極多，口感脆"}'::jsonb,
  ARRAY['甘露梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_rough',
  '粗梨',
  '梨',
  '[0,0,0,0,0,0,0,0,2,6,8,4]'::jsonb,
  '{"name_en":"Rough Pear","is_premium":false,"is_common":false,"tagline":"古早味橫山梨，口感粗硬但有野味","color":"#A0522D","keywords":"橫山梨","brix":10,"acidity":4,"calories":35,"gi_value":30,"price_level":1,"energy_index":-1,"moisture":6,"aroma":2,"origin":"國產","best_origin":"嘉義","skin_edible":"Yes","seed_edible":"Yes","good_for":"熱咳痰喘（燉服）、反胃","bad_for":"生食（口感差且寒）","safety_warning":"無特殊高風險","nutritional_value":"石細胞豐富，纖維粗，有助於腸道蠕動，含有維生素B群。","relief_symptoms":"潤喉養肺","relief_mechanism":"古法常用粗梨燉冰糖來化痰止咳。","scenario":"懷舊古早味,潤喉護嗓,料理加工","trivia":"現在多用來當作高接梨的「砧木」，鮮食較少。"}'::jsonb,
  '{"appearance":"果皮深褐色粗糙","detail":"果點大且明顯","tactile":"質地粗硬，如石頭","sense":"酸澀味較重（自然味）","storage":"室溫保存","texture_desc":"肉質粗硬，石細胞多，口感像吃沙"}'::jsonb,
  ARRAY['橫山梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_western',
  '西洋梨',
  '梨',
  '[5,4,3,2,1,0,0,0,2,6,9,7]'::jsonb,
  '{"name_en":"Bartlett Pear","is_premium":false,"is_common":false,"tagline":"口感像奶油般滑順，吃軟不吃硬","color":"#9ACD32","keywords":"酪梨型梨","brix":13,"acidity":1,"calories":58,"gi_value":38,"price_level":3,"energy_index":0,"moisture":8,"aroma":6,"origin":"進口","best_origin":"美國/阿根廷","skin_edible":"Yes","seed_edible":"Yes","good_for":"便秘、咽喉乾痛","bad_for":"脾虛泄瀉、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"富含果膠（水溶性纖維），熟成後質地軟爛易消化。","relief_symptoms":"順暢排便,潤喉養肺","relief_mechanism":"山梨糖醇與果膠含量高，通便效果顯著。","scenario":"順暢排空,軟糯好咬","trivia":"剛買回來是硬的，千萬別吃，會澀到懷疑人生。"}'::jsonb,
  '{"appearance":"果皮黃綠色（葫蘆狀）","detail":"蒂頭周圍變軟（代表熟）","tactile":"按壓果肉微軟（可食）","sense":"熟成後有濃香，若硬則無味","storage":"必須室溫催熟（後熟），變軟才能吃","texture_desc":"熟軟後口感像奶油，入口即化，綿密"}'::jsonb,
  ARRAY['酪梨型梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_red_anjou',
  '紅安琪西洋梨',
  '梨',
  '[5,4,3,2,1,0,0,0,2,6,9,7]'::jsonb,
  '{"name_en":"Red Anjou Pear","is_premium":false,"is_common":false,"tagline":"紅色外皮喜氣，口感綿密多汁","color":"#A52A2A","keywords":"紅皮西洋梨","brix":13,"acidity":2,"calories":59,"gi_value":38,"price_level":3,"energy_index":0,"moisture":8,"aroma":6,"origin":"進口","best_origin":"美國","skin_edible":"Yes","seed_edible":"Yes","good_for":"陰虛火旺、口渴","bad_for":"體寒、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"紅色果皮含有花青素，富含膳食纖維與維生素C。","relief_symptoms":"順暢排便,潤喉養肺","relief_mechanism":"紅色果皮含抗氧化物，纖維助消化。","scenario":"稀有嘗鮮,軟糯好咬","trivia":"即使熟了皮還是紅色的，不會變黃。"}'::jsonb,
  '{"appearance":"果皮紫紅色","detail":"果形短胖，像不倒翁","tactile":"蒂頭輕壓微軟","sense":"香氣濃郁，檢查有無軟爛","storage":"室溫催熟後冷藏","texture_desc":"熟軟後口感綿密，多汁，肉質細"}'::jsonb,
  ARRAY['紅皮西洋梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pear_conference',
  '啤梨',
  '梨',
  '[5,4,3,2,1,0,0,0,2,6,9,7]'::jsonb,
  '{"name_en":"Conference Pear","is_premium":false,"is_common":false,"tagline":"外型修長像葫蘆，甜度極高","color":"#6B8E23","keywords":"長梨","brix":14,"acidity":1,"calories":57,"gi_value":38,"price_level":3,"energy_index":0,"moisture":7,"aroma":5,"origin":"進口","best_origin":"比利時","skin_edible":"Yes","seed_edible":"Yes","good_for":"熱病津傷、煩渴","bad_for":"慢性腸炎、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"甜度高，含有鉀、銅及維生素K，質地細緻。","relief_symptoms":"順暢排便,軟便","relief_mechanism":"質地軟糯易消化，適合老人小孩。","scenario":"懶人免動刀,螞蟻人","trivia":"雖然外表像生鏽很醜，但甜度是西洋梨中最高的。"}'::jsonb,
  '{"appearance":"果皮綠帶褐色斑（像生鏽）","detail":"果形細長，蒂頭長","tactile":"按壓果身變軟","sense":"甜味濃縮，無酒精味","storage":"室溫催熟後冷藏","texture_desc":"熟軟後甜度高，口感軟糯，肉質細"}'::jsonb,
  ARRAY['長梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'fig',
  '無花果',
  '無花果',
  '[2,1,1,2,4,7,10,9,7,5,3,2]'::jsonb,
  '{"name_en":"Fig","is_premium":false,"is_common":true,"tagline":"生命之果，口感軟糯香甜，整顆可吃","color":"#8B008B","keywords":"映日果","brix":16,"acidity":1,"calories":74,"gi_value":50,"price_level":4,"energy_index":0,"moisture":6,"aroma":5,"origin":"國產","best_origin":"雲林/彰化","skin_edible":"Yes","seed_edible":"Swallow","good_for":"咽喉腫痛、便秘、食慾不振","bad_for":"腹瀉、脂肪肝","safety_warning":"無特殊高風險","nutritional_value":"全果可食，富含膳食纖維、果膠、鈣及抗氧化物質。","relief_symptoms":"順暢排便,潤喉養肺,幫助消化/解膩","relief_mechanism":"泛酸與纖維助消化通便；傳統用於清咽利喉。","scenario":"順暢排空,美顏補氣,懶人免動刀","trivia":"無花果其實有花，只是花開在果實裡面，我們吃的是它的花蕊。"}'::jsonb,
  '{"appearance":"果皮紫紅微軟","detail":"開口微裂（代表熟）","tactile":"按壓柔軟，不可流湯","sense":"蜜糖香氣，檢查有無發霉","storage":"極易爛，冷藏並快吃","texture_desc":"口感軟糯，帶有顆粒感（種子），香甜"}'::jsonb,
  ARRAY['映日果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'tomato_beef',
  '牛番茄',
  '番茄',
  '[9,8,8,7,6,5,4,4,5,6,8,9]'::jsonb,
  '{"name_en":"Beef Tomato","is_premium":false,"is_common":true,"tagline":"生吃煮湯皆宜，茄紅素滿滿的健康紅球","color":"#DC143C","keywords":"大番茄,黑柿","brix":6,"acidity":6,"calories":19,"gi_value":25,"price_level":2,"energy_index":-1,"moisture":8,"aroma":2,"origin":"國產","best_origin":"南投信義","skin_edible":"Yes","seed_edible":"Swallow","good_for":"攝護腺保養、減重","bad_for":"痛風（含鉀）、胃寒","safety_warning":"無特殊高風險","nutritional_value":"茄紅素含量極高，低糖低卡，富含鉀與纖維。","relief_symptoms":"美白抗氧化,血壓調節,順暢排便","relief_mechanism":"熟食茄紅素抗氧化最強；高鉀助降壓。","scenario":"料理加工,低卡減負,家庭分享","trivia":"牛番茄煮熟吃，茄紅素吸收率比生吃高3倍。"}'::jsonb,
  '{"appearance":"果形碩大紅潤，底部有星點","detail":"蒂頭鮮綠","tactile":"手感沉重硬實","sense":"番茄特有草腥味","storage":"常溫後熟，變紅再冷藏","texture_desc":"肉厚汁多，口感紮實，煮熟後軟爛"}'::jsonb,
  ARRAY['大番茄','黑柿']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'starfruit_soft',
  '楊桃',
  '楊桃',
  '[8,7,6,5,4,4,5,7,9,10,10,9]'::jsonb,
  '{"name_en":"Starfruit","is_premium":false,"is_common":true,"tagline":"星星狀的水果，生津止渴，保護喉嚨","color":"#FFD700","keywords":"陽桃","brix":10,"acidity":4,"calories":30,"gi_value":35,"price_level":2,"energy_index":-1,"moisture":9,"aroma":5,"origin":"國產","best_origin":"台南楠西","skin_edible":"Yes","seed_edible":"Swallow","good_for":"風熱咳嗽、咽喉腫痛、口腔潰瘍","bad_for":"腎臟病（絕對禁忌）、胃寒","safety_warning":"**腎毒性 (粗體)**：神經毒素，腎病患者絕對禁食。","nutritional_value":"水分高，含有維生素C、有機酸，鉀含量適中（腎病忌食）。","relief_symptoms":"潤喉養肺,解酒/宿醉,血壓調節","relief_mechanism":"切片沾鹽吃可消炎退火，保護聲帶。","scenario":"潤喉護嗓,生津解渴","trivia":"楊桃含有神經毒素Caramboxin，正常人可代謝，腎友無法排出會中毒。"}'::jsonb,
  '{"appearance":"果皮黃中帶綠","detail":"果棱邊緣無褐化","tactile":"手感結實，皮薄","sense":"清香無澀味，檢查棱邊有無壓傷","storage":"冷藏保存","texture_desc":"口感清脆，汁多，肉質細緻"}'::jsonb,
  ARRAY['陽桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'starfruit_sour',
  '酸楊桃',
  '楊桃',
  '[6,6,6,6,6,6,6,6,6,6,6,6]'::jsonb,
  '{"name_en":"Sour Starfruit","is_premium":false,"is_common":false,"tagline":"酸度極高，專門用來醃漬或做湯","color":"#ADFF2F","keywords":"土楊桃","brix":6,"acidity":9,"calories":25,"gi_value":25,"price_level":1,"energy_index":-1,"moisture":9,"aroma":4,"origin":"國產","best_origin":"屏東","skin_edible":"Yes","seed_edible":"Swallow","good_for":"喉嚨沙啞、解酒","bad_for":"腎臟病、胃潰瘍","safety_warning":"**腎毒性 (粗體)**：絕對禁食。","nutritional_value":"有機酸含量極高，含有維生素C，通常醃漬食用。","relief_symptoms":"潤喉養肺,解酒/宿醉","relief_mechanism":"醃漬後沖泡熱水，解酒潤喉。","scenario":"料理加工","trivia":"台菜「楊桃湯」或「鳳梨楊桃冰」通常是用這種酸楊桃醃製的。"}'::jsonb,
  '{"appearance":"果形較小，棱深","detail":"顏色偏青，果皮粗","tactile":"質地硬脆","sense":"極酸，聞起來有酸味","storage":"醃漬或煮食","texture_desc":"口感硬脆，酸度高，纖維多"}'::jsonb,
  ARRAY['土楊桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_kyoho',
  '巨峰葡萄',
  '葡萄',
  '[9,8,4,3,5,9,10,9,6,5,7,9]'::jsonb,
  '{"name_en":"Kyoho Grape","is_premium":false,"is_common":true,"tagline":"果肉Q彈多汁，帶有濃郁酒香","color":"#4B0082","keywords":"葡萄,黑葡萄","brix":18,"acidity":4,"calories":60,"gi_value":50,"price_level":2,"energy_index":0,"moisture":8,"aroma":8,"origin":"國產","best_origin":"彰化大村","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"氣血虛弱、筋骨痠痛、疲勞","bad_for":"糖尿病、便秘（籽）、肥胖","safety_warning":"無特殊高風險","nutritional_value":"富含維生素B1、花青素及白藜蘆醇（果皮），鉀含量高。","relief_symptoms":"補氣血/暖身,護眼明目,抗發炎/免疫調節","relief_mechanism":"葡萄糖吸收快；中醫視為補氣血食材。","scenario":"美顏補氣,懶人免動刀,家庭分享","trivia":"果粉不是農藥，是葡萄的天然保護層（果蠟）。"}'::jsonb,
  '{"appearance":"果粉濃厚均勻（白白的）","detail":"果粒硬實飽滿，無脫落","tactile":"果梗翠綠（非褐色）","sense":"整串拿起來無掉果，聞起來有果香","storage":"報紙包好冷藏，吃之前才洗","texture_desc":"果肉軟彈，汁多，皮肉易分離"}'::jsonb,
  ARRAY['葡萄','黑葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_honey_red',
  '蜜紅葡萄',
  '葡萄',
  '[3,2,0,0,0,1,5,9,8,4,2,2]'::jsonb,
  '{"name_en":"Honey Red Grape","is_premium":true,"is_common":false,"tagline":"帶有蜂蜜香氣的紅葡萄，皮薄多汁","color":"#DC143C","keywords":"紅葡萄","brix":17,"acidity":2,"calories":62,"gi_value":55,"price_level":3,"energy_index":1,"moisture":8,"aroma":6,"origin":"國產","best_origin":"彰化埔心","skin_edible":"Yes","seed_edible":"Swallow","good_for":"貧血、手腳冰冷","bad_for":"糖尿病、內熱者","safety_warning":"無特殊高風險","nutritional_value":"皮薄多汁，含有葡萄糖、維生素C及多酚類化合物。","relief_symptoms":"補氣血/暖身,舒壓助眠","relief_mechanism":"含有鐵質與維生素，輔助造血功能。","scenario":"稀有嘗鮮,酸甜開胃","trivia":"因為皮薄汁多不易運輸，市面上較少見。"}'::jsonb,
  '{"appearance":"果色粉紅透亮","detail":"果皮極薄，蒂頭綠","tactile":"果粒柔軟（品種特性）","sense":"有獨特蜂蜜味，檢查盒底有無出水","storage":"極易落果，需小心冷藏","texture_desc":"果肉柔軟多汁，皮薄，口感細"}'::jsonb,
  ARRAY['紅葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_italia',
  '義大利葡萄',
  '葡萄',
  '[0,0,0,0,0,0,1,4,8,8,4,1]'::jsonb,
  '{"name_en":"Italia Grape","is_premium":false,"is_common":false,"tagline":"帶有麝香味的綠葡萄，清爽高雅","color":"#90EE90","keywords":"綠葡萄","brix":16,"acidity":3,"calories":61,"gi_value":52,"price_level":3,"energy_index":0,"moisture":8,"aroma":7,"origin":"國產","best_origin":"台中新社","skin_edible":"Yes","seed_edible":"Swallow","good_for":"消化不良、水腫","bad_for":"胃酸過多、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"含有麝香氣味成分，維生素C與鉀含量適中。","relief_symptoms":"抗發炎/免疫調節,舒壓助眠","relief_mechanism":"鉀離子含量適中，幫助排除多餘水分。","scenario":"酸甜開胃,懶人免動刀","trivia":"是早期的白葡萄代表，也是釀酒的好材料。"}'::jsonb,
  '{"appearance":"果皮黃綠色","detail":"果粒橢圓，大小一致","tactile":"口感脆爽，按壓有彈性","sense":"淡淡麝香味，檢查有無褐變","storage":"冷藏保存","texture_desc":"口感脆爽，肉質紮實，帶有麝香"}'::jsonb,
  ARRAY['綠葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_black_queen',
  '黑后葡萄',
  '葡萄',
  '[2,1,0,0,0,1,6,9,8,5,2,1]'::jsonb,
  '{"name_en":"Black Queen Grape","is_premium":false,"is_common":false,"tagline":"酸度高單寧重，釀酒靈魂","color":"#000000","keywords":"釀酒葡萄","brix":14,"acidity":8,"calories":58,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":9,"aroma":6,"origin":"國產","best_origin":"彰化二林","skin_edible":"Bitter","seed_edible":"Swallow","good_for":"食慾不振、疲勞","bad_for":"胃酸過多、怕酸者","safety_warning":"無特殊高風險","nutritional_value":"酸度與單寧含量高，富含原花青素，抗氧化力強。","relief_symptoms":"補氣血/暖身,護眼明目,血壓調節","relief_mechanism":"高酸度與單寧能刺激食慾（加工後）。","scenario":"料理加工","trivia":"台灣著名的「紅酒」多半是用黑后葡萄釀的。"}'::jsonb,
  '{"appearance":"果色深紫黑","detail":"果粒較小且緊密","tactile":"皮厚，手感硬實","sense":"酸度極高，主要檢查有無發霉","storage":"不建議鮮食，主要加工用","texture_desc":"皮厚澀味重，肉質軟，多汁"}'::jsonb,
  ARRAY['釀酒葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_golden_muscat',
  '金香葡萄',
  '葡萄',
  '[2,1,0,0,0,1,6,9,8,5,2,1]'::jsonb,
  '{"name_en":"Golden Muscat Grape","is_premium":false,"is_common":false,"tagline":"台灣白酒的原料，帶有熱帶果香","color":"#DAA520","keywords":"釀酒葡萄","brix":18,"acidity":6,"calories":60,"gi_value":50,"price_level":2,"energy_index":0,"moisture":8,"aroma":7,"origin":"國產","best_origin":"彰化二林","skin_edible":"Yes","seed_edible":"Swallow","good_for":"疲勞、水腫","bad_for":"糖尿病、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"糖度高，含有酒石酸、蘋果酸及礦物質。","relief_symptoms":"舒壓助眠,美白抗氧化","relief_mechanism":"高糖分快速補充能量。","scenario":"料理加工","trivia":"是台灣釀造白葡萄酒的主要品種。"}'::jsonb,
  '{"appearance":"果皮金黃透明","detail":"果粒圓潤，皮薄","tactile":"皮薄多汁，易破","sense":"香氣濃烈，檢查有無裂果","storage":"不建議鮮食，主要加工用","texture_desc":"皮薄多汁，肉質軟，易破"}'::jsonb,
  ARRAY['釀酒葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_shine_muscat',
  '麝香葡萄',
  '葡萄',
  '[5,3,1,0,0,0,0,1,5,9,10,8]'::jsonb,
  '{"name_en":"Shine Muscat Grape","is_premium":true,"is_common":false,"tagline":"連皮吃的夢幻逸品，帶有荔枝玫瑰香","color":"#9ACD32","keywords":"青提,晴王","brix":20,"acidity":1,"calories":69,"gi_value":60,"price_level":5,"energy_index":1,"moisture":7,"aroma":10,"origin":"進口","best_origin":"日本岡山","skin_edible":"Yes","seed_edible":"None","good_for":"疲勞、病後虛弱","bad_for":"糖尿病、肥胖","safety_warning":"無特殊高風險","nutritional_value":"皮薄無籽，富含葡萄糖、維生素B群及礦物質，無澀味。","relief_symptoms":"舒壓助眠,美白抗氧化,順暢排便","relief_mechanism":"香氣療癒，高糖分提供大腦能量。","scenario":"體面送禮,懶人免動刀,螞蟻人","trivia":"切勿用力按壓"}'::jsonb,
  '{"appearance":"果皮翠綠無瑕","detail":"無籽，蒂頭鮮綠","tactile":"口感脆彈，不可過硬","sense":"濃郁荔枝花香，檢查底部有無星型記號","storage":"冷藏保存","texture_desc":"口感脆彈，皮薄無渣，肉質紮實"}'::jsonb,
  ARRAY['青提','晴王']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_pione',
  '貓眼葡萄',
  '葡萄',
  '[2,1,0,0,0,0,0,1,5,9,8,4]'::jsonb,
  '{"name_en":"Pione Grape","is_premium":false,"is_common":false,"tagline":"比巨峰更大更黑，口感更紮實","color":"#191970","keywords":"比歐內","brix":19,"acidity":3,"calories":65,"gi_value":55,"price_level":5,"energy_index":0,"moisture":8,"aroma":7,"origin":"進口","best_origin":"日本山梨","skin_edible":"Yes","seed_edible":"None","good_for":"氣血不足、心悸","bad_for":"糖尿病、熱性體質","safety_warning":"無特殊高風險","nutritional_value":"果粒大，富含花青素、多酚及膳食纖維。","relief_symptoms":"補氣血/暖身,護眼明目","relief_mechanism":"深紫色果皮富含花青素與鐵，助氣色紅潤。","scenario":"體面送禮,老饕最愛","trivia":"在日本被稱為「黑珍珠」，是巨峰的升級版。"}'::jsonb,
  '{"appearance":"果色紫黑發亮","detail":"果粒巨大，果粉均勻","tactile":"無籽，果肉紮實","sense":"酒香濃厚，檢查有無脫梗","storage":"冷藏保存","texture_desc":"果肉紮實，口感軟彈，汁多"}'::jsonb,
  ARRAY['比歐內']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_nina_queen',
  '妮娜皇后葡萄',
  '葡萄',
  '[2,1,0,0,0,0,0,1,5,9,8,4]'::jsonb,
  '{"name_en":"Nina Queen Grape","is_premium":true,"is_common":false,"tagline":"紅色麝香葡萄，擁有草莓般的香氣","color":"#FF1493","keywords":"紅麝香","brix":21,"acidity":1,"calories":68,"gi_value":62,"price_level":5,"energy_index":1,"moisture":7,"aroma":9,"origin":"進口","best_origin":"日本長野","skin_edible":"Yes","seed_edible":"None","good_for":"貧血、疲勞","bad_for":"糖尿病、減重者","safety_warning":"無特殊高風險","nutritional_value":"紅色果皮富含花青素與白藜蘆醇，糖度極高。","relief_symptoms":"補氣血/暖身,美白抗氧化","relief_mechanism":"紅色花青素與白藜蘆醇具強抗氧化力。","scenario":"體面送禮,稀有嘗鮮,螞蟻人","trivia":"是目前日本最受矚目的紅色葡萄新品種。"}'::jsonb,
  '{"appearance":"果色鮮紅艷麗","detail":"果粒碩大，果粉薄","tactile":"手感硬實，有彈性","sense":"草莓牛奶香氣，檢查有無裂果","storage":"冷藏保存","texture_desc":"口感硬脆，肉質紮實，皮薄"}'::jsonb,
  ARRAY['紅麝香']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_green_seedless',
  '綠無籽葡萄',
  '葡萄',
  '[6,7,8,9,8,6,2,0,0,1,3,5]'::jsonb,
  '{"name_en":"Green Seedless Grape","is_premium":false,"is_common":false,"tagline":"皮脆肉甜，口感清爽，沙拉首選","color":"#90EE90","keywords":"白葡萄,加州葡萄","brix":17,"acidity":2,"calories":69,"gi_value":48,"price_level":2,"energy_index":-1,"moisture":9,"aroma":4,"origin":"進口","best_origin":"美國加州","skin_edible":"Yes","seed_edible":"None","good_for":"便秘、眼睛疲勞","bad_for":"糖尿病、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"連皮食用，富含膳食纖維、維生素C及鉀。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"連皮吃攝取大量纖維與水分。","scenario":"懶人免動刀,家庭分享","trivia":"表皮偏黃代表甜度越高，全綠反而比較酸。"}'::jsonb,
  '{"appearance":"果色青翠偏黃（黃代表甜）","detail":"果梗綠，無枯萎","tactile":"硬脆有聲，不軟塌","sense":"清甜無澀味，檢查袋底有無落果","storage":"冷藏保存，吃多少洗多少","texture_desc":"口感硬脆，皮薄無澀味，肉質細"}'::jsonb,
  ARRAY['白葡萄','加州葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_red_seedless',
  '紅無籽葡萄',
  '葡萄',
  '[6,7,8,9,8,6,2,0,0,1,3,5]'::jsonb,
  '{"name_en":"Red Seedless Grape","is_premium":false,"is_common":false,"tagline":"甜度通常比綠葡萄高，帶有花青素","color":"#DC143C","keywords":"紅葡萄,加州葡萄","brix":18,"acidity":2,"calories":70,"gi_value":50,"price_level":2,"energy_index":0,"moisture":9,"aroma":4,"origin":"進口","best_origin":"美國/智利","skin_edible":"Yes","seed_edible":"None","good_for":"貧血、神經衰弱","bad_for":"糖尿病、內熱","safety_warning":"無特殊高風險","nutritional_value":"含有花青素與類黃酮，連皮食用可攝取完整多酚。","relief_symptoms":"補氣血/暖身,抗發炎/免疫調節","relief_mechanism":"紅皮含抗氧化物質，保護微血管。","scenario":"懶人免動刀,美顏補氣","trivia":"上面的白霜是果粉，越多代表越新鮮。"}'::jsonb,
  '{"appearance":"果色紫紅均勻","detail":"果粒結實，大小一致","tactile":"皮薄無渣，手感硬","sense":"無發酵味，檢查蒂頭有無發霉","storage":"冷藏保存","texture_desc":"口感脆硬，皮薄，肉質紮實"}'::jsonb,
  ARRAY['紅葡萄','加州葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_black_seedless',
  '黑無籽葡萄',
  '葡萄',
  '[6,7,8,9,8,6,2,0,0,1,3,5]'::jsonb,
  '{"name_en":"Black Seedless Grape","is_premium":false,"is_common":false,"tagline":"風味最濃郁，皮有微微澀感但營養高","color":"#000000","keywords":"黑葡萄,加州葡萄","brix":18,"acidity":2,"calories":68,"gi_value":50,"price_level":2,"energy_index":0,"moisture":9,"aroma":4,"origin":"進口","best_origin":"美國/澳洲","skin_edible":"Yes","seed_edible":"None","good_for":"抗衰老、腎虛腰痛","bad_for":"糖尿病、便秘","safety_warning":"無特殊高風險","nutritional_value":"顏色深，花青素含量最高，富含維生素E與纖維。","relief_symptoms":"補氣血/暖身,護眼明目","relief_mechanism":"深色食物入腎（中醫觀點），花青素護眼。","scenario":"懶人免動刀,美顏補氣","trivia":"花青素含量是三種無籽葡萄中最高的。"}'::jsonb,
  '{"appearance":"果色深紫黑","detail":"果形長圓，果粉厚","tactile":"皮脆肉硬","sense":"濃郁葡萄味，無酒味","storage":"冷藏保存","texture_desc":"口感脆硬，皮稍厚，肉質紮實"}'::jsonb,
  ARRAY['黑葡萄','加州葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_cotton_candy',
  '棉花糖葡萄',
  '葡萄',
  '[3,2,1,0,0,0,0,1,3,6,7,5]'::jsonb,
  '{"name_en":"Cotton Candy Grape","is_premium":true,"is_common":false,"tagline":"真的有棉花糖味道！甜到不可思議","color":"#F0E68C","keywords":"棉花糖","brix":22,"acidity":1,"calories":75,"gi_value":65,"price_level":4,"energy_index":1,"moisture":7,"aroma":9,"origin":"進口","best_origin":"美國","skin_edible":"Yes","seed_edible":"None","good_for":"低血糖、疲勞","bad_for":"糖尿病、減重者","safety_warning":"**高糖警示**：甜度極高。","nutritional_value":"糖度極高，主要為葡萄糖與果糖，不含特殊添加物。","relief_symptoms":"舒壓助眠","relief_mechanism":"甜味能促進多巴胺分泌，緩解壓力。","scenario":"懶人免動刀,螞蟻人,稀有嘗鮮","trivia":"不是基因改造，是純天然育種出來的奇蹟口感。"}'::jsonb,
  '{"appearance":"果色綠中帶黃","detail":"果粒較軟（品種特性）","tactile":"無籽，皮薄","sense":"濃烈棉花糖香，檢查有無出水","storage":"冷藏保存","texture_desc":"口感較軟，多汁，無籽"}'::jsonb,
  ARRAY['棉花糖']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'grape_moon_drops',
  '手指葡萄',
  '葡萄',
  '[3,2,1,0,0,0,0,1,3,6,7,5]'::jsonb,
  '{"name_en":"Moon Drops Grape","is_premium":false,"is_common":false,"tagline":"外型像手指，口感極脆，甜度高","color":"#191970","keywords":"月滴葡萄,藍寶石葡萄","brix":19,"acidity":2,"calories":65,"gi_value":55,"price_level":4,"energy_index":0,"moisture":8,"aroma":5,"origin":"進口","best_origin":"美國","skin_edible":"Yes","seed_edible":"None","good_for":"視覺疲勞、消化不良","bad_for":"糖尿病","safety_warning":"無特殊高風險","nutritional_value":"果形特殊，口感脆，富含維生素A、C及抗氧化成分。","relief_symptoms":"補氣血/暖身,抗發炎/免疫調節","relief_mechanism":"藍黑色果皮富含護眼花青素。","scenario":"稀有嘗鮮,懶人免動刀","trivia":"長相奇特但意外地非常好吃，甜度通常很高。"}'::jsonb,
  '{"appearance":"果形長條像手指","detail":"果色深藍黑，尾端有凹陷","tactile":"脆度極高，硬實","sense":"無特殊香氣，檢查有無斷裂","storage":"冷藏保存","texture_desc":"口感極脆，皮薄，肉質硬實"}'::jsonb,
  ARRAY['月滴葡萄','藍寶石葡萄']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'avocado_hass',
  '哈斯酪梨',
  '酪梨',
  '[5,4,3,2,1,1,2,5,8,10,9,7]'::jsonb,
  '{"name_en":"Hass Avocado","is_premium":true,"is_common":false,"tagline":"金氏紀錄最營養，口感如奶油般滑順","color":"#2F4F4F","keywords":"酪梨,牛油果","brix":2,"acidity":1,"calories":160,"gi_value":15,"price_level":3,"energy_index":0,"moisture":3,"aroma":5,"origin":"進口","best_origin":"墨西哥","skin_edible":"No","seed_edible":"No","good_for":"便秘、心血管疾病、糖尿病","bad_for":"肥胖、腹瀉、膽囊切除者","safety_warning":"**高脂警示**：熱量高。","nutritional_value":"富含單元不飽和脂肪酸、維生素E、鉀及葉酸。","relief_symptoms":"順暢排便,血壓調節,美白抗氧化","relief_mechanism":"油脂潤滑腸道；維生素E滋潤肌膚。","scenario":"低卡減負,軟糯好咬,高熱量補給","trivia":"哈斯酪梨一定要等到皮變黑才能吃，綠的時候是硬的。"}'::jsonb,
  '{"appearance":"成熟時皮變黑","detail":"表皮粗糙，凹凸不平","tactile":"按壓變軟（尤其是蒂頭）","sense":"口感綿密，無特殊香氣","storage":"室溫變黑軟後冷藏","texture_desc":"口感如奶油般滑順，綿密濃郁"}'::jsonb,
  ARRAY['酪梨','牛油果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'avocado_hall',
  '厚兒酪梨',
  '酪梨',
  '[2,1,0,0,0,1,4,8,10,9,5,2]'::jsonb,
  '{"name_en":"Hall Avocado","is_premium":false,"is_common":true,"tagline":"台灣常見品種，皮綠也能吃，口感清爽","color":"#228B22","keywords":"酪梨,牛油果","brix":2,"acidity":1,"calories":85,"gi_value":15,"price_level":2,"energy_index":0,"moisture":4,"aroma":4,"origin":"國產","best_origin":"台南大內","skin_edible":"No","seed_edible":"No","good_for":"皮膚乾燥、便秘","bad_for":"熱量控制者","safety_warning":"**高脂警示**。","nutritional_value":"脂肪含量較低，水分較高，含有維生素C與纖維。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"富含單元不飽和脂肪酸與纖維。","scenario":"料理加工,低卡減負","trivia":"這種酪梨成熟後皮不會變色，要靠摸的判斷熟度。"}'::jsonb,
  '{"appearance":"成熟時皮仍綠","detail":"表皮光滑，有光澤","tactile":"按壓變軟（判斷熟度關鍵）","sense":"帶有青草香，檢查蒂頭是否鬆動","storage":"室溫變軟後冷藏","texture_desc":"含水量較高，口感較清爽，不油膩"}'::jsonb,
  ARRAY['酪梨','牛油果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'avocado_choquette',
  '秋可得酪梨',
  '酪梨',
  '[5,3,1,0,0,0,0,1,4,8,10,8]'::jsonb,
  '{"name_en":"Choquette Avocado","is_premium":false,"is_common":false,"tagline":"巨無霸酪梨，水分多甜味高","color":"#32CD32","keywords":"水酪梨","brix":2,"acidity":1,"calories":73,"gi_value":15,"price_level":3,"energy_index":0,"moisture":5,"aroma":3,"origin":"國產","best_origin":"嘉義竹崎","skin_edible":"No","seed_edible":"No","good_for":"口渴、便秘","bad_for":"腹瀉","safety_warning":"**高脂警示**。","nutritional_value":"果實巨大，水分多，含有健康的植物性脂肪。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"水分較高，搭配油脂潤腸。","scenario":"料理加工,家庭分享","trivia":"因為水分比較多，口感比較像水果，不像哈斯那麼油。"}'::jsonb,
  '{"appearance":"體型巨大，像小玉西瓜","detail":"果皮光滑發亮","tactile":"搖晃有種子聲（代表熟）","sense":"口感水嫩，檢查有無撞傷","storage":"室溫變軟後冷藏","texture_desc":"口感水嫩，帶有些許甜味，清爽"}'::jsonb,
  ARRAY['水酪梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'durian_monthong',
  '金枕頭榴槤',
  '榴槤',
  '[0,0,0,2,6,8,10,9,5,2,0,0]'::jsonb,
  '{"name_en":"Monthong Durian","is_premium":false,"is_common":true,"tagline":"氣味溫和，肉厚核小，入門首選","color":"#F0E68C","keywords":"榴槤","brix":28,"acidity":1,"calories":147,"gi_value":65,"price_level":4,"energy_index":2,"moisture":3,"aroma":10,"origin":"進口","best_origin":"泰國東部","skin_edible":"No","seed_edible":"No","good_for":"痛經（寒性）、產後虛寒、陽虛","bad_for":"陰虛火旺、感冒發燒、酒後","safety_warning":"**酒精交互作用**：酒後禁食。","nutritional_value":"高熱量，富含鉀、葉酸、維生素C及優質脂肪。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"屬性熱，促進血液循環，改善虛寒體質。","scenario":"高熱量補給,懷舊古早味","trivia":"榴槤是熱性水果，吃完可以吃山竹（寒性）來平衡。"}'::jsonb,
  '{"appearance":"刺呈三角形，分佈稀疏","detail":"果柄乾燥，無發霉","tactile":"搖晃有撞擊聲（肉離殼）","sense":"香味清淡（太濃代表過熟）","storage":"熟裂後取肉冷藏","texture_desc":"口感綿密，像奶油，肉厚核小"}'::jsonb,
  ARRAY['榴槤']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'durian_musangking',
  '貓山王榴槤',
  '榴槤',
  '[1,1,0,0,1,5,9,10,6,2,0,1]'::jsonb,
  '{"name_en":"Musang King Durian","is_premium":false,"is_common":false,"tagline":"色澤金黃，口感苦甜回甘，頂級享受","color":"#FFD700","keywords":"Musang King","brix":30,"acidity":2,"calories":155,"gi_value":65,"price_level":5,"energy_index":2,"moisture":3,"aroma":10,"origin":"進口","best_origin":"馬來西亞彭亨","skin_edible":"No","seed_edible":"No","good_for":"體質極寒、腰膝痠軟","bad_for":"熱性體質、高血壓、喉嚨痛","safety_warning":"**酒精交互作用**：酒後禁食。","nutritional_value":"口感濃郁，富含礦物質、維生素B群及脂肪。","relief_symptoms":"補氣血/暖身,順暢排便,舒壓助眠","relief_mechanism":"高熱量與脂肪，提供強大熱能與體力。","scenario":"體面送禮,懷舊古早味,螞蟻人","trivia":"貓山王通常是整顆冷凍進口，解凍後口感像冰淇淋。"}'::jsonb,
  '{"appearance":"底部有星形紋路（五星）","detail":"果形較小，刺細長","tactile":"口感綿密，冷凍品","sense":"酒香濃郁，檢查有無解凍出水","storage":"冷凍保存風味佳","texture_desc":"口感極度綿密，黏喉，層次豐富"}'::jsonb,
  ARRAY['Musang King']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'durian_blackthorn',
  '黑刺榴槤',
  '榴槤',
  '[1,1,0,0,1,5,9,10,6,2,0,1]'::jsonb,
  '{"name_en":"Black Thorn Durian","is_premium":true,"is_common":false,"tagline":"榴槤界的愛馬仕，口感層次豐富","color":"#B8860B","keywords":"Black Thorn","brix":32,"acidity":2,"calories":160,"gi_value":68,"price_level":5,"energy_index":2,"moisture":3,"aroma":10,"origin":"進口","best_origin":"馬來西亞檳城","skin_edible":"No","seed_edible":"No","good_for":"病後體虛、寒性體質","bad_for":"肥胖、糖尿病、熱性體質","safety_warning":"**酒精交互作用**。","nutritional_value":"營養密度高，富含鉀、鎂、脂肪及糖分。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"營養密度極高，滋補強身。","scenario":"體面送禮,懷舊古早味,老饕最愛","trivia":"價格比貓山王還貴，是目前的榴槤之王。"}'::jsonb,
  '{"appearance":"底部有黑色刺狀突起","detail":"果形圓潤，像南瓜","tactile":"口感奶油狀","sense":"風味極濃，檢查有無裂開","storage":"冷凍保存","texture_desc":"口感像鮮奶油，滑順濃郁，肉質細"}'::jsonb,
  ARRAY['Black Thorn']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'durian_chanee',
  '甲侖榴槤',
  '榴槤',
  '[0,0,1,5,9,8,2,0,0,0,0,0]'::jsonb,
  '{"name_en":"Chanee Durian","is_premium":false,"is_common":false,"tagline":"最古老的品種，榴槤味極重","color":"#EEE8AA","keywords":"初代榴槤","brix":26,"acidity":2,"calories":145,"gi_value":65,"price_level":3,"energy_index":2,"moisture":3,"aroma":9,"origin":"進口","best_origin":"泰國","skin_edible":"No","seed_edible":"No","good_for":"虛寒胃痛、畏寒","bad_for":"青春痘、便秘、口乾","safety_warning":"**酒精交互作用**。","nutritional_value":"風味濃，含有β-胡蘿蔔素及膳食纖維。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"熱性極強，驅寒效果佳。","scenario":"懷舊古早味,老饕最愛","trivia":"是泰國初代榴槤品種，味道非常傳統且濃烈。"}'::jsonb,
  '{"appearance":"果形較圓，瓣數明顯","detail":"刺大且密","tactile":"肉質纖維較多","sense":"味道狂野，聞起來很臭（香）","storage":"熟裂後取肉冷藏","texture_desc":"肉質纖維較多，口感軟爛，味道濃"}'::jsonb,
  ARRAY['初代榴槤']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'durian_kanyao',
  '干腰榴槤',
  '榴槤',
  '[0,0,0,1,5,9,8,2,0,0,0,0]'::jsonb,
  '{"name_en":"Kan Yao Durian","is_premium":false,"is_common":false,"tagline":"長柄榴槤，口感細緻，產量稀少","color":"#DAA520","keywords":"長柄榴槤","brix":29,"acidity":1,"calories":150,"gi_value":65,"price_level":5,"energy_index":2,"moisture":2,"aroma":10,"origin":"進口","best_origin":"泰國暖武里","skin_edible":"No","seed_edible":"No","good_for":"腎陽虛、身體瘦弱","bad_for":"濕熱蘊結、感冒","safety_warning":"**酒精交互作用**。","nutritional_value":"口感細緻，富含碳水化合物與鉀。","relief_symptoms":"補氣血/暖身,順暢排便","relief_mechanism":"溫補腎陽。","scenario":"懷舊古早味,老饕最愛","trivia":"以前是泰國皇室御用的榴槤品種。"}'::jsonb,
  '{"appearance":"果柄極長（長柄）","detail":"果形圓潤","tactile":"口感綿密，黏喉","sense":"甜味高雅，無苦味","storage":"熟裂後取肉冷藏","texture_desc":"肉質細緻，口感黏稠，甜度高"}'::jsonb,
  ARRAY['長柄榴槤']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jujube_milk',
  '牛奶蜜棗',
  '蜜棗',
  '[10,10,8,2,0,0,0,0,0,0,1,8]'::jsonb,
  '{"name_en":"Milk Jujube","is_premium":false,"is_common":true,"tagline":"皮薄肉細，口感像水梨，年節首選","color":"#98FB98","keywords":"棗子,青棗,台灣蘋果","brix":15,"acidity":2,"calories":43,"gi_value":60,"price_level":2,"energy_index":1,"moisture":7,"aroma":3,"origin":"國產","best_origin":"高雄燕巢","skin_edible":"Yes","seed_edible":"No","good_for":"煩熱口渴、便秘、失眠","bad_for":"腹脹、胃寒、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"維生素C含量高（蘋果的20倍），富含鉀與膳食纖維。","relief_symptoms":"順暢排便,舒壓助眠,補氣血/暖身","relief_mechanism":"膳食纖維極高；維C抗壓；含鉀助降壓。","scenario":"體面送禮,家庭分享,順暢排空","trivia":"台灣蜜棗是印度棗改良的，全世界只有台灣把它種得這麼好吃。"}'::jsonb,
  '{"appearance":"果色淡綠有光澤（像青蘋果）","detail":"蒂頭平整，無皺褶","tactile":"皮滑肉細，手感重","sense":"清甜多汁，檢查表皮有無褐斑","storage":"塑膠袋密封冷藏","texture_desc":"口感像水梨般脆甜，肉質細緻"}'::jsonb,
  ARRAY['棗子','青棗','台灣蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jujube_snow',
  '雪麗蜜棗',
  '蜜棗',
  '[9,10,7,1,0,0,0,0,0,0,0,6]'::jsonb,
  '{"name_en":"Snow Jujube","is_premium":false,"is_common":false,"tagline":"酸甜適中，皮薄多汁，代號13號","color":"#90EE90","keywords":"13號蜜棗","brix":16,"acidity":2,"calories":45,"gi_value":60,"price_level":3,"energy_index":1,"moisture":7,"aroma":3,"origin":"國產","best_origin":"高雄大社","skin_edible":"Yes","seed_edible":"No","good_for":"情緒焦躁、便秘","bad_for":"脾胃虛寒","safety_warning":"無特殊高風險","nutritional_value":"酸甜適中，含有維生素C、B群及礦物質。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"果肉細緻纖維多。","scenario":"體面送禮,順暢排空","trivia":"相較於牛奶蜜棗的死甜，雪麗帶有一點酸度，層次更豐富。"}'::jsonb,
  '{"appearance":"果形扁圓","detail":"果色翠綠","tactile":"口感細緻，微酸","sense":"帶有微酸香氣，檢查果梗是否枯萎","storage":"塑膠袋密封冷藏","texture_desc":"肉質細緻，皮薄汁多，口感清脆"}'::jsonb,
  ARRAY['13號蜜棗']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jujube_honey',
  '珍蜜蜜棗',
  '蜜棗',
  '[3,8,10,7,2,0,0,0,0,0,0,1]'::jsonb,
  '{"name_en":"Honey Jujube","is_premium":true,"is_common":false,"tagline":"晚熟品種，會爆漿的蜜棗，代號11號","color":"#ADFF2F","keywords":"11號蜜棗,爆漿蜜棗","brix":17,"acidity":2,"calories":48,"gi_value":62,"price_level":3,"energy_index":1,"moisture":8,"aroma":3,"origin":"國產","best_origin":"高雄燕巢","skin_edible":"Yes","seed_edible":"No","good_for":"口乾、便秘","bad_for":"糖尿病、腹脹","safety_warning":"**高糖警示**。","nutritional_value":"水分多，糖度高，含有維生素C與鉀。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"水分與纖維兼具。","scenario":"螞蟻人,軟糯好咬","trivia":"被稱為「爆漿蜜棗」，是產季最晚的品種（可到3-4月）。"}'::jsonb,
  '{"appearance":"果形橢圓","detail":"甜度極高","tactile":"皮薄汁多，手感軟","sense":"有爆漿感，檢查蒂頭有無裂開","storage":"塑膠袋密封冷藏","texture_desc":"口感爆漿，皮薄汁多，肉質細"}'::jsonb,
  ARRAY['11號蜜棗','爆漿蜜棗']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jujube_love',
  '珍愛蜜棗',
  '蜜棗',
  '[5,9,10,5,1,0,0,0,0,0,0,2]'::jsonb,
  '{"name_en":"Love Jujube","is_premium":false,"is_common":false,"tagline":"高雄12號，耐儲運，也是爆漿系","color":"#7FFF00","keywords":"12號蜜棗","brix":16,"acidity":2,"calories":44,"gi_value":60,"price_level":3,"energy_index":1,"moisture":7,"aroma":3,"origin":"國產","best_origin":"高雄","skin_edible":"Yes","seed_edible":"No","good_for":"貧血、便秘","bad_for":"腹瀉、胃寒","safety_warning":"**高糖警示**。","nutritional_value":"耐儲運，富含維生素C、膳食纖維及果膠。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"維生素C含量豐富。","scenario":"體面送禮","trivia":"是珍蜜的改良版，更耐放，適合出口。"}'::jsonb,
  '{"appearance":"果色翠綠","detail":"果形像蘋果","tactile":"肉白細緻，耐儲運","sense":"水分極多，檢查有無凍傷","storage":"塑膠袋密封冷藏","texture_desc":"肉質紮實，耐儲運，口感脆"}'::jsonb,
  ARRAY['12號蜜棗']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'jujube_gold',
  '金桃蜜棗',
  '蜜棗',
  '[10,9,6,1,0,0,0,0,0,0,0,8]'::jsonb,
  '{"name_en":"Gold Peach Jujube","is_premium":false,"is_common":false,"tagline":"外型像桃子，皮老耐放，口感酥脆","color":"#9ACD32","keywords":"金桃","brix":15,"acidity":2,"calories":46,"gi_value":60,"price_level":2,"energy_index":1,"moisture":7,"aroma":3,"origin":"國產","best_origin":"屏東高樹","skin_edible":"Yes","seed_edible":"No","good_for":"疲勞、便秘","bad_for":"腹脹、消化不良","safety_warning":"無特殊高風險","nutritional_value":"口感酥脆，含有維生素C、鉀及鎂。","relief_symptoms":"順暢排便,補氣血/暖身","relief_mechanism":"口感酥脆纖維高。","scenario":"拜拜祈福","trivia":"因為皮比較厚，吃起來有「卡滋卡滋」的聲音。"}'::jsonb,
  '{"appearance":"果形尖頭像桃","detail":"皮較厚色深（黃綠）","tactile":"口感酥脆，有卡滋聲","sense":"甜度高，檢查尖頭有無撞傷","storage":"塑膠袋密封冷藏","texture_desc":"口感酥脆，皮稍厚，有卡滋感"}'::jsonb,
  ARRAY['金桃']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_golden',
  '金鑽鳳梨',
  '鳳梨',
  '[6,7,9,10,10,9,7,5,4,5,5,6]'::jsonb,
  '{"name_en":"Golden Diamond Pineapple","is_premium":false,"is_common":true,"tagline":"連心都能吃的甜鳳梨，口感細緻","color":"#F4C430","keywords":"旺來,台農17號,鳳梨","brix":16,"acidity":5,"calories":50,"gi_value":65,"price_level":2,"energy_index":1,"moisture":8,"aroma":9,"origin":"國產","best_origin":"台南關廟","skin_edible":"No","seed_edible":"Yes","good_for":"消化不良（肉食積滯）、暑熱煩渴","bad_for":"胃潰瘍、胃酸過多、空腹","safety_warning":"**高糖警示**：甜度高，糖尿病患適量。","nutritional_value":"富含鳳梨酵素（Bromelain）有助蛋白質分解，維生素C及膳食纖維含量高。","relief_symptoms":"幫助消化/解膩,美白抗氧化,抗發炎/免疫調節","relief_mechanism":"鳳梨酵素(Bromelain)分解蛋白質，減輕腸胃負擔；維生素B1助能量代謝。","scenario":"順暢排空,拜拜祈福,家庭分享","trivia":"代號「台農17號」，市佔率高達8成。"}'::jsonb,
  '{"appearance":"果皮金黃帶綠（1/3黃即可）","detail":"冠芽新鮮無枯萎，切口無發霉","tactile":"結實沉重，手指輕彈為「肉聲」（紮實聲）","sense":"聞鳳梨底部（屁股），有濃郁果香","storage":"通風保存，切開後需冷藏","texture_desc":"肉質細緻，脆甜多汁，纖維軟可食"}'::jsonb,
  ARRAY['旺來','台農17號','鳳梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_milky',
  '牛奶鳳梨',
  '鳳梨',
  '[0,0,0,0,1,3,7,10,9,5,1,0]'::jsonb,
  '{"name_en":"Milky Pineapple","is_premium":false,"is_common":false,"tagline":"果肉雪白如牛奶，帶有淡淡花香","color":"#FFFFF0","keywords":"旺來,台農20號","brix":15,"acidity":3,"calories":55,"gi_value":60,"price_level":3,"energy_index":0,"moisture":7,"aroma":6,"origin":"國產","best_origin":"嘉義民雄","skin_edible":"No","seed_edible":"Yes","good_for":"食慾不振、疲勞無力","bad_for":"胃寒者、胃潰瘍","safety_warning":"無特殊高風險","nutritional_value":"肉質細緻，酸度較低，富含維生素C、B群及礦物質鉀、錳。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"酸度較低但酵素活性佳，適合胃口差時食用。","scenario":"順暢排空,稀有嘗鮮","trivia":"因果肉白色如牛奶得名，並非用牛奶灌溉。"}'::jsonb,
  '{"appearance":"果皮深綠色（熟了也是綠的）","detail":"冠芽較長，果目大","tactile":"手感沉重，紮實","sense":"聞底部香氣淡雅，不像金鑽濃烈","storage":"室溫通風，按壓微軟後冷藏","texture_desc":"肉質極細，纖維少，口感綿密"}'::jsonb,
  ARRAY['旺來','台農20號']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_native',
  '土鳳梨',
  '鳳梨',
  '[5,6,8,9,9,8,7,5,4,4,4,5]'::jsonb,
  '{"name_en":"Native Pineapple","is_premium":false,"is_common":false,"tagline":"酸勁十足，濃郁鳳梨味，做酥餅首選","color":"#CD853F","keywords":"旺來,開英種,鳳梨酥原料","brix":13,"acidity":8,"calories":46,"gi_value":50,"price_level":2,"energy_index":0,"moisture":6,"aroma":8,"origin":"國產","best_origin":"南投八卦山","skin_edible":"No","seed_edible":"Yes","good_for":"大餐後解膩、暑熱口渴","bad_for":"牙齒敏感、胃酸過多","safety_warning":"**刮舌頭**：蛋白酶強，易刮舌。","nutritional_value":"有機酸（檸檬酸）含量高，鳳梨酵素活性強，纖維粗有助腸道蠕動。","relief_symptoms":"幫助消化/解膩,順暢排便,美白抗氧化","relief_mechanism":"有機酸豐富，強烈酸甜感能刺激唾液與胃液。","scenario":"懷舊古早味,料理加工,酸甜開胃","trivia":"其實是日治時期引進的「開英種」，不是台灣原生種。"}'::jsonb,
  '{"appearance":"果皮橘紅或深褐色","detail":"果目（鱗片）突起明顯","tactile":"體型較小，手感紮實","sense":"聞起來有像發酵般的濃烈酒香","storage":"通風保存，耐放","texture_desc":"纖維較粗，口感紮實，帶有嚼勁"}'::jsonb,
  ARRAY['旺來','開英種','鳳梨酥原料']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_sweet_honey',
  '甜蜜蜜鳳梨',
  '鳳梨',
  '[0,2,5,8,9,8,4,1,0,0,0,0]'::jsonb,
  '{"name_en":"Sweet Honey Pineapple","is_premium":false,"is_common":false,"tagline":"甜度極高，幾乎無酸味，纖維極細","color":"#EEE8AA","keywords":"旺來,台農16號","brix":17,"acidity":2,"calories":52,"gi_value":65,"price_level":3,"energy_index":1,"moisture":8,"aroma":6,"origin":"國產","best_origin":"台南山上","skin_edible":"No","seed_edible":"Yes","good_for":"消化不良、疲勞","bad_for":"糖尿病、易腹瀉者","safety_warning":"**高糖警示**：極甜。","nutritional_value":"纖維極細，富含天然果糖與葡萄糖，維生素C含量豐富。","relief_symptoms":"幫助消化/解膩,美白抗氧化","relief_mechanism":"高糖分快速補給大腦與肌肉能量。","scenario":"順暢排空,螞蟻人","trivia":"代號「台農16號」，肉質細到像哈密瓜。"}'::jsonb,
  '{"appearance":"果皮帶有光澤的橙黃色","detail":"果目較大且平，冠芽細長","tactile":"按壓果身稍軟","sense":"靠近聞香氣濃郁","storage":"極不耐放，買回需盡快食用","texture_desc":"肉質極細緻，幾乎無纖維，口感像哈密瓜"}'::jsonb,
  ARRAY['旺來','台農16號']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_mango',
  '芒果鳳梨',
  '鳳梨',
  '[0,0,1,4,8,9,7,2,0,0,0,0]'::jsonb,
  '{"name_en":"Mango Pineapple","is_premium":true,"is_common":false,"tagline":"帶有淡淡芒果香氣的特殊品種","color":"#FFD700","keywords":"旺來,台農23號","brix":16,"acidity":3,"calories":53,"gi_value":62,"price_level":3,"energy_index":1,"moisture":7,"aroma":8,"origin":"國產","best_origin":"高雄大樹","skin_edible":"No","seed_edible":"Yes","good_for":"食慾不振、消化不良","bad_for":"胃病患者、過敏體質","safety_warning":"無特殊高風險","nutritional_value":"帶有特殊香氣成分，富含膳食纖維與鳳梨酵素，酸度低。","relief_symptoms":"幫助消化/解膩,護眼明目","relief_mechanism":"膳食纖維與酵素協同作用，幫助食物消化。","scenario":"稀有嘗鮮,順暢排空","trivia":"代號「台農23號」，是比較新的品種。"}'::jsonb,
  '{"appearance":"果皮橙黃，果目較大","detail":"果形圓筒狀，冠芽新鮮","tactile":"手感結實沉重","sense":"聞底部真的有一股芒果味","storage":"通風保存","texture_desc":"肉質細緻，纖維少，帶有特殊綿密感"}'::jsonb,
  ARRAY['旺來','台農23號']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_watermelon',
  '西瓜鳳梨',
  '鳳梨',
  '[0,0,0,0,0,2,6,9,8,4,0,0]'::jsonb,
  '{"name_en":"Watermelon Pineapple","is_premium":false,"is_common":false,"tagline":"體型巨大如西瓜，一顆可吃很久","color":"#32CD32","keywords":"旺來,巨無霸鳳梨","brix":14,"acidity":4,"calories":48,"gi_value":60,"price_level":3,"energy_index":0,"moisture":9,"aroma":5,"origin":"國產","best_origin":"屏東","skin_edible":"No","seed_edible":"Yes","good_for":"暑熱煩渴、小便不利","bad_for":"胃寒者、夜尿頻繁","safety_warning":"無特殊高風險","nutritional_value":"水分含量極高，提供鉀離子與維生素C，有助於水分代謝。","relief_symptoms":"補水/消水腫,幫助消化/解膩","relief_mechanism":"水分與鉀含量高助代謝，纖維助排便。","scenario":"拜拜祈福,家庭分享","trivia":"因為大到像西瓜而得名，不是西瓜跟鳳梨混種。"}'::jsonb,
  '{"appearance":"體型巨大（可達3公斤）","detail":"果目青綠，冠芽短","tactile":"沉重感十足","sense":"香氣較淡，主要檢查有無裂果","storage":"切開後分裝冷凍或冷藏","texture_desc":"水分極多，肉質較軟，纖維適中"}'::jsonb,
  ARRAY['旺來','巨無霸鳳梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'pineapple_sugarapple',
  '釋迦鳳梨',
  '鳳梨',
  '[0,1,3,7,9,8,4,1,0,0,0,0]'::jsonb,
  '{"name_en":"Sugar Apple Pineapple","is_premium":false,"is_common":false,"tagline":"可以用手剝著吃的鳳梨，免動刀","color":"#9ACD32","keywords":"旺來,台農4號,剝皮鳳梨","brix":15,"acidity":2,"calories":54,"gi_value":62,"price_level":3,"energy_index":0,"moisture":7,"aroma":6,"origin":"國產","best_origin":"台東","skin_edible":"No","seed_edible":"Yes","good_for":"便秘、消化不良","bad_for":"糖尿病、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"可剝皮食用，富含膳食纖維、維生素C及鉀，鳳梨酵素適量。","relief_symptoms":"幫助消化/解膩,舒壓助眠","relief_mechanism":"可溶性纖維豐富，軟化糞便。","scenario":"懶人免動刀,順暢排空","trivia":"代號「台農4號」，因果目像釋迦可剝皮而得名。"}'::jsonb,
  '{"appearance":"果目突起明顯，類似釋迦","detail":"冠芽邊緣有刺","tactile":"按壓果身微軟（可剝皮狀態）","sense":"靠近聞有特殊香氣","storage":"不耐放，變軟要馬上吃","texture_desc":"肉質可剝離，纖維少，口感脆甜"}'::jsonb,
  ARRAY['旺來','台農4號','剝皮鳳梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'mulberry',
  '桑椹',
  '漿果',
  '[0,0,0,10,8,2,0,0,0,0,0,0]'::jsonb,
  '{"name_en":"Mulberry","is_premium":false,"is_common":true,"tagline":"補血養顏黑色寶石，酸甜開胃","color":"#800080","keywords":"桑葚,桑果","brix":12,"acidity":7,"calories":45,"gi_value":45,"price_level":2,"energy_index":-1,"moisture":8,"aroma":4,"origin":"國產","best_origin":"嘉義義竹","skin_edible":"Yes","seed_edible":"Swallow","good_for":"肝腎陰虛、白髮、便秘","bad_for":"脾虛便溏、孕婦（適量）","safety_warning":"無特殊高風險","nutritional_value":"富含花青素、鐵質、維生素C及白藜蘆醇。","relief_symptoms":"補氣血/暖身,護眼明目,順暢排便","relief_mechanism":"中醫認為黑入腎，補肝腎養血；籽助排便。","scenario":"美顏補氣,懶人免動刀","trivia":"桑椹的紫黑色來自大量的花青素，抗氧化力極強。"}'::jsonb,
  '{"appearance":"果色紫黑發亮","detail":"果粒飽滿，顆粒分明","tactile":"無出水發霉","sense":"酸甜適中，檢查盒底有無紅水","storage":"極易爛，冷藏或冷凍","texture_desc":"口感軟爛多汁，顆粒感明顯"}'::jsonb,
  ARRAY['桑葚','桑果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'strawberry_fengxiang',
  '豐香草莓',
  '漿果',
  '[10,9,7,3,0,0,0,0,0,0,2,8]'::jsonb,
  '{"name_en":"Fengxiang Strawberry","is_premium":false,"is_common":false,"tagline":"傳統濃郁草莓香，入口即化","color":"#FF0000","keywords":"草莓,士多啤梨","brix":12,"acidity":5,"calories":35,"gi_value":40,"price_level":3,"energy_index":-1,"moisture":9,"aroma":9,"origin":"國產","best_origin":"苗栗大湖","skin_edible":"Yes","seed_edible":"None","good_for":"乾咳無痰、食慾不振、消化不良","bad_for":"尿路結石（草酸）、腸胃虛寒","safety_warning":"無特殊高風險","nutritional_value":"富含維生素C、葉酸及果膠，質地較軟易消化。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"有機酸與果香能促進消化液分泌。","scenario":"酸甜開胃,料理加工","trivia":"早期台灣草莓霸主，因為抗病差逐漸被香水取代。"}'::jsonb,
  '{"appearance":"果色紅潤但不深","detail":"果形不一，蒂頭葉片翹起","tactile":"果肉細軟，不可按壓","sense":"有濃郁奶香，檢查盒底有無紅水（爛）","storage":"極易爛，不洗直接冷藏","texture_desc":"口感軟綿，入口即化，肉質細"}'::jsonb,
  ARRAY['草莓','士多啤梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'strawberry_perfume',
  '香水草莓',
  '漿果',
  '[10,10,9,6,1,0,0,0,0,0,2,8]'::jsonb,
  '{"name_en":"Perfume Strawberry","is_premium":false,"is_common":true,"tagline":"市佔率最高，果實硬挺，帶有淡香","color":"#FF1493","keywords":"草莓,士多啤梨","brix":11,"acidity":6,"calories":36,"gi_value":40,"price_level":2,"energy_index":-1,"moisture":9,"aroma":7,"origin":"國產","best_origin":"苗栗大湖","skin_edible":"Yes","seed_edible":"None","good_for":"口乾舌燥、飲酒過後","bad_for":"尿路結石、易腹瀉","safety_warning":"無特殊高風險","nutritional_value":"維生素C含量高，含有鞣花酸（Ellagic acid）與花青素。","relief_symptoms":"美白抗氧化,幫助消化/解膩","relief_mechanism":"維生素C促進膠原蛋白合成，保濕肌膚。","scenario":"烘焙,稀有嘗鮮","trivia":"口感偏脆，適合擺在蛋糕上，不會馬上出水爛掉。"}'::jsonb,
  '{"appearance":"果形圓錐完美","detail":"果肉脆硬，耐放","tactile":"手感較硬實","sense":"香氣較淡，檢查表面有無白黴","storage":"冷藏保存，較耐放","texture_desc":"口感較硬脆，有嚼勁，肉質紮實"}'::jsonb,
  ARRAY['草莓','士多啤梨']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'strawberry_lianxiang',
  '戀香草莓',
  '漿果',
  '[10,10,8,5,1,0,0,0,0,0,2,8]'::jsonb,
  '{"name_en":"Lianxiang Strawberry","is_premium":true,"is_common":false,"tagline":"氣味最香的品種，甜度高達16度","color":"#DC143C","keywords":"草莓","brix":14,"acidity":4,"calories":38,"gi_value":42,"price_level":4,"energy_index":-1,"moisture":9,"aroma":9,"origin":"國產","best_origin":"苗栗大湖","skin_edible":"Yes","seed_edible":"None","good_for":"食少腹脹、咽喉腫痛","bad_for":"尿路結石、體寒","safety_warning":"無特殊高風險","nutritional_value":"香氣濃郁，甜度高，富含維生素C與膳食纖維。","relief_symptoms":"美白抗氧化,舒壓助眠","relief_mechanism":"濃郁香氣與甜味有助放鬆心情。","scenario":"老饕最愛,酸甜開胃","trivia":"台灣自行培育的品種，號稱草莓界的香奈兒。"}'::jsonb,
  '{"appearance":"果形修長","detail":"果梗超長，易辨識","tactile":"口感細緻，手感適中","sense":"濃烈花果香，隔著盒子都聞得到","storage":"冷藏保存","texture_desc":"口感細緻，甜度高，軟硬適中"}'::jsonb,
  ARRAY['草莓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'strawberry_white',
  '白草莓',
  '漿果',
  '[9,9,7,4,0,0,0,0,0,0,1,6]'::jsonb,
  '{"name_en":"White Strawberry","is_premium":true,"is_common":false,"tagline":"如初雪般的粉嫩，帶有水蜜桃香氣","color":"#FFFAF0","keywords":"淡雪,天使草莓","brix":13,"acidity":3,"calories":36,"gi_value":42,"price_level":5,"energy_index":-1,"moisture":8,"aroma":8,"origin":"進口","best_origin":"日本奈良","skin_edible":"Yes","seed_edible":"None","good_for":"脾虛食少、口渴","bad_for":"尿路結石、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"雖無紅色花青素，但仍富含維生素C、鉀及葉酸。","relief_symptoms":"美白抗氧化,舒壓助眠","relief_mechanism":"雖然顏色白，但維生素C含量依然豐富。","scenario":"體面送禮,稀有嘗鮮","trivia":"白草莓不是沒熟，是缺乏紅色花青素的品種。"}'::jsonb,
  '{"appearance":"果皮白色透粉","detail":"種子紅色（代表熟）","tactile":"口感綿密，勿按壓","sense":"水蜜桃香氣，檢查有無撞傷（變褐）","storage":"極嬌貴，單層鋪放冷藏","texture_desc":"口感綿密，肉質細緻，香氣濃"}'::jsonb,
  ARRAY['淡雪','天使草莓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'blueberry',
  '藍莓',
  '漿果',
  '[8,7,6,5,4,3,2,1,2,4,7,9]'::jsonb,
  '{"name_en":"Blueberry","is_premium":false,"is_common":true,"tagline":"護眼超級食物，抗氧化之王","color":"#000080","keywords":"藍梅","brix":13,"acidity":4,"calories":57,"gi_value":30,"price_level":3,"energy_index":-1,"moisture":8,"aroma":5,"origin":"進口","best_origin":"智利/美國","skin_edible":"Yes","seed_edible":"None","good_for":"用眼過度、記憶力退化","bad_for":"腹瀉、腎結石（草酸）","safety_warning":"無特殊高風險","nutritional_value":"富含花青素、維生素K及錳，抗氧化能力極高。","relief_symptoms":"護眼明目,抗發炎/免疫調節,舒壓助眠","relief_mechanism":"富含花青素，促進視網膜視紫質再生。","scenario":"美顏補氣,懶人免動刀","trivia":"上面的白粉越多越營養，千萬不要洗掉太乾淨。"}'::jsonb,
  '{"appearance":"果粉完整厚實（白霜）","detail":"果粒飽滿不扁，深藍色","tactile":"搖晃盒子無沾黏（代表新鮮）","sense":"無出水發霉，無酸臭味","storage":"冷藏保存，吃前才洗","texture_desc":"口感脆爽，爆漿感，皮薄"}'::jsonb,
  ARRAY['藍梅']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'raspberry',
  '覆盆莓',
  '漿果',
  '[6,5,4,3,2,1,0,0,1,3,6,7]'::jsonb,
  '{"name_en":"Raspberry","is_premium":false,"is_common":false,"tagline":"酸甜優雅，富含烯酮可助代謝","color":"#DC143C","keywords":"樹莓,野莓","brix":10,"acidity":7,"calories":52,"gi_value":25,"price_level":4,"energy_index":0,"moisture":7,"aroma":8,"origin":"進口","best_origin":"美國/歐洲","skin_edible":"Yes","seed_edible":"None","good_for":"頻尿遺尿（固腎）、代謝慢","bad_for":"腎虛火旺、小便短赤","safety_warning":"無特殊高風險","nutritional_value":"富含烯酮（Ketone）、維生素C及膳食纖維，熱量低。","relief_symptoms":"泌尿與痛風護理,美白抗氧化","relief_mechanism":"烯酮素助代謝；中醫認為覆盆子有固腎縮尿之效。","scenario":"低卡減負,烘焙,稀有嘗鮮","trivia":"覆盆莓非常怕水，一洗就會爛，建議用濕布擦拭即可。"}'::jsonb,
  '{"appearance":"果實完整無破損","detail":"顏色鮮紅，無白斑","tactile":"顆粒分明，無出水","sense":"香氣濃郁，檢查盒底有無發霉","storage":"極易爛，建議當天吃完","texture_desc":"口感柔軟，顆粒感明顯，多汁"}'::jsonb,
  ARRAY['樹莓','野莓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'cranberry',
  '蔓越莓',
  '漿果',
  '[6,5,3,1,0,0,0,0,1,4,7,8]'::jsonb,
  '{"name_en":"Cranberry","is_premium":false,"is_common":false,"tagline":"預防泌尿道感染，天然抗生素","color":"#8B0000","keywords":"小紅莓","brix":8,"acidity":10,"calories":46,"gi_value":20,"price_level":3,"energy_index":-1,"moisture":7,"aroma":3,"origin":"進口","best_origin":"美國/加拿大","skin_edible":"Yes","seed_edible":"None","good_for":"尿道感染、抗發炎","bad_for":"腎結石（草酸）、胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"含有原花青素（PACs）與奎寧酸，有助泌尿道保健。","relief_symptoms":"泌尿與痛風護理,抗發炎/免疫調節","relief_mechanism":"原花青素(PACs)抑制細菌附著於尿道壁。","scenario":"特殊護理,料理加工","trivia":"新鮮蔓越莓切開裡面有四個氣室，所以丟到水裡會浮起來。"}'::jsonb,
  '{"appearance":"果實深紅硬實","detail":"表面有光澤","tactile":"彈性佳，像彈珠","sense":"無特殊香氣，檢查有無軟爛","storage":"通常不生食，煮醬或打汁","texture_desc":"口感硬脆，極酸澀，不適合鮮食"}'::jsonb,
  ARRAY['小紅莓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'golden_berry',
  '燈籠果',
  '漿果',
  '[1,2,4,6,5,3,0,0,0,0,0,1]'::jsonb,
  '{"name_en":"Golden Berry","is_premium":false,"is_common":false,"tagline":"穿著紙衣的黃金莓果，酸甜獨特","color":"#FFA500","keywords":"酸漿果,黃金莓","brix":13,"acidity":7,"calories":53,"gi_value":45,"price_level":4,"energy_index":-1,"moisture":8,"aroma":7,"origin":"國產","best_origin":"嘉義布袋","skin_edible":"Yes","seed_edible":"Swallow","good_for":"視力疲勞、免疫力低","bad_for":"胃酸過多、怕酸者","safety_warning":"無特殊高風險","nutritional_value":"富含維生素A、C及多種B群，膳食纖維含量高。","relief_symptoms":"護眼明目,抗發炎/免疫調節","relief_mechanism":"富含維生素A與類胡蘿蔔素護眼。","scenario":"稀有嘗鮮,美顏補氣,酸甜開胃,懶人免動刀","trivia":"外面的枯葉不要吃，那是它的保護層，剝開吃裡面的黃球。"}'::jsonb,
  '{"appearance":"外層枯葉（宿存萼）完整乾燥","detail":"果實金黃飽滿","tactile":"果實微軟有彈性","sense":"帶有特殊的熱帶果香","storage":"冷藏保存，外殼可保持果實新鮮","texture_desc":"咬開爆漿，酸甜滋味像百香果加番茄"}'::jsonb,
  ARRAY['酸漿果','黃金莓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'blackberry',
  '黑莓',
  '漿果',
  '[0,0,0,0,2,6,8,5,0,0,0,0]'::jsonb,
  '{"name_en":"Blackberry","is_premium":false,"is_common":false,"tagline":"深黑色抗氧化炸彈，酸甜濃郁","color":"#000000","keywords":"黑莓,露莓","brix":10,"acidity":6,"calories":43,"gi_value":35,"price_level":4,"energy_index":-1,"moisture":8,"aroma":6,"origin":"進口","best_origin":"美國","skin_edible":"Yes","seed_edible":"Swallow","good_for":"眼睛疲勞、老化、便秘","bad_for":"腎結石（草酸）、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"富含花青素、維生素C、K及錳，抗氧化力強。","relief_symptoms":"護眼明目,抗發炎/免疫調節,順暢排便","relief_mechanism":"花青素護眼抗老；纖維助排便。","scenario":"稀有嘗鮮,美顏補氣,料理加工,低卡減負","trivia":"黑莓的顏色越深，花青素含量越高。"}'::jsonb,
  '{"appearance":"果實烏黑發亮，無紅色顆粒（未熟）","detail":"顆粒飽滿不萎縮","tactile":"質地柔軟，易出水","sense":"香氣濃郁，無酸臭味","storage":"極易爛，冷藏且不疊放","texture_desc":"口感柔軟多汁，帶有細小顆粒感"}'::jsonb,
  ARRAY['黑莓','露莓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'black_strawberry',
  '黑草莓',
  '漿果',
  '[5,8,10,9,5,0,0,0,0,0,2,4]'::jsonb,
  '{"name_en":"Black Strawberry","is_premium":true,"is_common":false,"tagline":"色澤如紅酒般深邃，濃郁莓香與高花青素的極致結合","color":"#4A0404","keywords":"真紅美鈴,黑鑽石草莓,深紅草莓, Kuro Ichigo","brix":16,"acidity":3,"calories":32,"gi_value":40,"price_level":5,"energy_index":-1,"moisture":8,"aroma":9,"origin":"進口","best_origin":"日本千葉","skin_edible":"Yes","seed_edible":"Swallow","good_for":"食慾不振、乾咳喉痛、需要抗氧化護膚者","bad_for":"腎臟病患者(鉀含量高)、腸胃極度虛寒者","safety_warning":"**腎臟病患需注意鉀含量**","nutritional_value":"富含高於一般草莓數倍的花青素、維生素C、鞣花酸與膳食纖維，抗氧化能力在漿果中名列前茅。","relief_symptoms":"美白抗氧化,護眼明目,幫助消化/解膩","relief_mechanism":"高濃度花青素與維他命C清除自由基並保護微血管，有機酸促進食慾。","scenario":"體面送禮,螞蟻人,稀有嘗鮮","trivia":"「真紅美鈴」是千葉縣開發品種，因花青素含量極高導致顏色深紅近黑，連果肉都是紅的。"}'::jsonb,
  '{"appearance":"色澤需呈現深暗紅色且具光澤，非過熟發黑","detail":"蒂頭葉片需鮮綠且微向上捲翹，種籽顆粒感明顯且深陷果肉中。","tactile":"手感較一般草莓紮實，不可有軟爛出水","sense":"聞起來應有極濃郁的複合莓果香氣，優質品甚至帶有淡淡玫瑰花香或酒香，不可有發酵酸味。","storage":"極不耐放，建議不洗直接冷藏，吃前才洗，2天內食用完畢","texture_desc":"果肉紮實細緻，從裡到外皆為深紅色，甜度極高幾乎無酸"}'::jsonb,
  ARRAY['真紅美鈴','黑鑽石草莓','深紅草莓','Kuro Ichigo']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'waxapple_blackpearl',
  '黑珍珠蓮霧',
  '蓮霧',
  '[10,10,9,7,3,2,2,2,3,6,8,10]'::jsonb,
  '{"name_en":"Black Pearl Wax Apple","is_premium":false,"is_common":true,"tagline":"色澤深紅，口感清脆，甜度適中","color":"#8B0000","keywords":"蓮霧,璉霧","brix":11,"acidity":1,"calories":34,"gi_value":28,"price_level":2,"energy_index":-1,"moisture":10,"aroma":3,"origin":"國產","best_origin":"屏東林邊","skin_edible":"Yes","seed_edible":"None","good_for":"肺燥咳嗽、口乾舌燥、酒醉","bad_for":"頻尿、生理期、胃寒","safety_warning":"無特殊高風險","nutritional_value":"水分含量高，低熱量，含有維生素C與膳食纖維。","relief_symptoms":"潤喉養肺,補水/消水腫,解酒/宿醉","relief_mechanism":"水分極高沖淡異味；低卡高飽足感。","scenario":"低卡減負,生津解渴,體面送禮","trivia":"其實「黑珍珠」不是品種名，是屏東林邊佳冬一帶的高品質蓮霧統稱。"}'::jsonb,
  '{"appearance":"色澤黑透紅（越黑越甜）","detail":"臍孔開口大，無分泌物","tactile":"手感沉重（水分足）","sense":"清脆無海綿化，檢查有無裂痕","storage":"報紙包好冷藏（勿洗）","texture_desc":"口感清脆，無海綿化，汁多"}'::jsonb,
  ARRAY['蓮霧','璉霧']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'waxapple_kingkong',
  '黑金剛蓮霧',
  '蓮霧',
  '[10,10,9,7,2,1,1,1,2,6,9,10]'::jsonb,
  '{"name_en":"Black King Kong Wax Apple","is_premium":true,"is_common":false,"tagline":"比黑珍珠更大顆，色澤更黑亮","color":"#4A0404","keywords":"蓮霧,黑鑽石","brix":12,"acidity":1,"calories":35,"gi_value":28,"price_level":4,"energy_index":-1,"moisture":10,"aroma":3,"origin":"國產","best_origin":"屏東佳冬","skin_edible":"Yes","seed_edible":"None","good_for":"咽喉腫痛、熱病津傷","bad_for":"手腳冰冷、易腹瀉","safety_warning":"無特殊高風險","nutritional_value":"花青素含量較高（深色果皮），富含水分與鉀。","relief_symptoms":"潤喉養肺,補水/消水腫","relief_mechanism":"鉀離子助排水；生津止渴。","scenario":"體面送禮,生津解渴","trivia":"是目前市面上等級最高的蓮霧品種之一。"}'::jsonb,
  '{"appearance":"整顆紅到發黑，發亮","detail":"果形碩大，飽滿","tactile":"肉質紮實，敲擊聲脆","sense":"甜度極高，檢查表皮有無指甲印","storage":"報紙包好冷藏","texture_desc":"肉質紮實，口感極脆，水分多"}'::jsonb,
  ARRAY['蓮霧','黑鑽石']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'waxapple_bullet',
  '子彈蓮霧',
  '蓮霧',
  '[9,9,8,6,3,1,1,1,2,5,8,9]'::jsonb,
  '{"name_en":"Bullet Wax Apple","is_premium":false,"is_common":false,"tagline":"外型長條像子彈，口感較脆硬","color":"#800000","keywords":"飛彈蓮霧","brix":10,"acidity":2,"calories":33,"gi_value":28,"price_level":2,"energy_index":-1,"moisture":9,"aroma":3,"origin":"國產","best_origin":"高雄六龜","skin_edible":"Yes","seed_edible":"None","good_for":"口渴心煩、消化不良","bad_for":"尿頻、脾虛便溏","safety_warning":"無特殊高風險","nutritional_value":"口感脆，含有維生素B群、C及礦物質。","relief_symptoms":"潤喉養肺,補水/消水腫","relief_mechanism":"水分與纖維均衡，清熱利濕。","scenario":"家庭分享","trivia":"因為外型像子彈，又像飛彈，所以有不同別名。"}'::jsonb,
  '{"appearance":"果形長條","detail":"顏色深紅，無青斑","tactile":"口感紮實，手感重","sense":"無特殊香氣，檢查頂端有無撞傷","storage":"冷藏保存","texture_desc":"口感紮實，較硬脆，水分適中"}'::jsonb,
  ARRAY['飛彈蓮霧']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'waxapple_palm',
  '巴掌蓮霧',
  '蓮霧',
  '[6,7,8,9,8,6,4,3,3,4,5,6]'::jsonb,
  '{"name_en":"Palm Wax Apple","is_premium":false,"is_common":false,"tagline":"巨大無比，一顆手掌掌握不住","color":"#DC143C","keywords":"巨無霸蓮霧","brix":9,"acidity":2,"calories":32,"gi_value":28,"price_level":3,"energy_index":-1,"moisture":9,"aroma":2,"origin":"國產","best_origin":"高雄六龜","skin_edible":"Yes","seed_edible":"None","good_for":"暑熱煩渴","bad_for":"胃寒、生理期","safety_warning":"無特殊高風險","nutritional_value":"果實大，水分多，含有膳食纖維與鉀。","relief_symptoms":"潤喉養肺,補水/消水腫","relief_mechanism":"巨大果實提供大量水分。","scenario":"拜拜祈福,稀有嘗鮮","trivia":"雖然很大顆看起來很爽，但通常甜度不如小顆的黑珍珠。"}'::jsonb,
  '{"appearance":"體型巨大（如巴掌）","detail":"果色較淡（粉紅）","tactile":"海綿組織較多，手感輕","sense":"甜度較低，主要看大小","storage":"冷藏保存","texture_desc":"肉質較鬆，易海綿化，水分多"}'::jsonb,
  ARRAY['巨無霸蓮霧']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'waxapple_white',
  '白蓮霧',
  '蓮霧',
  '[0,0,0,0,2,7,9,6,2,0,0,0]'::jsonb,
  '{"name_en":"White Wax Apple","is_premium":false,"is_common":false,"tagline":"復古品種，顏色乳白，帶有特殊酸香","color":"#F0FFF0","keywords":"新市白蓮霧","brix":8,"acidity":3,"calories":30,"gi_value":25,"price_level":3,"energy_index":-1,"moisture":8,"aroma":4,"origin":"國產","best_origin":"台南新市","skin_edible":"Yes","seed_edible":"None","good_for":"糖尿病（低糖）、口乾","bad_for":"體虛胃寒","safety_warning":"無特殊高風險","nutritional_value":"含有獨特的有機酸香氣，維生素C與水分豐富。","relief_symptoms":"潤喉養肺,補水/消水腫","relief_mechanism":"糖分較低，傳統認為有清肺熱之效。","scenario":"懷舊古早味","trivia":"是台灣早期的原生種，現在市面上已經很少見了。"}'::jsonb,
  '{"appearance":"果皮乳白色，帶綠","detail":"體型較小，像鈴鐺","tactile":"口感鬆軟，手感輕","sense":"有特殊澀味，檢查有無褐變","storage":"冷藏保存","texture_desc":"口感鬆軟，水分多，帶有澀味"}'::jsonb,
  ARRAY['新市白蓮霧']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'waxapple_missile',
  '飛彈蓮霧',
  '蓮霧',
  '[8,9,9,7,4,1,0,0,0,3,6,8]'::jsonb,
  '{"name_en":"Missile Wax Apple","is_premium":false,"is_common":false,"tagline":"比子彈蓮霧更深黑，外型修長","color":"#8B0000","keywords":"子彈蓮霧","brix":11,"acidity":1,"calories":34,"gi_value":28,"price_level":3,"energy_index":-1,"moisture":9,"aroma":3,"origin":"國產","best_origin":"屏東","skin_edible":"Yes","seed_edible":"None","good_for":"熱咳、喉嚨乾癢","bad_for":"頻尿、腹瀉","safety_warning":"無特殊高風險","nutritional_value":"花青素豐富，含有維生素C、鉀及膳食纖維。","relief_symptoms":"潤喉養肺,補水/消水腫","relief_mechanism":"含鉀排水；紫紅皮含花青素。","scenario":"家庭分享,體面送禮","trivia":"是子彈蓮霧的改良品種，顏色更漂亮。"}'::jsonb,
  '{"appearance":"果色紫黑，光澤佳","detail":"果形修長，像飛彈","tactile":"肉質細緻，手感重","sense":"甜度高，檢查有無裂果","storage":"冷藏保存","texture_desc":"肉質細緻，口感脆甜，無渣"}'::jsonb,
  ARRAY['子彈蓮霧']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'longan_pinkshell',
  '粉殼龍眼',
  '龍眼',
  '[0,0,0,0,0,0,2,8,10,4,0,0]'::jsonb,
  '{"name_en":"Pink Shell Longan","is_premium":false,"is_common":true,"tagline":"果殼帶粉，甜度高，果肉Q彈","color":"#DEB887","keywords":"龍眼,桂圓,福圓","brix":21,"acidity":1,"calories":73,"gi_value":72,"price_level":2,"energy_index":2,"moisture":6,"aroma":7,"origin":"國產","best_origin":"台南東山","skin_edible":"No","seed_edible":"No","good_for":"心脾兩虛、失眠多夢、產後調補","bad_for":"內有鬱火、感冒發燒、懷孕早期","safety_warning":"**上火**：多吃易流鼻血。","nutritional_value":"富含葡萄糖、蔗糖、維生素C及礦物質鉀。","relief_symptoms":"舒壓助眠,補氣血/暖身","relief_mechanism":"桂圓是傳統安神補血聖品，溫補心脾。","scenario":"美顏補氣,特殊護理","trivia":"是台灣龍眼的主要品種，適合鮮食也適合烘乾。"}'::jsonb,
  '{"appearance":"果殼黃褐帶粉","detail":"果形圓潤，殼薄","tactile":"按壓不凹陷（代表新鮮）","sense":"甜味濃厚，無發酵味","storage":"乾燥通風或冷藏","texture_desc":"肉質Q彈，離核容易，口感甜脆"}'::jsonb,
  ARRAY['龍眼','桂圓','福圓']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'longan_runti',
  '潤提龍眼',
  '龍眼',
  '[0,0,0,0,0,0,0,5,10,6,0,0]'::jsonb,
  '{"name_en":"Run-ti Longan","is_premium":false,"is_common":false,"tagline":"又稱「大龍眼」，肉厚但甜度較低","color":"#D2B48C","keywords":"大粒龍眼","brix":19,"acidity":1,"calories":70,"gi_value":70,"price_level":2,"energy_index":2,"moisture":7,"aroma":6,"origin":"國產","best_origin":"台中霧峰","skin_edible":"No","seed_edible":"No","good_for":"氣血不足、神經衰弱","bad_for":"濕熱體質、喉嚨痛","safety_warning":"**上火**。","nutritional_value":"肉厚，含有碳水化合物、維生素B群及C。","relief_symptoms":"舒壓助眠,補氣血/暖身","relief_mechanism":"肉厚甜度高，補充體力。","scenario":"家庭分享","trivia":"雖然大顆，但風味不如粉殼龍眼濃郁。"}'::jsonb,
  '{"appearance":"果形較大","detail":"果殼較厚，顏色深","tactile":"肉質脆硬","sense":"甜度較淡，檢查果殼有無破裂","storage":"乾燥通風或冷藏","texture_desc":"肉質較脆硬，水分稍少，口感爽"}'::jsonb,
  ARRAY['大粒龍眼']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_fuji',
  '富士蘋果',
  '蘋果',
  '[9,8,7,6,4,2,0,0,0,2,6,9]'::jsonb,
  '{"name_en":"Fuji Apple","is_premium":false,"is_common":true,"tagline":"脆甜多汁，酸甜適中，全球最受歡迎","color":"#FF4500","keywords":"Fuji,蘋果","brix":14,"acidity":3,"calories":50,"gi_value":36,"price_level":3,"energy_index":0,"moisture":8,"aroma":6,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"輕微腹瀉（去皮）、便秘（連皮）、煩熱","bad_for":"脾胃虛寒（生食）、糖尿病（過量）","safety_warning":"無特殊高風險","nutritional_value":"富含原花青素、兒茶素及果膠（水溶性纖維），有助腸道健康。","relief_symptoms":"順暢排便,幫助消化/解膩,舒壓助眠","relief_mechanism":"雙向調節：果膠吸水改善腹瀉，纖維助排便（連皮吃）。","scenario":"懶人免動刀,拜拜祈福,家庭分享","trivia":"富士蘋果的名字來自日本「藤崎（Fujisaki）」町，不是富士山。"}'::jsonb,
  '{"appearance":"整顆紅潤有條紋","detail":"底部凹陷深（越深越甜）","tactile":"重量感足，不可輕飄飄","sense":"無油膩感（出油代表過熟）","storage":"塑膠袋包好冷藏","texture_desc":"口感硬脆，汁多，肉質細緻"}'::jsonb,
  ARRAY['Fuji','蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_sun_fuji',
  '蜜富士蘋果',
  '蘋果',
  '[10,9,7,4,1,0,0,0,0,0,4,9]'::jsonb,
  '{"name_en":"Sun Fuji Apple","is_premium":false,"is_common":false,"tagline":"切開有蜜芯，甜度更高香氣更濃","color":"#DC143C","keywords":"蜜蘋果,結蜜蘋果","brix":15,"acidity":2,"calories":54,"gi_value":38,"price_level":4,"energy_index":0,"moisture":9,"aroma":7,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"疲勞、口乾舌燥","bad_for":"糖尿病、痰濕體質","safety_warning":"無特殊高風險","nutritional_value":"中心結蜜處含有山梨糖醇，富含多酚類化合物與纖維。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"結蜜處的山梨糖醇與果糖提供能量與愉悅感。","scenario":"體面送禮,老饕最愛","trivia":"蜜芯其實是山梨糖醇累積，並不是壞掉喔！"}'::jsonb,
  '{"appearance":"果皮紅潤帶黃點","detail":"蒂頭粗壯","tactile":"手感沉重（蜜芯重）","sense":"香氣濃郁，檢查蒂頭有無裂痕","storage":"冷藏保存，蜜芯易消失需快吃","texture_desc":"口感極脆，帶有蜜腺，肉質紮實"}'::jsonb,
  ARRAY['蜜蘋果','結蜜蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_red_delicious',
  '五爪蘋果',
  '蘋果',
  '[8,7,5,3,1,0,0,0,0,3,7,9]'::jsonb,
  '{"name_en":"Red Delicious Apple","is_premium":false,"is_common":false,"tagline":"外型深紅完美，口感鬆軟","color":"#8B0000","keywords":"五爪,飯蘋果","brix":12,"acidity":2,"calories":52,"gi_value":35,"price_level":2,"energy_index":0,"moisture":5,"aroma":5,"origin":"進口","best_origin":"美國華盛頓","skin_edible":"Wax","seed_edible":"Yes","good_for":"腹瀉（收斂作用）、消化不良","bad_for":"便秘（吃肉不吃皮者）","safety_warning":"無特殊高風險","nutritional_value":"果皮深紅富含花青素與槲皮素（Quercetin），抗氧化力強。","relief_symptoms":"順暢排便,止瀉/收斂","relief_mechanism":"收斂性較強，有助於緩解輕微腹瀉。","scenario":"拜拜祈福,軟糯好咬","trivia":"雖然外型漂亮，但因為口感鬆軟，現在年輕人較不愛。"}'::jsonb,
  '{"appearance":"深紅近乎紫黑","detail":"底部有五個明顯稜角","tactile":"按壓不可太軟（太軟口感粉）","sense":"香氣濃但皮厚，檢查有無壓傷","storage":"冷藏保存","texture_desc":"口感鬆軟，肉質呈粉狀（粉蘋果）"}'::jsonb,
  ARRAY['五爪','飯蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_granny_smith',
  '翠玉青蘋果',
  '蘋果',
  '[7,7,7,7,7,7,7,7,7,7,7,7]'::jsonb,
  '{"name_en":"Granny Smith Apple","is_premium":false,"is_common":false,"tagline":"酸度極高，口感硬脆，適合烘焙","color":"#32CD32","keywords":"青蘋果,酸蘋果","brix":11,"acidity":9,"calories":48,"gi_value":30,"price_level":3,"energy_index":-1,"moisture":8,"aroma":4,"origin":"進口","best_origin":"美國/南非","skin_edible":"Wax","seed_edible":"Yes","good_for":"津液不足、食慾差","bad_for":"胃酸過多、牙齒敏感","safety_warning":"無特殊高風險","nutritional_value":"糖分較低，酸度高，蘋果酸與鉀含量豐富。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"高酸度刺激唾液與胃酸分泌。","scenario":"烘焙,低卡減負,酸甜開胃","trivia":"它是做蘋果派的唯一指定品種，煮了不會爛。"}'::jsonb,
  '{"appearance":"果皮翠綠無瑕","detail":"蒂頭鮮綠","tactile":"質地極硬，按壓無凹陷","sense":"聞起來有青澀的草酸味","storage":"冷藏可放很久","texture_desc":"口感極硬脆，酸度高，耐煮不爛"}'::jsonb,
  ARRAY['青蘋果','酸蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_gala',
  '加拉蘋果',
  '蘋果',
  '[2,2,2,2,2,2,2,4,8,8,6,3]'::jsonb,
  '{"name_en":"Gala Apple","is_premium":false,"is_common":false,"tagline":"個頭小，皮薄脆甜，適合小孩當點心","color":"#FF6347","keywords":"Gala","brix":13,"acidity":3,"calories":52,"gi_value":36,"price_level":2,"energy_index":0,"moisture":7,"aroma":6,"origin":"進口","best_origin":"紐西蘭","skin_edible":"Wax","seed_edible":"Yes","good_for":"幼兒消化不良、食慾差","bad_for":"糖尿病（需控量）","safety_warning":"無特殊高風險","nutritional_value":"果皮薄，含有維生素C、A及膳食纖維，適合兒童食用。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"水溶性纖維豐富，適合兒童腸胃調節。","scenario":"懶人免動刀,家庭分享","trivia":"是紐西蘭培育的品種，皮薄到可以直接吃。"}'::jsonb,
  '{"appearance":"果皮橙紅帶黃條紋","detail":"體型較小，圓潤","tactile":"手感結實","sense":"香氣香甜，檢查果梗是否枯萎","storage":"冷藏保存","texture_desc":"口感脆甜，肉質細緻，皮薄"}'::jsonb,
  ARRAY['Gala']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_envy',
  '愛妃蘋果',
  '蘋果',
  '[5,6,8,9,9,8,6,4,2,1,2,4]'::jsonb,
  '{"name_en":"Envy Apple","is_premium":false,"is_common":false,"tagline":"果肉切開不易變色，極脆極甜","color":"#FF0000","keywords":"Envy","brix":15,"acidity":2,"calories":53,"gi_value":38,"price_level":4,"energy_index":0,"moisture":9,"aroma":7,"origin":"進口","best_origin":"紐西蘭","skin_edible":"Wax","seed_edible":"Yes","good_for":"便秘、口乾、疲勞","bad_for":"牙口不好（果肉硬）、胃寒","safety_warning":"無特殊高風險","nutritional_value":"果肉抗氧化能力強（不易變色），富含維生素C與纖維。","relief_symptoms":"美白抗氧化,順暢排便","relief_mechanism":"維生素C與纖維含量均衡。","scenario":"體面送禮,料理加工","trivia":"切開後放30分鐘都不會氧化變黃，非常適合做沙拉。"}'::jsonb,
  '{"appearance":"果皮紅帶黃斑（鏽斑是特色）","detail":"果形圓潤厚實","tactile":"質地非常硬脆","sense":"香氣高雅，檢查有無撞傷","storage":"冷藏保存","texture_desc":"口感極致硬脆，肉質紮實，不易氧化"}'::jsonb,
  ARRAY['Envy']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_rockit',
  '樂淇蘋果',
  '蘋果',
  '[6,7,8,9,9,8,6,4,2,2,3,5]'::jsonb,
  '{"name_en":"Rockit Apple","is_premium":false,"is_common":false,"tagline":"管狀包裝的小蘋果，不用削皮整顆啃","color":"#DC143C","keywords":"管狀蘋果,小蘋果","brix":14,"acidity":3,"calories":52,"gi_value":36,"price_level":4,"energy_index":0,"moisture":9,"aroma":5,"origin":"進口","best_origin":"紐西蘭","skin_edible":"Yes","seed_edible":"Yes","good_for":"上班族疲勞、便秘","bad_for":"牙口不好（果肉硬）","safety_warning":"無特殊高風險","nutritional_value":"體積小攜帶方便，富含膳食纖維與多酚類物質。","relief_symptoms":"順暢排便,幫助消化/解膩","relief_mechanism":"連皮食用可攝取最多膳食纖維。","scenario":"懶人免動刀,家庭分享","trivia":"號稱是世界上最小的蘋果，專為方便攜帶設計。"}'::jsonb,
  '{"appearance":"果實極小（網球大）","detail":"果皮光滑鮮紅，裝在管中","tactile":"脆度極高，硬實","sense":"檢查管內有無水氣（易發霉）","storage":"冷藏保存","texture_desc":"口感極脆，肉質細緻，連皮可食"}'::jsonb,
  ARRAY['管狀蘋果','小蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_honeycrisp',
  '蜜脆蘋果',
  '蘋果',
  '[3,2,1,0,0,0,0,0,2,6,9,7]'::jsonb,
  '{"name_en":"Honeycrisp Apple","is_premium":false,"is_common":false,"tagline":"咬下去會發出喀滋聲，細胞壁爆裂的快感","color":"#FF6347","keywords":"Honeycrisp","brix":14,"acidity":5,"calories":52,"gi_value":38,"price_level":4,"energy_index":0,"moisture":9,"aroma":6,"origin":"進口","best_origin":"美國華盛頓","skin_edible":"Wax","seed_edible":"Yes","good_for":"口渴心煩、便秘","bad_for":"牙口不好、胃寒","safety_warning":"無特殊高風險","nutritional_value":"水分含量高，細胞壁大，含有維生素C與鉀。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"水分極多且清脆，能提神解渴。","scenario":"老饕最愛,生津解渴","trivia":"它的細胞比一般蘋果大，所以咬下去汁水是用噴的。"}'::jsonb,
  '{"appearance":"果皮紅黃相間","detail":"果點明顯","tactile":"手感沉重（水分特多）","sense":"聞起來有清爽甜味","storage":"冷藏保存","texture_desc":"口感酥脆，汁多（細胞壁大），肉質粗"}'::jsonb,
  ARRAY['Honeycrisp']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_pink_lady',
  '粉紅佳人蘋果',
  '蘋果',
  '[5,6,7,8,8,7,5,3,1,1,2,4]'::jsonb,
  '{"name_en":"Pink Lady Apple","is_premium":true,"is_common":false,"tagline":"酸甜分明，戀愛般的粉紅色澤","color":"#FF69B4","keywords":"Pink Lady","brix":13,"acidity":7,"calories":54,"gi_value":35,"price_level":3,"energy_index":0,"moisture":8,"aroma":6,"origin":"進口","best_origin":"紐西蘭","skin_edible":"Wax","seed_edible":"Yes","good_for":"消化不良、煩熱","bad_for":"胃酸過多","safety_warning":"無特殊高風險","nutritional_value":"酸甜平衡，富含類黃酮、維生素C及果膠。","relief_symptoms":"幫助消化/解膩,順暢排便","relief_mechanism":"酸甜口感促進消化液分泌。","scenario":"稀有嘗鮮,酸甜開胃","trivia":"它是唯一有註冊商標且有嚴格品質檢驗的蘋果品牌。"}'::jsonb,
  '{"appearance":"果皮呈現獨特粉紅色","detail":"果形端正，蒂頭深","tactile":"口感硬脆，按壓不軟","sense":"帶有氣泡酒般的香氣","storage":"冷藏保存","texture_desc":"口感硬脆，酸甜分明，肉質紮實"}'::jsonb,
  ARRAY['Pink Lady']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_kinsei',
  '金星蘋果',
  '蘋果',
  '[8,7,5,2,0,0,0,0,0,1,5,9]'::jsonb,
  '{"name_en":"Kinsei Apple","is_premium":false,"is_common":false,"tagline":"如奶油般的滑順口感，帶有牛奶香","color":"#FFFFE0","keywords":"牛奶蘋果,黃金蘋果","brix":15,"acidity":2,"calories":55,"gi_value":38,"price_level":5,"energy_index":0,"moisture":7,"aroma":8,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"胃酸過多者、口乾","bad_for":"糖尿病、喜歡脆口感者","safety_warning":"無特殊高風險","nutritional_value":"酸度低，含有果糖、葡萄糖及維生素C。","relief_symptoms":"順暢排便,舒壓助眠","relief_mechanism":"酸度極低，對胃部刺激較小（相較於酸蘋果）。","scenario":"體面送禮,螞蟻人","trivia":"因為顏色像金星一樣閃耀而得名，酸度極低。"}'::jsonb,
  '{"appearance":"果皮金黃色（套袋栽培）","detail":"果點明顯","tactile":"手感較輕（口感鬆軟）","sense":"有淡淡牛奶/奶油香","storage":"冷藏保存","texture_desc":"口感較鬆軟，肉質細緻，酸度低"}'::jsonb,
  ARRAY['牛奶蘋果','黃金蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_orin',
  '王林蘋果',
  '蘋果',
  '[9,8,6,2,0,0,0,0,0,2,6,9]'::jsonb,
  '{"name_en":"Orin Apple","is_premium":false,"is_common":false,"tagline":"香氣濃郁的青蘋果，幾乎無酸味","color":"#9ACD32","keywords":"綠蘋果,雀斑蘋果","brix":14,"acidity":2,"calories":53,"gi_value":36,"price_level":4,"energy_index":0,"moisture":7,"aroma":9,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"食慾不振、煩躁","bad_for":"喜歡脆口感者","safety_warning":"無特殊高風險","nutritional_value":"香氣成分豐富，酸度低，含有鉀與膳食纖維。","relief_symptoms":"順暢排便,潤喉養肺","relief_mechanism":"獨特濃郁香氣有助於放鬆心情。","scenario":"體面送禮,螞蟻人","trivia":"被稱為「有格調的蘋果」，香氣是其最大特色。"}'::jsonb,
  '{"appearance":"果皮黃綠色","detail":"果點明顯（有雀斑是正常）","tactile":"手感結實","sense":"有強烈果香，無油耗味","storage":"冷藏保存","texture_desc":"口感鬆脆，肉質細緻，香氣濃"}'::jsonb,
  ARRAY['綠蘋果','雀斑蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_toki',
  '拓季蘋果',
  '蘋果',
  '[3,2,1,0,0,0,0,0,0,2,7,8]'::jsonb,
  '{"name_en":"Toki Apple","is_premium":false,"is_common":false,"tagline":"水蜜桃蘋果，粉嫩多汁，香氣迷人","color":"#FFFF00","keywords":"水蜜桃蘋果","brix":15,"acidity":3,"calories":52,"gi_value":38,"price_level":4,"energy_index":0,"moisture":8,"aroma":7,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"口乾、便秘","bad_for":"胃寒、糖尿病","safety_warning":"無特殊高風險","nutritional_value":"果皮薄，含有維生素C、多酚及水溶性纖維。","relief_symptoms":"順暢排便,美白抗氧化","relief_mechanism":"果皮薄易連皮吃，增加纖維攝取。","scenario":"體面送禮,稀有嘗鮮","trivia":"是王林跟富士的混種，遺傳了王林的香與富士的甜。"}'::jsonb,
  '{"appearance":"果皮黃中透粉","detail":"果皮極薄，看得到果肉紋理","tactile":"手感細緻，汁多","sense":"有水蜜桃香氣，檢查有無壓傷（皮薄易傷）","storage":"皮薄易傷，需小心冷藏","texture_desc":"口感脆甜，多汁，肉質細緻"}'::jsonb,
  ARRAY['水蜜桃蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_sekai_ichi',
  '世界一蘋果',
  '蘋果',
  '[8,6,3,1,0,0,0,0,0,1,5,9]'::jsonb,
  '{"name_en":"Sekai Ichi Apple","is_premium":true,"is_common":false,"tagline":"碩大無比，送禮霸氣，口感鬆軟","color":"#FF4500","keywords":"巨無霸蘋果","brix":13,"acidity":2,"calories":50,"gi_value":35,"price_level":5,"energy_index":0,"moisture":6,"aroma":5,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"煩熱口渴、便秘","bad_for":"脾胃虛寒","safety_warning":"無特殊高風險","nutritional_value":"果實巨大，提供碳水化合物、膳食纖維及微量維生素C。","relief_symptoms":"舒壓助眠,順暢排便","relief_mechanism":"大份量果糖提供充足熱量。","scenario":"拜拜祈福,體面送禮,家庭分享","trivia":"號稱世界最大的蘋果，但口感偏鬆軟，吃的是氣派。"}'::jsonb,
  '{"appearance":"體型巨大（近1公斤）","detail":"果色鮮紅，蒂頭粗","tactile":"敲起來聲音低沉（代表口感鬆）","sense":"香氣濃郁，檢查有無壓傷","storage":"冷藏保存","texture_desc":"口感偏鬆軟，肉質較粗，水分適中"}'::jsonb,
  ARRAY['巨無霸蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'apple_mutsu',
  '陸奧蘋果',
  '蘋果',
  '[6,5,3,1,0,0,0,0,0,2,6,8]'::jsonb,
  '{"name_en":"Mutsu Apple","is_premium":false,"is_common":false,"tagline":"粉紅色的巨無霸，口感偏硬脆","color":"#FFC0CB","keywords":"慕茨蘋果","brix":13,"acidity":4,"calories":51,"gi_value":36,"price_level":4,"energy_index":0,"moisture":7,"aroma":6,"origin":"進口","best_origin":"日本青森","skin_edible":"Wax","seed_edible":"Yes","good_for":"食積不化、便秘","bad_for":"牙口不好","safety_warning":"無特殊高風險","nutritional_value":"口感硬脆，含有維生素C、鉀及蘋果多酚。","relief_symptoms":"順暢排便","relief_mechanism":"鉀離子含量適中，助排鈉。","scenario":"體面送禮,家庭分享","trivia":"以前為了祝賀日本皇室婚禮而培育的品種。"}'::jsonb,
  '{"appearance":"果皮粉紅帶黃","detail":"體型大，圓錐狀","tactile":"質地硬脆，重量感足","sense":"聞蒂頭有酸甜香氣","storage":"冷藏保存","texture_desc":"口感硬脆，肉質紮實，體型大"}'::jsonb,
  ARRAY['慕茨蘋果']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'custardapple_bigeye',
  '大目釋迦',
  '釋迦',
  '[8,9,10,8,2,0,1,6,9,10,9,8]'::jsonb,
  '{"name_en":"Big Eye Sugar Apple","is_premium":false,"is_common":true,"tagline":"傳統釋迦，口感綿密香甜，剝皮即食","color":"#9ACD32","keywords":"釋迦,番利","brix":22,"acidity":2,"calories":95,"gi_value":55,"price_level":3,"energy_index":1,"moisture":5,"aroma":6,"origin":"國產","best_origin":"台東太麻里","skin_edible":"No","seed_edible":"No","good_for":"體虛消瘦、需補充熱量","bad_for":"糖尿病、腎臟病（高鉀）、便秘","safety_warning":"**高糖/高鉀**。","nutritional_value":"碳水化合物與鉀含量極高，含有維生素C與蛋白質。","relief_symptoms":"舒壓助眠,美白抗氧化,血壓調節","relief_mechanism":"極高碳水化合物與熱量，快速恢復體力。","scenario":"螞蟻人,老饕最愛,軟糯好咬","trivia":"沒熟千萬不能冰，一冰就變成「啞巴果」再也不會熟。"}'::jsonb,
  '{"appearance":"鱗目大且平整","detail":"溝紋呈乳黃色（代表熟）","tactile":"按壓軟熟（才可吃）","sense":"濃郁甜香，沒熟千萬別冰","storage":"室溫催熟，軟了才能冰","texture_desc":"口感綿密，像奶油，甜度極高"}'::jsonb,
  ARRAY['釋迦','番利']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();

INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  'custardapple_pineapple',
  '鳳梨釋迦',
  '釋迦',
  '[10,10,9,5,0,0,0,0,0,0,2,8]'::jsonb,
  '{"name_en":"Atemoya","is_premium":true,"is_common":false,"tagline":"口感Q彈像軟糖，帶有鳳梨香氣","color":"#32CD32","keywords":"旺來釋迦","brix":24,"acidity":3,"calories":104,"gi_value":58,"price_level":3,"energy_index":1,"moisture":5,"aroma":7,"origin":"國產","best_origin":"台東卑南","skin_edible":"No","seed_edible":"No","good_for":"疲勞、便秘、維C缺乏","bad_for":"糖尿病、腎臟病、濕熱體質","safety_warning":"**高糖/高鉀**。","nutritional_value":"膳食纖維豐富，維生素C含量是蘋果的數倍，高糖高鉀。","relief_symptoms":"美白抗氧化,舒壓助眠,護眼明目","relief_mechanism":"膳食纖維含量極高；維生素C是蘋果的數倍。","scenario":"體面送禮,螞蟻人","trivia":"是唯一可以切片吃的釋迦品種，冰過像冰淇淋。"}'::jsonb,
  '{"appearance":"果皮光滑連在一起","detail":"外觀鮮綠，鱗目不明顯","tactile":"按壓微軟（像橡皮擦）","sense":"鳳梨酸甜香，變軟後才可切","storage":"室溫催熟，軟後切塊冷藏","texture_desc":"口感Q彈，像軟糖，肉質紮實"}'::jsonb,
  ARRAY['旺來釋迦']
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();