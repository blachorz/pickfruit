-- Add slug column to scenarios
alter table scenarios add column slug text;
create unique index scenarios_slug_idx on scenarios (slug);

-- Add slug column to symptoms
alter table symptoms add column slug text;
create unique index symptoms_slug_idx on symptoms (slug);

-- Backfill Scenarios Slugs
update scenarios set slug = 'ant-lover' where name = '螞蟻人';
update scenarios set slug = 'sweet-sour' where name = '酸甜開胃';
update scenarios set slug = 'lazy-peel' where name = '懶人免動刀';
update scenarios set slug = 'soft-bite' where name = '軟糯好咬';
update scenarios set slug = 'digestion' where name = '順暢排空';
update scenarios set slug = 'low-cal' where name = '低卡減負';
update scenarios set slug = 'beauty' where name = '美顏補氣';
update scenarios set slug = 'thirst-quencher' where name = '生津解渴';
update scenarios set slug = 'premium-gift' where name = '體面送禮';
update scenarios set slug = 'worship' where name = '拜拜祈福';
update scenarios set slug = 'family-share' where name = '家庭分享';
update scenarios set slug = 'long-storage' where name = '耐放存糧';
update scenarios set slug = 'rare-find' where name = '稀有嘗鮮';
update scenarios set slug = 'nostalgia' where name = '懷舊古早味';
update scenarios set slug = 'cooking' where name = '料理加工';
update scenarios set slug = 'special-care' where name = '特殊護理';

-- Backfill Symptoms Slugs
update symptoms set slug = 'constipation' where name = '順暢排便';
update symptoms set slug = 'indigestion' where name = '幫助消化/解膩';
update symptoms set slug = 'diarrhea' where name = '止瀉/收斂';
update symptoms set slug = 'throat-lung' where name = '潤喉養肺';
update symptoms set slug = 'hangover' where name = '解酒/宿醉';
update symptoms set slug = 'insomnia' where name = '舒壓助眠';
update symptoms set slug = 'anemia' where name = '補氣血/暖身';
update symptoms set slug = 'whitening' where name = '美白抗氧化';
update symptoms set slug = 'edema' where name = '補水/消水腫';
update symptoms set slug = 'eye-care' where name = '護眼明目';
update symptoms set slug = 'blood-pressure' where name = '血壓調節';
update symptoms set slug = 'gout' where name = '泌尿與痛風護理';
update symptoms set slug = 'inflammation' where name = '抗發炎/免疫調節';

-- Make slug required after backfill
alter table scenarios alter column slug set not null;
alter table symptoms alter column slug set not null;
