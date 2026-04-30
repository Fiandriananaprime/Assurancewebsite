"use client";

import { useEffect } from "react";

export default function useGlobalEvents() {
  useEffect(() => {
    function handleContractCreated(e) {
      const detail = e?.detail || {};
      // Re-dispatch a more specific event pages can listen to
      window.dispatchEvent(new CustomEvent("contracts:refresh", { detail }));
    }

    window.addEventListener("contract_created", handleContractCreated);
    return () => window.removeEventListener("contract_created", handleContractCreated);
  }, []);

  return null;
}
