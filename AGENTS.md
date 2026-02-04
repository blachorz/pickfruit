# AGENTS.md - Developer Guide for Fruit App (水果呷對時)

Welcome! This guide provides essential information for AI agents and developers working on the "Fruit App" migration project. This is a Next.js 14 port of a legacy Google Apps Script application, designed for SEO, performance, and $0 maintenance.

---

## 🛠 Commands

Execute all commands from the `/web` directory unless otherwise specified.

| Task | Command | Purpose |
| :--- | :--- | :--- |
| **Development** | `npm run dev` | Starts the local dev server at `http://localhost:3000`. |
| **Build** | `npm run build` | Compiles the production application. |
| **Lint** | `npm run lint` | Runs Next.js ESLint configuration. |
| **Type Check** | `npx tsc --noEmit` | Validates TypeScript types without emitting files. |
| **Database ETL** | `node database/scripts/tsv-to-sql.js` | (Root) Converts TSV source data to SQL seed files. |

**Testing:** There are currently no automated tests. Verification is performed manually via `npm run dev` and `npm run build`.

---

## 🏗 Technology Stack

- **Framework:** Next.js 14 (App Router)
- **Language:** TypeScript
- **Database:** Supabase (PostgreSQL)
- **Styling:** Tailwind CSS + `clsx` + `tailwind-merge`
- **Components:** shadcn/ui (Radix UI)
- **Icons:** Lucide React
- **Charts:** Recharts (Bubble Chart implementation)
- **State:** React Context (`SettingsContext`) for persistent UI preferences.

---

## 🎨 Code Style & Guidelines

### 1. Naming Conventions
- **Components:** `PascalCase` (e.g., `FruitChart.tsx`).
- **Hooks/Utilities:** `camelCase` (e.g., `useSettings.ts`, `supabase.ts`).
- **Constants:** `UPPER_SNAKE_CASE` (e.g., `FEEDBACK_OPTIONS`).
- **Database Tables:** `snake_case` (e.g., `fruit_metadata`).

### 2. Imports & Path Aliases
Always use the `@/` path alias for imports within the `src` directory.
**Standard Import Order:**
1. React/Next.js core
2. Third-party libraries (Supabase, Lucide, Recharts)
3. Shared state/Context/Hooks
4. UI Components (`@/components/ui/...`)
5. Business Components (`@/components/...`)
6. Utils/Types/Constants

### 3. Component Architecture
- **Client Components:** Use `'use client'` at the top for state, effects, or browser APIs.
- **Server Components:** Prefer for initial data fetching (e.g., in `app/page.tsx`).
- **Class Merging:** Use the `cn()` utility from `@/lib/utils` for conditional Tailwind classes.

### 4. TypeScript Usage
- **Strict Typing:** Avoid `any`. Use the types defined in `@/utils/supabase.ts`.
- **Database Types:** Use `supabase.from<Database>('table')` for type-safe queries.
- **Interfaces:** Prefer `type` for data structures and `interface` for component props.

### 5. Error Handling & Loading
- Wrap async operations (Supabase calls) in `try/catch`.
- Use local state (`isLoading`, `error`) to handle UI feedback during mutations.
- Use `Loader2` from `lucide-react` for spinners.

---

## 👵 Special Feature: Elder Mode (長輩模式)

The app prioritizes accessibility for elderly users via a "Large Font" toggle.
- **Implementation:** `SettingsContext` provides `largeMode` state, persisted in `localStorage`.
- **CSS:** Conditional classes and `body.large-mode` selectors in `globals.css` handle scaling.
- **Guideline:** Avoid hardcoded heights (e.g., `h-10`) on containers holding text; use `min-h` or padding to ensure content doesn't clip when fonts enlarge.

---

## 📁 Project Structure

```text
/
├── db/                 # SQL schemas and seed files
├── database/           # Source TSV data and ETL scripts
├── legacy/             # Original GAS/HTML reference files
└── web/                # Next.js Application
    ├── public/         # Static assets (images, fonts)
    └── src/
        ├── app/        # Pages and Route Handlers
        ├── components/ # Reusable UI components
        ├── context/    # Global State (SettingsContext)
        ├── lib/        # Shared library config (shadcn utils)
        ├── utils/      # Supabase client and TypeScript definitions
        └── styles/     # global.css
```

## 📉 Fruit Chart Visualization

The central feature is a bubble chart (`FruitChart.tsx`) that visualizes fruits across different dimensions:
- **Jittering:** Coordinates use a hash-based jitter to prevent overlap of identical data points.
- **Modes:** Modes like `daily`, `sugar`, and `tcm` dynamically change bubble colors and tooltips based on fruit properties.
- **Responsive:** The chart uses `ResponsiveContainer` from Recharts.

## 📝 Key Files for Reference
- **Main Logic:** `web/src/components/FruitChart.tsx`
- **Data Types:** `web/src/utils/supabase.ts`
- **Global Styles:** `web/src/app/globals.css`
- **SQL Schema:** `db/schema.sql`

---
*Note: This file is intended for AI agents to understand the project's pulse. Follow existing patterns found in the components mentioned above.*
