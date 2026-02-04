# 水果呷對時 — 專案進度記錄

**最後更新：** 約 2025 年 2 月

---

## 已完成項目

### 架構與資料
- **Next.js + Supabase** 遷移完成：首頁、詳情頁、挑選指南頁皆上線。
- **資料庫**：`fruits`、`scenarios`、`symptoms`、`feedback` 表已建立；ETL 腳本 (`tsv-to-sql.js`) 產出 `db/seed.sql`；metadata 含 slug，供乾淨 URL 使用。
- **路由**：`/` 首頁、`/fruit/[slug]` 詳情、`/guide` 挑選指南；Guide 篩選狀態與 URL 同步，返回時會還原並滾動至結果區。

### 首頁 (FruitChart)
- 泡泡圖、模式切換（日常／陷阱／熱量／食養／風味／禮贈）、產季月份選擇。
- **搜尋 Overlay**：冷知識、關鍵字搜尋、結果高亮，UI 還原自原版 index.html。
- **懸浮按鈕**：長輩模式 (A/A)、回饋 (對話圖示)。
- **回饋 Modal**：正負向選項、標籤、留言，送出至 Supabase `feedback` 表。
- **產季分類小標題**：置頂貼合月份區（動態 `headerOffset` + ResizeObserver），背景為 `bg-indigo-50` 視覺分割。

### 詳情頁 (FruitDetail)
- 基本資訊、常見別名、症狀標籤（可點擊跳 Guide 並帶篩選）、猜你喜歡、智慧分享邏輯，還原自原版。

### 挑選指南 (FruitGuide)
- 生活情調／身體訊號篩選、英文 slug URL、回到頁面時自動滾動至結果區。

### 長輩模式 (Elder Mode)
- **SettingsContext**：`largeMode` 全域狀態 + `localStorage` 持久化；`body.large-mode` 字級放大。
- **globals.css**：小字級過渡、月份按鈕專用 `.text-month-btn`（含固定 height 過渡）、`ignore-scaling` 區（座標標籤、挑選指南按鈕不放大）。
- **縮小時**：動效正常、過渡順暢。

### 其他
- 回饋負向選項已移除「無法操作」。
- `db` 與 `database/db` 已合併為單一 `db/` 目錄。

---

## 已知問題／暫緩項目

### 長輩模式 — 產季月份按鈕「放大」動效
- **現象**：開啟長輩模式時，產季月份區塊仍會「先變高、字才變大」的兩階段感，體感不順。
- **已嘗試**：px 行高、`transition` 統一、按鈕固定 `height` + 專用 cubic-bezier、`transition: all`。
- **目前**：縮小動效正常；放大動效保留現狀，日後有時間再優化（可能需從排版或瀏覽器繪製順序著手）。

---

## 之後可繼續的方向

1. **長輩模式**：再研究月份按鈕「放大」時的同步動效（或改為無過渡、瞬間切換以避開兩階段感）。
2. **體驗與效能**：鍵盤 ESC 關閉搜尋、更多無障礙標籤、Lighthouse 優化。
3. **內容與營運**：定期從 TSV 重新跑 ETL 更新 `seed.sql`；視需求加 `revalidate` 或 ISR。
4. **部署**：確認 Vercel 環境變數與 Supabase 連線，必要時補上錯誤邊界或 404 文案。

---

## 關鍵檔案速查

| 用途 | 路徑 |
|------|------|
| 首頁＋搜尋＋回饋＋長輩模式 | `web/src/components/FruitChart.tsx` |
| 詳情頁 | `web/src/components/FruitDetail.tsx` |
| 挑選指南 | `web/src/components/FruitGuide.tsx` |
| 長輩模式狀態 | `web/src/context/SettingsContext.tsx` |
| 長輩模式樣式 | `web/src/app/globals.css` |
| ETL 腳本 | `database/scripts/tsv-to-sql.js` |
| SQL 種子與結構 | `db/seed.sql`、`db/schema.sql`、`db/metadata_seed.sql`、`db/create_feedback_table.sql` |
| 原版參考 | `legacy/Code.gs`、`legacy/index.html` |
