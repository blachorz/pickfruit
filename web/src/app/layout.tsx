import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { SettingsProvider } from "@/context/SettingsContext";
import GlobalFABs from "@/components/GlobalFABs";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "水果呷對時 🍎",
  description: "跟著季節吃，最對味",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="zh-TW">
      <body className={inter.className}>
        <SettingsProvider>
          {children}
          <GlobalFABs />
        </SettingsProvider>
      </body>
    </html>
  );
}
