# 水果呷對時 — 專案進度記錄

**最後更新：** 2026 年 5 月 5 日

---

## 目前狀態

- Next.js + Supabase 版本已可用，包含首頁、水果詳情頁、挑選指南與回饋功能。
- 首頁泡泡圖、模式切換、月份切換、搜尋 overlay、長輩模式皆已完成。
- 水果詳情頁已完成桌機版比例調整，手機版維持滿版。
- SEO 基礎已補齊：metadata、canonical、JSON-LD、FAQ 內容、`sitemap.xml`、`robots.txt`。
- 正式網域以 `https://pickfruit.app` 為 canonical 基準。
- 最新驗證：`npm --prefix web run lint` 與 production build 通過。

---

## 待辦 / 暫緩

- 到 Google Search Console 驗證 `pickfruit.app` 並提交 `https://pickfruit.app/sitemap.xml`。
- Vercel production 環境確認設定 `NEXT_PUBLIC_SITE_URL=https://pickfruit.app`。
- 視需求加入 GA4 / GTM 與事件追蹤。
- 長輩模式月份按鈕放大時的過渡動效仍可再優化。
- 後續可補鍵盤操作、無障礙標籤、Lighthouse 調校。

---

## 關鍵檔案速查

| 用途 | 路徑 |
|------|------|
| 首頁與站內搜尋 | `web/src/components/FruitChart.tsx` |
| 水果詳情頁 | `web/src/components/FruitDetail.tsx` |
| 挑選指南 | `web/src/components/FruitGuide.tsx` |
| SEO / Sitemap / Robots | `web/src/utils/fruitSeo.ts`、`web/src/app/sitemap.ts`、`web/src/app/robots.ts` |
| 長輩模式 | `web/src/context/SettingsContext.tsx`、`web/src/app/globals.css` |
| 資料與 SQL | `db/`、`database/` |
| 原版參考 | `legacy/Code.gs`、`legacy/index.html` |
