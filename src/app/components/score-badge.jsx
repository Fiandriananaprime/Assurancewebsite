import React from "react";
import { Badge } from "./ui/badge";

// Ranks:
// Bronze: >=50
// Argent (Silver): >=75
// Or (Gold): >=100
// Platine (Platinum): 110
export function ScoreBadge({ score }) {
  const numeric = Number(score) || 0;
  let label = "Bronze";
  let className = "bg-amber-100 text-amber-800 border-amber-200"; // bronze-ish

  if (numeric >= 110) {
    label = "Platine";
    className = "bg-indigo-100 text-indigo-800 border-indigo-200";
  } else if (numeric >= 100) {
    label = "Or";
    className = "bg-yellow-100 text-yellow-800 border-yellow-200";
  } else if (numeric >= 75) {
    label = "Argent";
    className = "bg-slate-100 text-slate-800 border-slate-200";
  } else if (numeric >= 50) {
    label = "Bronze";
    className = "bg-amber-100 text-amber-800 border-amber-200";
  } else {
    label = "Bronze";
    className = "bg-amber-50 text-amber-700 border-amber-100";
  }

  return (
    <Badge variant="outline" className={className}>
      {label} • {numeric}/100
    </Badge>
  );
}

export default ScoreBadge;
