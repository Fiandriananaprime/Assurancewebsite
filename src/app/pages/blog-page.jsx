import { useEffect, useMemo, useState } from "react";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Badge } from "../components/ui/badge";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "../components/ui/dialog";
import { Newspaper, CalendarDays, ArrowRight, MapPin, Clock3, Sparkles, BellRing } from "lucide-react";
import { motion } from "motion/react";
import { ImageWithFallback } from "../components/figma/ImageWithFallback";
import { getBlogMonthLabel } from "../blog-data";
import { useContent } from "../hooks/useContent";

function getTypeLabel(type) {
  return type === "event" ? "Evenement" : "Blog";
}

export function BlogPage() {
  const { blogs, events, loading } = useContent();
  const [entries, setEntries] = useState([]);
  const [fetchInfo, setFetchInfo] = useState({});
  const [selectedType, setSelectedType] = useState("all");
  const [selectedEntry, setSelectedEntry] = useState(null);

  useEffect(() => {
    // Combine blogs and events from API and normalize to expected client shape
    const normalized = [];
    blogs && blogs.posts && Array.isArray(blogs.posts) ? blogs.posts.forEach(p => normalized.push({
      ...p,
      type: 'blog',
      image: p.image_url || p.image,
      date: p.created_at || p.created_at || p.date,
      readTime: p.read_time || p.readTime,
      location: p.location || ''
    })) : (Array.isArray(blogs) ? blogs.forEach(p => normalized.push({ ...p, type: 'blog', image: p.image_url || p.image })) : []);

    if (events && events.events && Array.isArray(events.events)) {
      events.events.forEach(ev => normalized.push({
        ...ev,
        type: 'event',
        image: ev.image_url || ev.image,
        date: ev.event_date || ev.date,
        readTime: ev.read_time || ev.readTime,
        location: ev.location || ''
      }));
    } else if (Array.isArray(events)) {
      events.forEach(ev => normalized.push({ ...ev, type: 'event', image: ev.image_url || ev.image }));
    }

    // sort by date desc
    normalized.sort((a, b) => new Date(b.date) - new Date(a.date));
    setEntries(normalized.filter(Boolean));
    setFetchInfo({ blogsCount: (blogs && (blogs.posts ? blogs.posts.length : (Array.isArray(blogs) ? blogs.length : 0))) || 0, eventsCount: (events && (events.events ? events.events.length : (Array.isArray(events) ? events.length : 0))) || 0 });
  }, [blogs, events]);

  const filteredEntries = useMemo(() => {
    if (selectedType === "all") {
      return entries;
    }

    return entries.filter((entry) => entry.type === selectedType);
  }, [entries, selectedType]);

  const featuredEntry = filteredEntries[0] || entries[0];
  const recentEntries = (featuredEntry ? filteredEntries.filter((entry) => entry.id !== featuredEntry.id) : filteredEntries);

  return (
    <div className="min-h-screen bg-[#f6f8f3] text-slate-900">
      <Header />

      <section className="relative overflow-hidden border-b border-emerald-100 bg-[radial-gradient(circle_at_top,_rgba(22,163,74,0.14),_transparent_45%),linear-gradient(180deg,_#f8fbf6_0%,_#f6f8f3_100%)] pt-28 pb-16 sm:pt-36 sm:pb-20">
        <div className="absolute inset-0 opacity-70">
          <div className="absolute left-8 top-10 h-40 w-40 rounded-full bg-emerald-200/40 blur-3xl" />
          <div className="absolute right-12 top-4 h-56 w-56 rounded-full bg-lime-100/70 blur-3xl" />
        </div>

        <div className="relative mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: 18 }} animate={{ opacity: 1, y: 0 }} className="max-w-4xl">
            <div className="mb-5 inline-flex items-center gap-2 rounded-full border border-emerald-200 bg-white/80 px-4 py-2 text-sm font-medium text-emerald-700 shadow-sm backdrop-blur">
              <Newspaper className="h-4 w-4" />
              Blog & Evenements
            </div>
            <h1 className="max-w-3xl text-4xl font-semibold tracking-tight text-slate-950 sm:text-5xl">Blog & Evenements</h1>
            <p className="mt-5 max-w-2xl text-lg leading-8 text-slate-600">
              Suivez les temps forts de MAMA, les ouvertures d'agence, les rencontres terrain et les contenus utiles publies par nos equipes.
            </p>
            <div className="mt-8 flex flex-wrap gap-3">
              <Button className="bg-emerald-700 text-white hover:bg-emerald-800" onClick={() => setSelectedType("all")}>Voir tout</Button>
              <Button variant="outline" className="border-emerald-200 bg-white/80" onClick={() => setSelectedType("event")}>Evenements</Button>
              <Button variant="outline" className="border-emerald-200 bg-white/80" onClick={() => setSelectedType("blog")}>Articles</Button>
            </div>
          </motion.div>
        </div>
      </section>

      <section className="pb-20 pt-10 sm:pt-14">
        <div className="mx-auto grid max-w-7xl gap-10 px-4 sm:px-6 lg:grid-cols-[minmax(0,1fr)_320px] lg:px-8">
          <div className="space-y-8">
            {featuredEntry && (
              <motion.article initial={{ opacity: 0, y: 18 }} animate={{ opacity: 1, y: 0 }} className="overflow-hidden rounded-[28px] border border-emerald-100 bg-white shadow-[0_25px_60px_-35px_rgba(15,23,42,0.35)]">
                <div className="grid gap-0 lg:grid-cols-[260px_minmax(0,1fr)]">
                  <div className="relative min-h-[260px] overflow-hidden">
                    <ImageWithFallback src={featuredEntry.image} alt={featuredEntry.title} className="h-full w-full object-cover" />
                    <div className="absolute left-4 top-4 rounded-2xl bg-emerald-700 px-4 py-3 text-white shadow-lg">
                      <p className="text-xs uppercase tracking-[0.2em] text-emerald-100">{getBlogMonthLabel(featuredEntry.date)}</p>
                    </div>
                  </div>
                  <div className="flex flex-col justify-between p-6 sm:p-8">
                    <div>
                      <div className="mb-4 flex flex-wrap items-center gap-3">
                        <Badge className="bg-emerald-50 text-emerald-700 hover:bg-emerald-50">{getTypeLabel(featuredEntry.type)}</Badge>
                        <span className="text-sm text-slate-500">{featuredEntry.category}</span>
                        <span className="text-sm text-slate-400">{new Date(featuredEntry.date).toLocaleDateString("fr-FR")}</span>
                      </div>
                      <h2 className="max-w-2xl text-3xl font-semibold tracking-tight text-slate-950">{featuredEntry.title}</h2>
                      <p className="mt-4 max-w-2xl text-base leading-7 text-slate-600">{featuredEntry.excerpt}</p>
                    </div>
                    <div className="mt-8 flex flex-wrap items-center justify-between gap-4">
                      <div className="flex flex-wrap items-center gap-4 text-sm text-slate-500">
                        <span className="inline-flex items-center gap-2"><Clock3 className="h-4 w-4 text-emerald-700" />{featuredEntry.readTime}</span>
                        <span className="inline-flex items-center gap-2"><MapPin className="h-4 w-4 text-emerald-700" />{featuredEntry.location}</span>
                      </div>
                      <Button className="bg-emerald-700 text-white hover:bg-emerald-800" onClick={() => setSelectedEntry(featuredEntry)}>
                        {featuredEntry.ctaLabel}
                        <ArrowRight className="ml-2 h-4 w-4" />
                      </Button>
                    </div>
                  </div>
                </div>
              </motion.article>
            )}

            <div className="space-y-5">
              <div className="flex items-center justify-between">
                <h2 className="text-2xl font-semibold tracking-tight text-slate-950">Evenements recents</h2>
                <div className="flex gap-2 rounded-full border border-emerald-100 bg-white p-1 shadow-sm">
                  {[
                    { key: "all", label: "Tout" },
                    { key: "event", label: "Evenements" },
                    { key: "blog", label: "Articles" },
                  ].map((filter) => (
                    <button
                      key={filter.key}
                      type="button"
                      onClick={() => setSelectedType(filter.key)}
                      className={`rounded-full px-4 py-2 text-sm transition ${selectedType === filter.key ? "bg-emerald-700 text-white" : "text-slate-600 hover:bg-emerald-50"}`}
                    >
                      {filter.label}
                    </button>
                  ))}
                </div>
              </div>

              <div className="space-y-4">
                {recentEntries.map((entry, index) => (
                  <motion.article key={entry.id} initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: index * 0.05 }} className="grid gap-0 overflow-hidden rounded-[26px] border border-emerald-100 bg-white shadow-[0_20px_40px_-30px_rgba(15,23,42,0.45)] md:grid-cols-[180px_minmax(0,1fr)]">
                    <div className="h-full min-h-[170px] overflow-hidden bg-emerald-100/60">
                      <ImageWithFallback src={entry.image} alt={entry.title} className="h-full w-full object-cover" />
                    </div>
                    <div className="relative p-6">
                      <div className="absolute inset-y-0 right-0 hidden w-40 bg-gradient-to-l from-emerald-50/80 to-transparent md:block" />
                      <div className="relative">
                        <p className="mb-3 text-sm font-medium text-emerald-700">{getBlogMonthLabel(entry.date)}</p>
                        <h3 className="max-w-2xl text-3xl font-medium tracking-tight text-slate-950">{entry.title}</h3>
                        <p className="mt-3 max-w-2xl text-base leading-7 text-slate-600">{entry.excerpt}</p>
                        <div className="mt-6 flex flex-wrap items-center gap-3">
                          <Badge variant="outline" className="border-emerald-200 text-emerald-700">{getTypeLabel(entry.type)}</Badge>
                          <Badge variant="outline" className="border-slate-200 text-slate-600">{entry.category}</Badge>
                        </div>
                        <div className="mt-6 flex flex-wrap items-center gap-4">
                          <Button className="bg-emerald-700 text-white hover:bg-emerald-800" onClick={() => setSelectedEntry(entry)}>
                            {entry.ctaLabel}
                          </Button>
                          <span className="inline-flex items-center gap-2 text-sm text-slate-500"><CalendarDays className="h-4 w-4 text-emerald-700" />{new Date(entry.date).toLocaleDateString("fr-FR")}</span>
                        </div>
                      </div>
                    </div>
                  </motion.article>
                ))}
              </div>
            </div>
          </div>

          <aside className="space-y-5">
            <div className="rounded-[28px] border border-emerald-100 bg-white p-6 shadow-[0_20px_40px_-30px_rgba(15,23,42,0.45)]">
              <p className="text-sm font-medium uppercase tracking-[0.25em] text-emerald-700">Navigation</p>
              <div className="mt-5 space-y-3">
                {[
                  { label: "Tout le contenu", value: "all" },
                  { label: "Evenements MAMA", value: "event" },
                  { label: "Articles et actus", value: "blog" },
                ].map((item) => (
                  <button key={item.value} type="button" onClick={() => setSelectedType(item.value)} className={`flex w-full items-center justify-between rounded-2xl px-4 py-3 text-left transition ${selectedType === item.value ? "bg-emerald-700 text-white" : "bg-slate-50 text-slate-700 hover:bg-emerald-50"}`}>
                    <span className="font-medium">{item.label}</span>
                    <ArrowRight className="h-4 w-4" />
                  </button>
                ))}
              </div>
            </div>

            <div className="rounded-[28px] border border-emerald-100 bg-[linear-gradient(180deg,#0f5f34_0%,#0a3d25_100%)] p-6 text-white shadow-[0_20px_40px_-30px_rgba(15,23,42,0.55)]">
              <div className="inline-flex h-12 w-12 items-center justify-center rounded-2xl bg-white/10">
                <BellRing className="h-6 w-6" />
              </div>
              <h3 className="mt-5 text-2xl font-semibold">Besoin d'aide ?</h3>
              <p className="mt-3 text-sm leading-7 text-emerald-50/85">Notre equipe vous accompagne pour toute question sur les evenements, vos contrats ou l'actualite MAMA.</p>
              <Button className="mt-6 w-full bg-white text-emerald-800 hover:bg-emerald-50">Contactez-nous</Button>
            </div>

            <div className="rounded-[28px] border border-emerald-100 bg-white p-6 shadow-[0_20px_40px_-30px_rgba(15,23,42,0.45)]">
              <div className="inline-flex items-center gap-2 text-sm font-medium text-emerald-700">
                <Sparkles className="h-4 w-4" />
                Visible aussi depuis l'espace employe
              </div>
              <p className="mt-3 text-sm leading-7 text-slate-600">Les publications presentes ici proviennent de l'espace de gestion employe. Toute nouvelle publication diffusee y apparait ici automatiquement.</p>
            </div>
          </aside>
        </div>
      </section>

      <Dialog open={Boolean(selectedEntry)} onOpenChange={(open) => !open && setSelectedEntry(null)}>
        <DialogContent className="max-w-3xl overflow-hidden border border-emerald-100 p-0">
          {selectedEntry && (
            <div className="grid gap-0 md:grid-cols-[260px_minmax(0,1fr)]">
              <div className="min-h-[240px] overflow-hidden bg-emerald-100">
                <ImageWithFallback src={selectedEntry.image} alt={selectedEntry.title} className="h-full w-full object-cover" />
              </div>
              <div className="p-6">
                <DialogHeader>
                  <DialogTitle className="text-2xl font-semibold text-slate-950">{selectedEntry.title}</DialogTitle>
                  <DialogDescription className="pt-2 text-base leading-7 text-slate-600">{selectedEntry.excerpt}</DialogDescription>
                </DialogHeader>
                <div className="mt-5 flex flex-wrap gap-2">
                  <Badge className="bg-emerald-50 text-emerald-700 hover:bg-emerald-50">{getTypeLabel(selectedEntry.type)}</Badge>
                  <Badge variant="outline">{selectedEntry.category}</Badge>
                  <Badge variant="outline">{selectedEntry.location}</Badge>
                </div>
                <p className="mt-5 text-sm leading-7 text-slate-700">{selectedEntry.content}</p>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>

      <Footer />
    </div>
  );
}
