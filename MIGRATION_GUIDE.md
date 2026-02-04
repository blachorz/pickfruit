# 🚀 MVP Scaling Strategy: Level 1 to Level 3 Migration Guide
**Project:** 水果呷對時 (Fruit App)
**Goal:** Migrate from GAS/Sheet to Next.js/Supabase for SEO, Performance, and Scalability.
**Cost Strategy:** $0 Maintenance (Free Tier Only)

---

## 1. ⚔️ 架構對照表 (Architecture Comparison)

| 元件 (Component) | 舊架構 (Level 1: Nano MVP) | 新架構 (Level 3: God Tier SaaS) | 遷移優勢 (Upgrade Benefits) |
| :--- | :--- | :--- | :--- |
| **前端框架** | HTML + Alpine.js | **Next.js 14 (React)** | 組件化開發、生態系豐富、更好維護。 |
| **渲染模式** | CSR (客戶端渲染) / 假 SSR | **SSR + ISR (增量靜態再生)** | **SEO 滿分**，爬蟲讀得到內容。 |
| **資料庫** | Google Sheets | **Supabase (PostgreSQL)** | 強型別、查詢速度快 100x、支援複雜關聯。 |
| **API 層** | Google Apps Script (`doGet`) | **Server Actions / Route Handlers** | 直接在 Next.js 內讀庫，無須維護額外 API。 |
| **快取機制** | 手寫 `CacheService` (GAS) | **Next.js Built-in Cache (`revalidate`)** | 自動化、CDN 邊緣快取，無需 Redis。 |
| **樣式庫** | Tailwind CDN (JIT) | **Tailwind CSS (PostCSS)** | 編譯優化，無 FOUC (閃爍) 問題。 |
| **部署託管** | Google App Script Web App | **Vercel** | 全球 CDN 節點、Git 自動部署。 |

---

## 2. 🛠️ 技術棧清單 (The Arsenal)

這是一套現代化、極速開發且免費的「黃金組合」：

*   **Framework**: `Next.js 14+` (App Router) - 目前業界標準。
*   **Language**: `TypeScript` - 必用，這是你的資料安全帶。
*   **Styling**: `Tailwind CSS` + `clsx` + `tailwind-merge`。
*   **UI Library**: `shadcn/ui` (基於 Radix UI) - 複製貼上即可用的高質感元件。
*   **Charts**: `Recharts` - 取代手刻 DOM 泡泡圖，React 專用圖表庫。
*   **Database**: `Supabase` - 開源 Firebase 替代品，底層是 Postgres。
*   **State**: `Zustand` (選用) - 如果 React Context 不夠用，這個比 Redux 輕量 100 倍。
*   **Icons**: `Lucide React` - 統一且好看的 Icon 庫。

---

## 3. 📝 遷移流程操作報告 (Operational Flow)

### Phase 1: 資料庫與 ETL (基建)
**目標**：將 Sheet 資料轉移至正規關聯式資料庫。

1.  **建立 Supabase 專案**：
    *   註冊 Supabase -> Create New Project -> 設定 Database Password。
2.  **設計 Schema (Table: `fruits`)**：
    *   在 SQL Editor 執行以下建表邏輯（保持 JSONB 彈性以容納舊資料）：
    ```sql
    create table fruits (
      id uuid default gen_random_uuid() primary key,
      slug text unique not null,  -- 用於網址: /fruit/apple
      name text not null,
      category text,
      season_curve jsonb, -- 存 [0,0,5,10...] 陣列
      properties jsonb,   -- 存 {brix: 12, calories: 50...}
      guide jsonb,        -- 存 {appearance: "...", tactile: "..."}
      tags text[],        -- 搜尋關鍵字
      created_at timestamptz default now()
    );
    ```
3.  **ETL (Extract-Transform-Load)**：
    *   **Export**: 從 Google Sheet 下載為 CSV。
    *   **Transform**: 使用線上的 CSV to JSON 工具，或寫個小腳本，把欄位名稱對應成英文（如 `hero_tagline` -> `properties.tagline`）。
    *   **Load**: 在 Supabase Table Editor 選擇 "Import Data from CSV" 直接匯入。

### Phase 2: 前端重構與移植 (開發)
**目標**：用 React 重寫 Alpine.js 邏輯。

1.  **初始化專案**：
    ```bash
    npx create-next-app@latest fruit-app --typescript --tailwind --eslint
    npx shadcn-ui@latest init  # 初始化 UI 庫
    ```
2.  **環境變數設定**：
    *   將 Supabase 的 `NEXT_PUBLIC_SUPABASE_URL` 和 `NEXT_PUBLIC_SUPABASE_ANON_KEY` 放入 `.env.local`。
3.  **核心元件移植 (Porting)**：
    *   **BubbleChart**: 安裝 `npm install recharts`。將原本手算的 DOM 位置邏輯，改為 `<ScatterChart>` 元件設定。
    *   **Filters**: 原本 Alpine 的 `x-model="month"` 改為 React 的 `useState` 或 URL Query Params (推薦後者，利於分享連結)。
4.  **頁面實作 (Routing)**：
    *   `app/page.tsx`: 首頁。使用 `await supabase.from('fruits').select('*')` 抓取資料。
    *   `app/fruit/[slug]/page.tsx`: 詳情頁。實作 `generateStaticParams` 以達成全靜態化。

### Phase 3: 快取與 SEO 優化 (加速)
**目標**：設定 ISR 策略，確保 $0 成本運維。

1.  **設定 Revalidation**：
    *   在 `app/page.tsx` 加入 `export const revalidate = 3600;` (1小時更新)。
    *   在詳情頁同樣加入，或設為 `86400` (24小時)。
2.  **Metadata 設定**：
    *   利用 Next.js 的 `generateMetadata` 動態生成 `title` 和 `description`，讓分享到 Line/FB 時有漂亮的預覽卡片。

### Phase 4: 部署與上線 (發布)
**目標**：推向全球 CDN。

1.  **Push code to GitHub**。
2.  **Vercel 綁定**：
    *   在 Vercel Import Project -> 選擇 GitHub Repo。
    *   在 Settings -> Environment Variables 填入 Supabase 的 Key。
3.  **Deploy**：點擊部署，約 1 分鐘後上線。

---

## 4. 💰 成本與流量模型 (Cost Model)

**結論：只要不濫用圖片流量，此架構可承受每日數萬人訪問而無需付費。**

*   **Vercel (Free)**:
    *   **頻寬**: 100 GB/月。
    *   **策略**: 透過 ISR 技術，讓 Vercel CDN 擋在最前面，用戶其實是在下載靜態 HTML，消耗極低。
*   **Supabase (Free)**:
    *   **資料庫**: 500 MB。
    *   **策略**: 因為有 Vercel ISR 快取，Supabase 每小時只會被 Vercel 呼叫一次，不會被終端用戶海量點擊打爆。
*   **圖片策略**:
    *   **嚴禁**: 將大圖放在專案 `public` 資料夾或 Supabase Storage (流量貴)。
    *   **建議**: 使用外部圖床 (Imgur, Cloudinary) 或保持原本 Google Drive 連結，將流量成本轉嫁出去。

---

## 5. 💡 MVP 駭客的最後建議

1.  **漸進式遷移**：不用一次全部重寫。可以先開一個 Next.js 專案，先把首頁做出來，驗證泡泡圖在手機上的順暢度。
2.  **Mobile First**：你在做泡泡圖時，務必優先用手機測試。Recharts 在手機上的 Tooltip 體驗需要微調。
3.  **保持簡單**：Level 3 雖然強大，但不要過度設計。不要一開始就想做會員系統、登入系統。先讓「查詢水果」這件事快到極致。
