"use client";

import React, { useEffect, useState } from "react";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription, DialogFooter } from "./ui/dialog";
import { Button } from "./ui/button";

export default function GlobalDialog() {
  const [open, setOpen] = useState(false);
  const [payload, setPayload] = useState({ title: "", description: "", actions: [] });

  useEffect(() => {
    function handleShow(e) {
      const d = e?.detail || {};
      // Ensure actions is an array
      d.actions = Array.isArray(d.actions) ? d.actions : [];
      setPayload({ title: d.title || "", description: d.description || "", actions: d.actions });
      setOpen(true);
    }

    window.addEventListener("show_dialog", handleShow);
    return () => window.removeEventListener("show_dialog", handleShow);
  }, []);

  return (
    <Dialog open={open} onOpenChange={(val) => setOpen(val)}>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>{payload.title}</DialogTitle>
          <DialogDescription>{payload.description}</DialogDescription>
        </DialogHeader>

        <DialogFooter>
          <div className="flex gap-2">
            {payload.actions && payload.actions.length > 0 ? (
              payload.actions.map((a, idx) => (
                <Button
                  key={idx}
                  onClick={() => {
                    try {
                      if (typeof a.action === "function") a.action();
                    } catch (err) {
                      console.error("Dialog action failed", err);
                    }
                    setOpen(false);
                  }}
                >
                  {a.label || `Action ${idx + 1}`}
                </Button>
              ))
            ) : (
              <Button onClick={() => setOpen(false)}>Fermer</Button>
            )}
          </div>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
