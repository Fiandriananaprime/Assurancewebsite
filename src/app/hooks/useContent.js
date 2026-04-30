import { useEffect, useState } from 'react';

export function useContent() {
  const [blogs, setBlogs] = useState([]);
  const [events, setEvents] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [refreshKey, setRefreshKey] = useState(0);

  const refresh = () => setRefreshKey(prev => prev + 1);

  useEffect(() => {
    let mounted = true;
    async function load() {
      if (refreshKey === 0) setLoading(true); // Ne montrer le spinner que pour le premier chargement
      try {
        const fetchJsonSafe = async (url) => {
          try {
            const res = await fetch(url);
            const ct = res.headers.get('content-type') || '';

            // Read body once to avoid 'body stream already read' errors
            const text = await res.text();

            // if response is HTML (often indicates proxy/missing backend), return readable error
            if (ct.includes('text/html')) {
              throw new Error(`Expected JSON but received HTML from ${url}: ${text.slice(0, 200)}`);
            }

            // Try parse JSON if any
            let parsed;
            if (text && text.length > 0) {
              try {
                parsed = JSON.parse(text);
              } catch (e) {
                // invalid JSON
                parsed = text;
              }
            }

            if (!res.ok) {
              throw new Error(`Request failed ${url}: ${res.status} ${res.statusText} - ${JSON.stringify(parsed)}`);
            }

            return parsed;
          } catch (err) {
            return { error: err };
          }
        };

        const [bResRaw, eResRaw] = await Promise.all([
          fetchJsonSafe('/api/content/blog'),
          fetchJsonSafe('/api/content/events')
        ]);

        // Debug output to help trace why events might not appear
        console.debug('useContent: raw blog response:', bResRaw);
        console.debug('useContent: raw events response:', eResRaw);

        const normalize = (res, listKeyCandidates) => {
          if (!res) return [];
          // If the request failed
          if (res.error) throw res.error;
          // Common envelope: { success:true, message:'', data: { posts: [...] }, pagination: {} }
          if (res.data) {
            for (const key of listKeyCandidates) {
              if (res.data[key] && Array.isArray(res.data[key])) return res.data[key];
            }
            // maybe data itself is the array
            if (Array.isArray(res.data)) return res.data;
            // maybe data is already the result object with posts/events fields
            return res.data;
          }
          // Sometimes API returns { posts: [...] } directly
          for (const key of listKeyCandidates) {
            if (res[key] && Array.isArray(res[key])) return res[key];
          }
          // If the whole response is an array
          if (Array.isArray(res)) return res;
          // Otherwise return as-is (object)
          return res;
        };

        let bData = normalize(bResRaw, ['posts', 'blogs', 'items']);
        let eData = normalize(eResRaw, ['events', 'items']);

        // Ensure consistent shape for frontend: provide .image, .date, .description, .author
        const normalizeBlogsShape = (items) => (Array.isArray(items) ? items.map(i => ({
          ...i,
          image: i.image || i.image_url || (i.data && (i.data.image || i.data.image_url)) || '',
          date: i.date || i.event_date || i.published_at || i.created_at || '',
          author: i.author || i.author_name || (i.profile && `${i.profile.first_name || ''} ${i.profile.last_name || ''}`) || '',
          excerpt: i.excerpt || i.summary || i.description || '',
          views: i.views || 0,
          comments: i.comments || 0
        })) : []);

        const normalizeEventsShape = (items) => (Array.isArray(items) ? items.map(i => ({
          ...i,
          image: i.image || i.image_url || '',
          date: i.date || i.event_date || i.created_at || '',
          time: i.time || '',
          description: i.description || i.content || i.excerpt || '',
          organizer: i.organizer || i.author_name || '',
          attendees: i.attendees || 0
        })) : []);

        bData = normalizeBlogsShape(bData);
        eData = normalizeEventsShape(eData);

        if (mounted) {
          setBlogs(bData || []);
          setEvents(eData || []);
        }
      } catch (err) {
        if (mounted) setError(err);
      } finally {
        if (mounted) setLoading(false);
      }
    }

    load();
    return () => { mounted = false; };
  }, [refreshKey]);

  return { blogs, events, loading, error, refresh };
}
