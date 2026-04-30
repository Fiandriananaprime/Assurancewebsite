export function computeCreditScore({joinedAt, contracts = [], incidents = [], feedbacks = [], followsOnSocial = false}) {
  // Compute a credit score used in UI. Business rules:
  // - baseline 50
  // - +3 per year since signup
  // - +1 per month of contract length (approx)
  // - +1 if follows on social
  // - +1 per feedback/review
  // - -5 per incident
  // The internal score is clamped to [0, 110]. In the UI we show a denominator of 100
  // but the score may exceed 100 up to 110 (Platine).
  let score = 50; // baseline

  // +3 each year since inscription
  try {
    if (joinedAt) {
      const joined = new Date(joinedAt);
      const years = Math.max(0, new Date().getFullYear() - joined.getFullYear());
      score += 3 * years;
    }
  } catch (e) {}

  // +1 each month of contract across all contracts (approximate: 12 months per year)
  try {
    const months = contracts.reduce((sum, c) => {
      const start = c.startDate ? new Date(c.startDate) : (c.start_date ? new Date(c.start_date) : null);
      const end = c.endDate ? new Date(c.endDate) : (c.end_date ? new Date(c.end_date) : new Date());
      if (!start) return sum;
      const m = Math.max(0, (end.getFullYear() - start.getFullYear()) * 12 + (end.getMonth() - start.getMonth()));
      return sum + m;
    }, 0);
    score += months;
  } catch (e) {}

  // +1 if follows on social
  if (followsOnSocial) score += 1;

  // +1 per feedback/review
  if (Array.isArray(feedbacks)) score += feedbacks.length;

  // -15 per incident/sinistre
  if (Array.isArray(incidents)) score -= 15 * incidents.length;

  // clamp between 0 and 110
  if (score < 0) score = 0;
  if (score > 110) score = 110;

  return Math.round(score);
}
