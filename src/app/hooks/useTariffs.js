import { useEffect, useState } from 'react';

export default function useTariffs() {
  const [data, setData] = useState({ puissance: [], age: [], kilometrage: [], cylindree: [], superficie: [], mobilier: [], clients: [] });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let mounted = true;
    async function load() {
      setLoading(true);
      try {
        const [tRes, cRes] = await Promise.all([
          fetch('/api/meta/tarifs'),
          fetch('/api/meta/clients')
        ]);
        if (!tRes.ok) throw new Error('Failed to load tariffs');
        if (!cRes.ok) throw new Error('Failed to load clients');
        const t = await tRes.json();
        const c = await cRes.json();
        if (!mounted) return;
        setData({ ...t, clients: c.clients || [] });
      } catch (err) {
        console.error('useTariffs error', err);
        if (mounted) setError(err.message || 'Unknown error');
      } finally {
        if (mounted) setLoading(false);
      }
    }
    load();
    return () => { mounted = false; };
  }, []);

  return { data, loading, error };
}
