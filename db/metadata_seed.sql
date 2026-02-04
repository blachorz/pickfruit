-- Create scenarios table
create table scenarios (
  id uuid default gen_random_uuid() primary key,
  group_name text not null,
  name text not null unique,
  description text,
  sort_order int default 0
);

-- Create symptoms table
create table symptoms (
  id uuid default gen_random_uuid() primary key,
  group_name text not null,
  name text not null unique,
  description text,
  sort_order int default 0
);

-- Enable RLS (Read only for public)
alter table scenarios enable row level security;
alter table symptoms enable row level security;

create policy "Allow public read scenarios" on scenarios for select to public using (true);
create policy "Allow public read symptoms" on symptoms for select to public using (true);

-- Insert Scenarios Data
insert into scenarios (group_name, name, description, sort_order) values
('口感與便利', '螞蟻人', '嗜甜如命，追求極致糖度，討厭酸味。', 1),
('口感與便利', '酸甜開胃', '酸甜交織的豐富層次，適合食慾不振時。', 2),
('口感與便利', '懶人免動刀', '好剝、無籽、連皮吃，不髒手不麻煩。', 3),
('口感與便利', '軟糯好咬', '牙口不好也能吃，口感綿密或軟嫩。', 4),
('健康與機能', '順暢排空', '富含纖維與酵素，解決便秘與消化問題。', 5),
('健康與機能', '低卡減負', '低糖、低GI、高纖維，體重控制者的首選。', 6),
('健康與機能', '美顏補氣', '維C高、抗氧化、補血，讓你氣色變好。', 7),
('健康與機能', '生津解渴', '水分極多，解決口乾舌燥與暑熱。', 8),
('場合與時機', '體面送禮', '外觀完美、進口或頂級品種，送禮有面子。', 9),
('場合與時機', '拜拜祈福', '名字吉祥、圓滿耐放，敬神祭祖專用。', 10),
('場合與時機', '家庭分享', '份量大，適合切一大盤全家一起吃。', 11),
('場合與時機', '耐放存糧', '買回家可以放很久不壞，居家常備。', 12),
('探索與料理', '稀有嘗鮮', '市面少見、新品種或外觀特殊。', 13),
('探索與料理', '懷舊古早味', '小時候的味道，市場少見的傳統品種。', 14),
('探索與料理', '料理加工', '適合入菜、烘焙、做果醬或釀造。', 15),
('探索與料理', '特殊護理', '針對特定生理狀況 (如經期、感冒) 的輔助。', 16);

-- Insert Symptoms Data
insert into symptoms (group_name, name, description, sort_order) values
('腸胃與消化系統', '順暢排便', '【纖維】排便不順、便秘，需膳食纖維促進蠕動。', 1),
('腸胃與消化系統', '幫助消化/解膩', '【酵素/酸】飯後脹氣、食慾不振、大魚大肉後解膩，需天然酵素或有機酸。', 2),
('腸胃與消化系統', '止瀉/收斂', '【單寧酸/果膠】腹瀉、腸胃敏感，需收斂性物質幫助糞便成形。', 3),
('口腔與呼吸道系統', '潤喉養肺', '【滋陰/化痰】喉嚨乾癢、乾咳、痰多或嘴破，需生津潤燥、降火氣。', 4),
('口腔與呼吸道系統', '解酒/宿醉', '【代謝/果糖】飲酒後頭痛、噁心、口乾，需加速酒精代謝與補充流失電解質。', 5),
('精神與氣血系統', '舒壓助眠', '【鎂/鈣】失眠、淺眠、焦慮或壓力型頭痛，需礦物質舒緩神經緊繃。', 6),
('精神與氣血系統', '補氣血/暖身', '【鐵/溫熱性】手腳冰冷、貧血頭暈、經痛或臉色蒼白，需溫補氣血。', 7),
('皮膚與顏值管理', '美白抗氧化', '【維生素C】膚色暗沉、長痘痘、老化或免疫力降，需抗氧化劑修復。', 8),
('皮膚與顏值管理', '補水/消水腫', '【鉀/水分】皮膚乾燥脫屑、臉部身體浮腫，需補水並排出多餘鈉離子。', 9),
('視覺與代謝循環', '護眼明目', '【花青素/葉黃素】眼睛酸澀、視力模糊、3C藍光傷害，需抗氧化劑護眼。', 10),
('視覺與代謝循環', '血壓調節', '【高鉀】血壓偏高、肩頸僵硬，需高鉀水果輔助鈉鹽代謝（腎病者需注意）。', 11),
('特殊護理', '泌尿與痛風護理', '【抑菌/排酸】泌尿道感染（需抑菌）或痛風尿酸高（需排酸），屬特定代謝需求。', 12),
('特殊護理', '抗發炎/免疫調節', '【植化素】易感冒、過敏、身體慢性發炎，需多樣化植化素增強防禦。', 13);
