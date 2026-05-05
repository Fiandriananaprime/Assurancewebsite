import React, { useEffect, useState, useMemo, useRef } from 'react';
import { useNavigate } from 'react-router';
import { Card } from './ui/card';
import { Button } from './ui/button';
import { Loader2, MapPin, User } from 'lucide-react';

// Leaflet imports
import { MapContainer, TileLayer, Marker, CircleMarker, Popup, useMap } from 'react-leaflet';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

function haversineDistance(lat1, lon1, lat2, lon2) {
    const toRad = (v) => (v * Math.PI) / 180;
    const R = 6371; // km
    const dLat = toRad(lat2 - lat1);
    const dLon = toRad(lon2 - lon1);
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
      Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }
  
  // Import the agencies data from the JSON file
  import agenciesData from '../data/mama-agencies.json';

// Robust parsing of coordinate-like values: accepts numbers, numeric strings
// (commas allowed), or objects like { lat, lng } and returns a Number or NaN.
function parseCoord(raw) {
  if (raw == null) return NaN;
  if (typeof raw === 'number') return Number(raw);
  if (typeof raw === 'string') {
    const s = raw.trim().replace(/,/g, '.').replace(/[^0-9.+-eE]/g, '');
    if (s === '') return NaN;
    const v = parseFloat(s);
    return Number.isFinite(v) ? v : NaN;
  }
  if (typeof raw === 'object' && raw !== null) {
    if ('lat' in raw) return parseCoord(raw.lat);
    if ('lng' in raw) return parseCoord(raw.lng);
  }
  return NaN;
}

export default function ContactMapCard() {

  const [loading, setLoading] = useState(false);
  const [agencies, setAgencies] = useState([]); // Initialize as empty, will be populated by fetch or fallback
  const [error, setError] = useState(null);
  const [position, setPosition] = useState(null);
  const mapContainerRef = useRef(null);
  const gmapInstanceRef = useRef(null);
  const markersRef = useRef([]);

  useEffect(() => {
    let mounted = true;

    // no approximate geocoding: we will rely on DB-provided lat/lng

    async function fetchAgencies() {
      setLoading(true);
      setError(null);
      try {
        // try the API first
        const res = await fetch('/api/agencies');
        let data = null;
        if (res.ok) {
          data = await res.json();
        } else {
          // fallback to local JSON file bundled with the app
          const mod = await import('../data/mama-agencies.json');
          data = mod.default || mod;
        }

        // expect API or JSON to provide lat/lng
        const normalized = (Array.isArray(data) ? data : []).map((a, idx) => {
          const id = a.id || a.name || String(idx);
          const lat = a.lat ?? a.latitude ?? a.latlng?.lat ?? null;
          const lng = a.lng ?? a.longitude ?? a.latlng?.lng ?? null; // Ensure lat/lng are numbers
          return { ...a, id, lat, lng };
        });

        if (mounted) setAgencies(normalized.length ? normalized : agenciesData); // Use imported JSON as fallback
      } catch (err) {
        console.warn('Failed loading agencies, using static list', err);
        if (mounted) {
          setAgencies(agenciesData); // Use imported JSON as fallback
          setError('Impossible de charger la liste des agences, affichage local utilisé.');
        }
      } finally {
        if (mounted) setLoading(false);
      }
    }

    fetchAgencies();

    // Set initial agencies from local JSON if not already set by fetch
    if (agencies.length === 0 && agenciesData.length > 0) {
      setAgencies(agenciesData.map((a, idx) => ({ ...a, id: a.id || String(idx) })));
    }

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((pos) => {
        if (!mounted) return;
        setPosition({ lat: pos.coords.latitude, lng: pos.coords.longitude });
      }, (err) => {
        console.warn('Erreur de géolocalisation:', err);
        if (mounted) setError('Impossible d\'obtenir votre position. Les distances ne seront pas calculées.');
      }, { enableHighAccuracy: false, maximumAge: 1000 * 60 * 10 });
    }

    return () => { mounted = false; };
  }, []);

  // Google Maps loader and initialization
  // Leaflet helper: create larger custom icons for agencies
  // Use asset images for markers (assumes files exist in public/assets)
  const assetMarkerUrl = '/assets/localisation.png';
  const agencyIcon = new L.Icon({
    iconUrl: assetMarkerUrl,
    iconSize: [36, 48],
    iconAnchor: [18, 48],
    popupAnchor: [0, -44]
  });

  // user marker uses a distinct blue asset (created as assets/uarehere.svg)
  const userAssetUrl = '/assets/uarehere.png';
  const userIcon = new L.Icon({
    iconUrl: userAssetUrl,
    iconSize: [36, 48],
    iconAnchor: [18, 48],
    popupAnchor: [0, -44]
  });

  // Leaflet approach: nothing to dynamically load; map will be rendered in JSX below

  // no runtime Google Maps key handling — using Leaflet/OSM only

  // compute distances
  const withDistances = useMemo(() => agencies.map(a => {
    const lat = parseCoord(a.lat ?? a.latitude ?? a.latlng?.lat ?? a.latlng);
    const lng = parseCoord(a.lng ?? a.longitude ?? a.latlng?.lng ?? a.latlng);
    if (position && Number.isFinite(lat) && Number.isFinite(lng)) {
      const d = haversineDistance(position.lat, position.lng, lat, lng);
      return { ...a, distanceKm: d };
    }
    return { ...a, distanceKm: null };
  }).sort((x, y) => (x.distanceKm ?? Infinity) - (y.distanceKm ?? Infinity)), [agencies, position]);

  // mini-map box calculation
  // When position is available, center the map on the user and use a tighter span (zoom-in effect)
  const coords = agencies.map(a => ({ lat: parseCoord(a.lat ?? a.latitude ?? a.latlng?.lat ?? a.latlng), lng: parseCoord(a.lng ?? a.longitude ?? a.latlng?.lng ?? a.latlng) }));

  // default bounding box from agencies
  let minLat = Infinity, maxLat = -Infinity, minLng = Infinity, maxLng = -Infinity;
  coords.forEach(p => {
    if (!isFinite(p.lat) || !isFinite(p.lng)) return;
    if (p.lat < minLat) minLat = p.lat;
    if (p.lat > maxLat) maxLat = p.lat;
    if (p.lng < minLng) minLng = p.lng;
    if (p.lng > maxLng) maxLng = p.lng;
  });

  // If user position exists, create a box centered on the user with a small delta to zoom in.
  if (position && isFinite(position.lat) && isFinite(position.lng)) {
    const zoomDelta = 0.08; // smaller = more zoomed in. tweak to taste (in degrees)
    minLat = position.lat - zoomDelta;
    maxLat = position.lat + zoomDelta;
    minLng = position.lng - zoomDelta;
    maxLng = position.lng + zoomDelta;
  }

  // fallback if still invalid
  if (minLat === Infinity) { minLat = -90; maxLat = 90; minLng = -180; maxLng = 180; }

  // Use a responsive SVG viewBox with logical width 100 so the svg can be width:100%
  const mapSize = { width: 100, height: 360 };

  const project = (lat, lng) => {
    // normalize lat/lng into logical box (0..mapSize.width, 0..mapSize.height)
    const normX = ((lng - minLng) / (maxLng - minLng || 1));
    const normY = (1 - (lat - minLat) / (maxLat - minLat || 1)); // invert y
    const x = Math.max(0, Math.min(mapSize.width, normX * mapSize.width));
    const y = Math.max(0, Math.min(mapSize.height, normY * mapSize.height));
    return { x, y };
  };

  const navigate = useNavigate();

  return (
    <Card className="p-4 border-border">
      <div className="flex items-start justify-between gap-4">
        <div className="flex-1">
          <h3 className="text-lg font-semibold">Nos agences proches</h3>
          <p className="text-sm text-muted-foreground">Affichage en fonction de votre position (si autorisée).</p>
        </div>
        <div className="flex items-center gap-2">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => {
              // Store position in sessionStorage as a fallback so /agences can
              // read it even if router state is lost (page reloads, different router config, etc.)
              try {
                if (position) sessionStorage.setItem('user_position', JSON.stringify(position));
              } catch (e) {
                /* ignore sessionStorage errors */
              }

              // Pass current detected position via router state as primary mechanism
              navigate('/agences', { state: { position } });
            }}
          >
            Voir toutes
          </Button>
        </div>
      </div>

      <div className="mt-4 grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="rounded-lg overflow-hidden bg-gradient-to-b from-white to-accent/30 p-4 flex flex-col items-center justify-center">
          {loading ? (
            <div className="flex items-center gap-2 text-sm text-gray-500"><Loader2 className="h-5 w-5 animate-spin" /> Chargement...</div>
          ) : (
            <div className="w-full h-72 shadow-md rounded-md overflow-hidden">
              <MapContainer center={position ? [position.lat, position.lng] : [-18.8792, 47.5079]} zoom={position ? 12 : 6} style={{ height: '100%', width: '100%' }} whenCreated={(map) => { mapContainerRef.current = map; }}>
                <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors' />

                {agencies.map((a, i) => {
                  const lat = parseCoord(a.lat ?? a.latitude ?? a.latlng?.lat ?? a.latlng);
                  const lng = parseCoord(a.lng ?? a.longitude ?? a.latlng?.lng ?? a.latlng);
                  if (!isFinite(lat) || !isFinite(lng)) return null;
                  return (
                    <Marker key={a.id || i} position={[lat, lng]} icon={agencyIcon}>
                      <Popup>
                        <div style={{ fontWeight: 600 }}>{a.name}</div>
                        <div style={{ fontSize: 12 }}>{a.address || ''}</div>
                        <div style={{ marginTop: 6 }}><a href={`https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`} target="_blank" rel="noreferrer">Itinéraire</a></div>
                      </Popup>
                    </Marker>
                  );
                })}

                {position && isFinite(position.lat) && isFinite(position.lng) && (
                  <>
                    <CircleMarker center={[position.lat, position.lng]} radius={10} pathOptions={{ color: '#06b6d4', fillColor: '#06b6d4', fillOpacity: 0.25 }} />
                    <Marker position={[position.lat, position.lng]} icon={userIcon}>
                      <Popup>Vous</Popup>
                    </Marker>
                  </>
                )}

              </MapContainer>
            </div>
          )}
        </div>

        <div className="space-y-3">
          {error && <div className="text-xs text-red-600">{error}</div>}
          {withDistances.slice(0, 5).map((a) => (
            <div key={a.id} className="flex items-center justify-between gap-3 p-3 rounded-lg border border-border hover:shadow-sm transition-all">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-md bg-white flex items-center justify-center shadow-sm">
                  <MapPin className="w-5 h-5 text-red-500" />
                </div>
                <div>
                  <p className="font-semibold text-sm">{a.name}</p>
                  <p className="text-xs text-muted-foreground">{a.address || ''}</p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-sm font-bold">{a.distanceKm ? `${a.distanceKm.toFixed(1)} km` : '—'}</p>
                <div className="flex items-center gap-2 mt-1">
                  <Button variant="ghost" size="sm" onClick={() => window.open(`https://www.google.com/maps/dir/?api=1&destination=${a.lat},${a.lng}`, '_blank')}>Itinéraire</Button>
                  <a href={`tel:${a.phone}`} className="text-xs text-muted-foreground">{a.phone}</a>
                </div>
              </div>
            </div>
          ))}

          <div className="mt-2 text-xs text-muted-foreground">Si la géolocalisation ne fonctionne pas, autorisez-la dans votre navigateur ou saisissez votre position manuellement.</div>
        </div>
      </div>
    </Card>
  );
}
