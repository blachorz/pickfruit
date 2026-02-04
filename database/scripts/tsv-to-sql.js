const fs = require('fs');
const path = require('path');

// Configuration
const INPUT_FILE = path.join(__dirname, '../fruits.tsv');
const OUTPUT_FILE = path.join(__dirname, '../../db/seed.sql');

// Helper to escape SQL strings
function escapeSQL(str) {
  if (str === null || str === undefined) return 'null';
  return `'${String(str).replace(/'/g, "''")}'`;
}

// Helper to parse JSON safely
function parseJSONSafe(str) {
  if (!str) return [];
  try {
    return JSON.parse(str);
  } catch (e) {
    // If it's not JSON, maybe it's a simple string or empty?
    // For curve data, we expect array.
    if (str.startsWith('[') || str.startsWith('{')) {
       console.warn('Warning: Could not parse JSON field:', str);
    }
    return [];
  }
}

async function main() {
  if (!fs.existsSync(INPUT_FILE)) {
    console.error(`Error: File not found: ${INPUT_FILE}`);
    console.error('Please download your Google Sheet "fruits" tab as TSV and save it as "fruits.tsv" in the fruit-migration folder.');
    process.exit(1);
  }

  const content = fs.readFileSync(INPUT_FILE, 'utf8');
  // Split by newline. Handle CRLF or LF.
  const lines = content.split(/\r?\n/).filter(line => line.trim() !== '');
  
  if (lines.length < 2) {
    console.error('Error: TSV file seems empty or missing header.');
    process.exit(1);
  }

  // Parse Header (Tab Separated)
  const headers = lines[0].split('\t').map(h => h.toLowerCase().trim());
  
  // Column Helper
  const getCol = (rowValues, colName) => {
    const idx = headers.indexOf(colName);
    if (idx === -1) return '';
    return rowValues[idx] ? rowValues[idx].trim() : '';
  };

  let sqlStatements = [`-- Generated Seed Data`];
  sqlStatements.push(`DELETE FROM fruits;`); // Clear existing data

  console.log(`Found ${lines.length - 1} rows. Processing...`);

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i];
    // Split by Tab
    const row = line.split('\t');
    
    // Safety check: if row has significantly fewer columns than header, it might be a broken line
    // But TSV might drop trailing empty tabs, so we just check the critical fields.
    
    // Extract Basic Fields
    const slug = getCol(row, 'id');
    const name = getCol(row, 'name');
    const category = getCol(row, 'category');
    
    if (!slug || !name) continue; // Skip if mandatory fields missing

    // Parse Tags/Keywords
    const keywordsStr = getCol(row, 'keywords');
    const tags = keywordsStr ? keywordsStr.split(/,|、/).map(k => k.trim()).filter(Boolean) : [];
    
    // Parse Season Curve
    const seasonCurveStr = getCol(row, 'season_curve');
    let seasonCurve = [];
    if (seasonCurveStr) {
      seasonCurve = parseJSONSafe(seasonCurveStr);
    }

    // Construct Properties JSONB
    const properties = {
      name_en: getCol(row, 'name_en'),
      is_premium: getCol(row, 'is_premium') === 'TRUE' || getCol(row, 'is_premium') === 'true',
      is_common: getCol(row, 'is_common') === 'TRUE' || getCol(row, 'is_common') === 'true',
      tagline: getCol(row, 'hero_tagline'),
      color: getCol(row, 'color_hex'),
      keywords: getCol(row, 'keywords'), // Added keywords
      brix: Number(getCol(row, 'brix')) || 0,
      acidity: Number(getCol(row, 'acidity')) || 0,
      calories: Number(getCol(row, 'calories')) || 0,
      gi_value: Number(getCol(row, 'gi_value')) || null,
      price_level: Number(getCol(row, 'price_level')) || 0,
      energy_index: Number(getCol(row, 'energy_index')) || 0,
      moisture: Number(getCol(row, 'moisture')) || 0,
      aroma: Number(getCol(row, 'aroma')) || 0,
      origin: getCol(row, 'origin'),
      best_origin: getCol(row, 'best_origin'),
      skin_edible: getCol(row, 'skin_edible'),
      seed_edible: getCol(row, 'seed_edible'),
      good_for: getCol(row, 'good_for'),
      bad_for: getCol(row, 'bad_for'),
      safety_warning: getCol(row, 'safety_warning'),
      nutritional_value: getCol(row, 'nutritional_value'),
      relief_symptoms: getCol(row, 'relief_symptoms'),
      relief_mechanism: getCol(row, 'relief_mechanism'),
      scenario: getCol(row, 'scenario'),
      trivia: getCol(row, 'trivia')
    };

    // Construct Guide JSONB
    const guide = {
      appearance: getCol(row, 'guide_appearance'),
      detail: getCol(row, 'guide_detail'),
      tactile: getCol(row, 'guide_tactile'),
      sense: getCol(row, 'guide_sense'),
      storage: getCol(row, 'storage_guide'),
      texture_desc: getCol(row, 'texture_desc')
    };

    // Generate SQL
    const sql = `
INSERT INTO fruits (slug, name, category, season_curve, properties, guide, tags)
VALUES (
  ${escapeSQL(slug)},
  ${escapeSQL(name)},
  ${escapeSQL(category)},
  ${escapeSQL(JSON.stringify(seasonCurve))}::jsonb,
  ${escapeSQL(JSON.stringify(properties))}::jsonb,
  ${escapeSQL(JSON.stringify(guide))}::jsonb,
  ARRAY[${tags.map(t => escapeSQL(t)).join(',')}]
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  season_curve = EXCLUDED.season_curve,
  properties = EXCLUDED.properties,
  guide = EXCLUDED.guide,
  tags = EXCLUDED.tags,
  updated_at = now();
    `.trim();

    sqlStatements.push(sql);
  }

  // Write Output
  fs.writeFileSync(OUTPUT_FILE, sqlStatements.join('\n\n'));
  console.log(`Success! SQL seed file generated at: ${OUTPUT_FILE}`);
  console.log(`Row count: ${sqlStatements.length - 2}`); // Subtract comment and delete
}

main().catch(console.error);
