'use client';

import React, { createContext, useContext, useEffect, useState } from 'react';

interface SettingsContextType {
  largeMode: boolean;
  setLargeMode: (value: boolean) => void;
}

const SettingsContext = createContext<SettingsContextType | undefined>(undefined);

export function SettingsProvider({ children }: { children: React.ReactNode }) {
  const [largeMode, setLargeMode] = useState(false);

  useEffect(() => {
    // Load from local storage
    if (typeof window !== 'undefined') {
      const saved = localStorage.getItem('fruit_app_large_mode');
      if (saved === 'true') {
        setLargeMode(true);
      }
    }
  }, []);

  useEffect(() => {
    // Apply to body class
    if (typeof document !== 'undefined') {
      if (largeMode) {
        document.body.classList.add('large-mode');
      } else {
        document.body.classList.remove('large-mode');
      }
      // Save to local storage
      localStorage.setItem('fruit_app_large_mode', String(largeMode));
    }
  }, [largeMode]);

  return (
    <SettingsContext.Provider value={{ largeMode, setLargeMode }}>
      {children}
    </SettingsContext.Provider>
  );
}

export function useSettings() {
  const context = useContext(SettingsContext);
  if (context === undefined) {
    throw new Error('useSettings must be used within a SettingsProvider');
  }
  return context;
}