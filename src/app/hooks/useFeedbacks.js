import { useEffect, useState } from 'react';
import { getAvatarLabel, resolveProfileImage } from '../auth';

const API_URL = import.meta.env.VITE_API_URL || '';

export function useFeedbacks({ clientId, page = 1, limit = 50 } = {}) {
  const [feedbacks, setFeedbacks] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    let mounted = true;
    async function fetchFeedbacks() {
      setLoading(true);
      setError(null);
      try {
        const token = localStorage.getItem('assurance-auth-token');
        const headers = { 'Content-Type': 'application/json' };
        if (token) headers['Authorization'] = `Bearer ${token}`;

        const q = new URLSearchParams();
        q.set('page', page);
        q.set('limit', limit);
        if (clientId) q.set('clientId', clientId);

        const resp = await fetch(`${API_URL}/api/feedbacks?${q.toString()}`, { headers });
        const body = await resp.json().catch(() => ({}));
        // normalize a few response shapes: successResponse(payload) or raw array
        let items = [];
        if (Array.isArray(body)) items = body;
        else if (body && body.data) {
          // could be { data: { ... } } or { data: array }
          if (Array.isArray(body.data)) items = body.data;
          else if (Array.isArray(body.data.feedbacks)) items = body.data.feedbacks;
          else if (Array.isArray(body.data.items)) items = body.data.items;
          else if (Array.isArray(body.data.rows)) items = body.data.rows;
          else items = body.data;
        } else if (Array.isArray(body.feedbacks)) items = body.feedbacks;
        else items = body;

        const normalizedItems = Array.isArray(items)
          ? items.map((item) => {
              const firstName = item.first_name || item.client?.firstName || '';
              const lastName = item.last_name || item.client?.lastName || '';
              const clientImage = resolveProfileImage(
                item.profile_image_url ||
                item.client?.profileImage ||
                item.client?.profile_image_url ||
                ''
              );

              return {
                ...item,
                clientId: item.clientId || item.client_id,
                name: item.name || item.client_name || `${firstName} ${lastName}`.trim() || item.client_email || 'Client',
                email: item.email || item.client_email || '',
                phone: item.phone || item.client?.phone || '',
                date: item.date || item.created_at || null,
                time: item.time || (item.created_at ? new Date(item.created_at).toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' }) : ''),
                replied: item.replied ?? item.is_responded ?? false,
                client: {
                  ...(item.client || {}),
                  id: item.client?.id || item.clientId || item.client_id,
                  firstName,
                  lastName,
                  email: item.email || item.client_email || '',
                  phone: item.phone || item.client?.phone || '',
                  profileImage: clientImage,
                  avatarLabel: getAvatarLabel({ first_name: firstName, last_name: lastName, email: item.email || item.client_email || '' }),
                },
              };
            })
          : [];

        if (mounted) setFeedbacks(normalizedItems);
      } catch (err) {
        console.error('useFeedbacks error', err);
        if (mounted) setError(err.message || 'Failed to load feedbacks');
      } finally {
        if (mounted) setLoading(false);
      }
    }

    fetchFeedbacks();
    return () => { mounted = false; };
  }, [clientId, page, limit]);

  return { feedbacks, loading, error };
}
