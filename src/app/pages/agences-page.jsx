import React, { useEffect, useMemo, useState } from 'react';
import { useLocation } from 'react-router';
import {
  ArrowRight,
  Building2,
  Loader2,
  LocateFixed,
  MapPin,
  Navigation,
  Search,
  SlidersHorizontal,
  X,
} from 'lucide-react';
import { Header } from '../components/header';
import { Footer } from '../components/footer';
import { Badge } from '../components/ui/badge';
import { Button } from '../components/ui/button';
import { Card } from '../components/ui/card';
import { Input } from '../components/ui/input';
import agenciesData from '../data/mama-agencies.json';

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

function parseCoord(raw) {
  if (raw == null) return NaN;
  if (typeof raw === 'number') return Number(raw);
  if (typeof raw === 'string') {
    const s = raw.trim().replace(/,/g, '.').replace(/[^0-9.+-eE]/g, '');
    if (s === '') return NaN;
    return parseFloat(s);
  }
  if (typeof raw === 'object' && raw !== null) {
    if ('lat' in raw) return parseCoord(raw.lat);
    if ('lng' in raw) return parseCoord(raw.lng);
  }
  return NaN;
}

export function AgencesPage() {
  const [query, setQuery] = useState('');
  const [maxKm, setMaxKm] = useState(500);
  const [sortByDistance, setSortByDistance] = useState(false);
  const [geoError, setGeoError] = useState(null);
  const location = useLocation();

  // Try to read initial position synchronously from router state or sessionStorage
  const getInitialPosition = () => {
    try {
      if (location && location.state && location.state.position) return location.state.position;
      if (typeof sessionStorage !== 'undefined') {
        const raw = sessionStorage.getItem('user_position');
        if (raw) {
          const parsed = JSON.parse(raw);
          if (parsed && parsed.lat != null && parsed.lng != null) return parsed;
        }
      }
    } catch (e) {
      // ignore
    }
    return null;
  };

  const [position, setPosition] = useState(getInitialPosition);

  const limit = 10;


  const [agencies, setAgencies] = useState(() => {
    const local = Array.isArray(agenciesData) ? agenciesData.slice(0, limit) : [];
    return local.map((a, i) => normalizeAgency(a, i));
  });
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(false);
  const [fetchError, setFetchError] = useState(null);
  const [showAll, setShowAll] = useState(false);

  useEffect(() => {
    if (!navigator.geolocation) return;

    navigator.geolocation.getCurrentPosition(
      (p) => {
        setPosition({ lat: p.coords.latitude, lng: p.coords.longitude });
        setGeoError(null);
      },
      () => {
        setGeoError('Géolocalisation désactivée');
      },
      { enableHighAccuracy: false, maximumAge: 1000 * 60 * 10 }
    );
  }, []);

  // position is initialized synchronously above from location/state or sessionStorage

  useEffect(() => {
    let mounted = true; // Flag to prevent state updates on unmounted component
    setLoading(true);
    setFetchError(null);

    // Si la position est disponible ou si le tri par distance est activé,
    // nous devons récupérer TOUTES les agences pour calculer les distances et trier correctement.
    // Sinon, nous utilisons la pagination normale.
    const url = (position || sortByDistance) ? '/api/agencies?all=true' : `/api/agencies?page=${page}&limit=${limit}`;

    // Coordinate lookup from local JSON (indexed by name) to patch API data missing lat/lng
    const localCoordMap = new Map(
      (Array.isArray(agenciesData) ? agenciesData : []).map((a) => [
        (a.name || '').trim().toLowerCase(),
        { lat: a.lat ?? a.latitude ?? a.latlng?.lat, lng: a.lng ?? a.longitude ?? a.latlng?.lng },
      ])
    );

    const patchCoords = (a) => {
      const hasCoords = a.lat != null || a.latitude != null || a.latlng?.lat != null;
      if (hasCoords) return a;
      const local = localCoordMap.get((a.name || '').trim().toLowerCase());
      return local ? { ...a, lat: local.lat, lng: local.lng } : a;
    };

    fetch(url)
      .then((r) => r.json())
      .then((j) => {
        if (!mounted) return;

        if (j?.success) {
          const arr = Array.isArray(j.data) ? j.data : [];
          // Patch API records with local coords when the API doesn't provide them
          setAgencies(arr.map((a, i) => normalizeAgency(patchCoords(a), i)));
          setTotal(j.meta?.total ?? arr.length);
          setFetchError(null);
          return;
        }
        const local = Array.isArray(agenciesData) ? agenciesData : [];
        const normalizedLocal = local.map((a, i) => normalizeAgency(a, i));
        // Take all agencies when position or sortByDistance is active (needed to compute distances)
        const needAll = sortByDistance || !!position;
        setAgencies(needAll ? normalizedLocal : normalizedLocal.slice((page - 1) * limit, page * limit));
        setTotal(normalizedLocal.length);
        setFetchError('API returned empty or error response');
      })
      .catch((err) => {
        console.error('Failed to load agencies', err);
        const local = Array.isArray(agenciesData) ? agenciesData : [];
        const normalizedLocal = local.map((a, i) => normalizeAgency(a, i));
        const needAll = sortByDistance || !!position;
        setAgencies(needAll ? normalizedLocal : normalizedLocal.slice((page - 1) * limit, page * limit));
        setTotal(normalizedLocal.length);
        setFetchError(err.message || String(err));
      })
      .finally(() => {
        if (mounted) setLoading(false);
      });

    return () => {
      mounted = false;
    };
  }, [page, sortByDistance, position]); // Ajout de 'position' aux dépendances

  // Normalize agency records to ensure lat/lng are numeric values
  function normalizeAgency(a, idx) {
    const id = a.id ?? a.name ?? String(idx ?? '');
    // On ne pré-parse pas les coordonnées ici pour éviter de bloquer les fallbacks avec NaN
    return { ...a, id };
  }



  const enriched = useMemo(
    () =>
      agencies.map((agency) => {
        // Extraction robuste identique à contact-map-card
        const lat = parseCoord(agency.lat ?? agency.latitude ?? agency.latlng?.lat ?? agency.latlng);
        const lng = parseCoord(agency.lng ?? agency.longitude ?? agency.latlng?.lng ?? agency.latlng);
        
        let distance = null;
        if (position && Number.isFinite(lat) && Number.isFinite(lng)) {
          distance = haversineDistance(position.lat, position.lng, lat, lng);
        }
        return { ...agency, lat, lng, distance, distanceKm: distance };
      }),
    [agencies, position]
  );

  // removed debug logging

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();

    return enriched
      .filter((agency) => {
        const matchesSearch =
          !q ||
          agency.name?.toLowerCase().includes(q) ||
          agency.address?.toLowerCase().includes(q);
  const d = agency.distance ?? agency.distanceKm;
  const matchesDistance = !position || d == null || d <= maxKm;

        return matchesSearch && matchesDistance;
      })
      .sort((x, y) => {
        if (!sortByDistance) return 0;
  const dx = x.distance ?? x.distanceKm;
  const dy = y.distance ?? y.distanceKm;
  if (dx == null && dy == null) return 0;
  if (dx == null) return 1;
  if (dy == null) return -1;
  return dx - dy;
      });
  }, [enriched, maxKm, position, query, sortByDistance]);

  const listToRender = showAll ? enriched : filtered;

  const deduped = useMemo(() => {
    const map = new Map();

    for (const agency of listToRender) {
      const nameKey = (agency.name || '').toString().trim().toLowerCase();
      const coordKey = `${Number.isFinite(parseCoord(agency.lat)) ? parseCoord(agency.lat) : ''}_${Number.isFinite(parseCoord(agency.lng)) ? parseCoord(agency.lng) : ''}`;
      const key = nameKey || coordKey || agency.id || JSON.stringify(agency);
      const existing = map.get(key);

      if (!existing || (!existing.image_url && agency.image_url)) {
        map.set(key, agency);
      }
    }

    return Array.from(map.values());
  }, [listToRender]);

  const clientFilteringActive =
    query.trim() !== '' || sortByDistance || (position && maxKm !== 500) || showAll;

  useEffect(() => {
    setPage(1);
  }, [query, maxKm, showAll, position, sortByDistance]);

  const displayTotal = clientFilteringActive ? deduped.length : total;
  const pageCount = Math.max(1, Math.ceil(displayTotal / limit));
  const pageItems = clientFilteringActive ? deduped.slice((page - 1) * limit, page * limit) : deduped;
  const hasActiveFilters = query.trim() !== '' || maxKm !== 500 || showAll || sortByDistance;

  const clearFilters = () => {
    setQuery('');
    setMaxKm(500);
    setShowAll(false);
    setSortByDistance(false);
  };

  const askLocation = () => {
    if (!navigator.geolocation) {
      setGeoError('Géolocalisation non supportée');
      return;
    }

    navigator.geolocation.getCurrentPosition(
      (p) => {
        setPosition({ lat: p.coords.latitude, lng: p.coords.longitude });
        setSortByDistance(true);
        setGeoError(null);
      },
      () => setGeoError('Autorisation refusée')
    );
  };

  return (
    <div className="min-h-screen bg-[#f7faf8]">
      <Header />

      <main className="pt-20">
        <section className="border-b border-primary/10 bg-white">
          <div className="mx-auto grid max-w-7xl gap-8 px-4 py-10 sm:px-6 lg:grid-cols-[1.1fr_0.9fr] lg:px-8 lg:py-14">
            <div className="flex flex-col justify-center">
              <Badge className="mb-5 w-fit border-primary/15 bg-accent px-4 py-2 text-primary hover:bg-accent">
                Réseau Assurance MAMA
              </Badge>

              <h1 className="max-w-3xl text-4xl font-bold leading-tight tracking-normal text-foreground sm:text-5xl">
                Trouvez l'agence la plus pratique pour vous accompagner.
              </h1>

              <p className="mt-5 max-w-2xl text-base leading-7 text-muted-foreground sm:text-lg">
                Recherchez une agence, vérifiez sa distance et ouvrez directement l'itinéraire
                vers le point d'accueil MAMA le plus adapté.
              </p>

              <div className="mt-7 flex flex-wrap gap-3">
                <Button className="h-11 px-5" onClick={askLocation}>
                  <LocateFixed className="h-4 w-4" />
                  Me localiser
                </Button>
                <Button
                  variant="outline"
                  className="h-11 px-5"
                  onClick={() => setSortByDistance((value) => !value)}
                >
                  <Navigation className="h-4 w-4" />
                  {sortByDistance ? 'Tri le plus proche' : 'Trier par distance'}
                </Button>
              </div>
            </div>

            <div className="grid content-end gap-4 sm:grid-cols-3 lg:grid-cols-1">
              <Card className="border-primary/10 bg-primary p-6 text-primary-foreground shadow-xl shadow-primary/10">
                <div className="flex items-center justify-between gap-4">
                  <div>
                    <p className="text-sm text-primary-foreground/75">Agences disponibles</p>
                    <p className="mt-2 text-4xl font-bold">{displayTotal || total || agencies.length}</p>
                  </div>
                  <div className="flex h-14 w-14 items-center justify-center rounded-md bg-white/15">
                    <Building2 className="h-7 w-7" />
                  </div>
                </div>
              </Card>

              <Card className="border-primary/10 bg-white p-5 shadow-sm sm:col-span-2 lg:col-span-1">
                <div className="grid gap-4 sm:grid-cols-2">
                  <div>
                    <p className="text-sm text-muted-foreground">Mode d'affichage</p>
                    <p className="mt-1 font-semibold">{showAll ? 'Toutes les données' : 'Filtres actifs'}</p>
                  </div>
                  <div>
                    <p className="text-sm text-muted-foreground">Position</p>
                      <p className="mt-1 font-semibold">
                      {position && Number.isFinite(parseCoord(position.lat)) && Number.isFinite(parseCoord(position.lng)) ? `${parseCoord(position.lat).toFixed(4)}, ${parseCoord(position.lng).toFixed(4)}` : 'Non renseignée'}
                    </p>
                  </div>
                </div>
              </Card>
            </div>
          </div>
        </section>

        <section className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
          <Card className="border-primary/10 bg-white p-4 shadow-sm">
            <div className="grid gap-4 lg:grid-cols-[1fr_auto] lg:items-center">
              <div className="relative">
                <Search className="pointer-events-none absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                <Input
                  className="h-12 rounded-md border-border bg-secondary/60 pl-11 pr-4"
                  placeholder="Rechercher une agence ou une adresse..."
                  value={query}
                  onChange={(event) => setQuery(event.target.value)}
                />
              </div>

              <div className="flex flex-wrap items-center gap-2">
                <Button
                  variant={sortByDistance ? 'default' : 'outline'}
                  className="h-10"
                  onClick={() => setSortByDistance((value) => !value)}
                >
                  <SlidersHorizontal className="h-4 w-4" />
                  Distance
                </Button>

                <Button
                  variant={showAll ? 'default' : 'outline'}
                  className="h-10"
                  onClick={() => setShowAll((value) => !value)}
                >
                  <Building2 className="h-4 w-4" />
                  {showAll ? 'Vue brute' : 'Afficher tout'}
                </Button>

                <Button
                  variant="ghost"
                  className="h-10"
                  disabled={!hasActiveFilters}
                  onClick={clearFilters}
                >
                  <X className="h-4 w-4" />
                  Effacer
                </Button>
              </div>
            </div>

            {(geoError || fetchError || loading) && (
              <div className="mt-4 flex flex-wrap items-center gap-3 text-sm">
                {loading && (
                  <span className="inline-flex items-center gap-2 text-muted-foreground">
                    <Loader2 className="h-4 w-4 animate-spin" />
                    Chargement des agences...
                  </span>
                )}
                {geoError && <span className="text-destructive">{geoError}</span>}
                {fetchError && (
                  <span className="text-muted-foreground">
                    Données locales utilisées pendant l'indisponibilité de l'API.
                  </span>
                )}
              </div>
            )}
          </Card>

          <div className="mt-6 grid grid-cols-1 gap-5 lg:grid-cols-2">
            {pageItems.length === 0 ? (
              <Card className="border-dashed border-primary/20 bg-white p-10 text-center lg:col-span-2">
                <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-md bg-accent">
                  <MapPin className="h-7 w-7 text-primary" />
                </div>
                <h2 className="mt-5 text-xl font-semibold">Aucune agence trouvée</h2>
                <p className="mx-auto mt-2 max-w-md text-sm text-muted-foreground">
                  Essayez une autre recherche ou affichez toutes les agences disponibles.
                </p>
                <Button className="mt-5" onClick={() => setShowAll(true)}>
                  Afficher tout
                </Button>
              </Card>
            ) : (
              pageItems.map((agency, index) => {
                // On utilise les valeurs déjà calculées dans enriched
                const hasCoordinates = Number.isFinite(agency.lat) && Number.isFinite(agency.lng);

                return (
                  <Card
                    key={agency.id || `${agency.name}-${index}`}
                    className="group overflow-hidden border-primary/10 bg-white p-0 shadow-sm transition-all hover:-translate-y-1 hover:shadow-xl hover:shadow-primary/10"
                  >
                    <div className="grid min-h-[260px] sm:grid-cols-[190px_1fr]">
                      <div className="relative min-h-[190px] overflow-hidden bg-accent sm:min-h-full">
                        {agency.image_url ? (
                          <img
                            src={agency.image_url}
                            alt={agency.name}
                            className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
                          />
                        ) : (
                          <div className="flex h-full w-full items-center justify-center bg-accent">
                            <MapPin className="h-10 w-10 text-primary" />
                          </div>
                        )}
                        <div className="absolute left-3 top-3 rounded-md bg-white/95 px-3 py-1 text-xs font-medium text-primary shadow-sm">
                          Agence MAMA
                        </div>
                      </div>

                      <div className="flex min-w-0 flex-col justify-between p-5">
                        <div>
                          <div className="flex items-start justify-between gap-4">
                            <div className="min-w-0">
                              <h2 className="line-clamp-2 text-xl font-semibold leading-snug text-foreground">
                                {agency.name}
                              </h2>
                              <p className="mt-3 flex gap-2 text-sm leading-6 text-muted-foreground">
                                <MapPin className="mt-1 h-4 w-4 flex-none text-primary" />
                                <span>{agency.address || 'Adresse non renseignée'}</span>
                              </p>
                            </div>

                            <div className="flex-none rounded-md border border-primary/15 bg-accent px-3 py-2 text-center min-w-[80px]">
                              <p className="text-[10px] uppercase tracking-wider text-muted-foreground font-bold mb-0.5">Distance</p>
                              <p className="text-sm font-bold text-primary">
                                {agency.distanceKm != null ? `${agency.distanceKm.toFixed(1)} km` : '—'}
                              </p>
                            </div>
                          </div>
                        </div>

                        <div className="mt-5 flex items-center justify-between gap-3 border-t border-border pt-4">
                          <div className="flex items-center gap-2">
                            {hasCoordinates ? (
                              <Badge variant="outline" className="h-5 text-[10px] bg-emerald-50 text-emerald-700 border-emerald-200">Prêt pour GPS</Badge>
                            ) : (
                              <Badge variant="outline" className="h-5 text-[10px] bg-amber-50 text-amber-700 border-amber-200">Infos limitées</Badge>
                            )}
                          </div>

                            <Button
                              size="sm"
                              disabled={!hasCoordinates}
                              onClick={() =>
                                window.open(
                                  `https://www.google.com/maps/dir/?api=1&destination=${agency.lat},${agency.lng}`,
                                  '_blank'
                                )
                              }
                            >
                              Itinéraire
                              <ArrowRight className="h-4 w-4" />
                            </Button>
                        </div>
                      </div>
                    </div>
                  </Card>
                );
              })
            )}
          </div>

          <div className="mt-8 flex flex-col items-center justify-between gap-4 rounded-md border border-primary/10 bg-white px-4 py-4 sm:flex-row">
            <p className="text-sm text-muted-foreground">
              Page <span className="font-medium text-foreground">{page}</span> sur{' '}
              <span className="font-medium text-foreground">{pageCount}</span>
            </p>

            <div className="flex items-center gap-2">
              <Button
                size="sm"
                variant="outline"
                disabled={page <= 1}
                onClick={() => setPage((value) => Math.max(1, value - 1))}
              >
                Précédent
              </Button>
              <Button
                size="sm"
                variant="outline"
                disabled={page >= pageCount}
                onClick={() => setPage((value) => Math.min(pageCount, value + 1))}
              >
                Suivant
              </Button>
            </div>
          </div>
        </section>
      </main>

      <Footer />
    </div>
  );
}

export default AgencesPage;