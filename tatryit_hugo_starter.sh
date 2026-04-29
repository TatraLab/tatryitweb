#!/usr/bin/env bash
set -euo pipefail

# Tatry IT Hugo theme starter
# Vytvorí čistú Hugo tému: themes/tatryit
# Použitie je v README nižšie.

mkdir -p themes/tatryit/layouts/_default \
  themes/tatryit/layouts/events \
  themes/tatryit/assets/css \
  themes/tatryit/static/images \
  themes/tatryit/archetypes \
  data content/events static/images/events static/images

cat > hugo.toml <<'EOF'
baseURL = 'https://tatryit.sk/'
languageCode = 'sk-sk'
title = 'Tatry IT Community'
theme = 'tatryit'
summaryLength = 24

[params]
  description = 'Lokálna IT komunita v Poprade pre ľudí z technológií, produktov, AI a digitálneho biznisu.'
  email = 'community@tatryit.sk'
  meetup = 'https://www.meetup.com/tatry-it-community/'
  youtube = 'https://www.youtube.com/@tatryitcommunity'
  mailerlite_embed = ''
EOF

cat > themes/tatryit/theme.toml <<'EOF'
name = 'Tatry IT'
license = 'MIT'
description = 'Light Hugo theme for Tatry IT Community'
homepage = 'https://tatryit.sk/'
tags = ['community', 'events', 'light', 'hugo']
features = ['events', 'newsletter', 'responsive']
min_version = '0.120.0'

[author]
  name = 'Tatry IT Community'
  homepage = 'https://tatryit.sk/'
EOF

cat > data/site.yaml <<'EOF'
stats:
  - value: "200+"
    label: "členov komunity"
  - value: "20+"
    label: "ľudí pravidelne na meetupe"
  - value: "1× mesačne"
    label: "Tatry IT meetupy"
  - value: "každé 2 týždne"
    label: "s Tatry AI formátom"
EOF

cat > themes/tatryit/assets/css/main.css <<'EOF'
:root {
  --blue: #2F80ED;
  --cyan: #56CCF2;
  --ink: #1F2937;
  --muted: #6B7280;
  --line: #E5E7EB;
  --bg: #F9FAFB;
  --card: #FFFFFF;
}

* { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body {
  margin: 0;
  font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  color: var(--ink);
  background: var(--bg);
  line-height: 1.6;
}
a { color: inherit; text-decoration: none; }
img { max-width: 100%; display: block; }

.container { width: min(1120px, calc(100% - 32px)); margin: 0 auto; }
.section { padding: 88px 0; }
.section.soft { background: #fff; }

.header {
  position: sticky;
  top: 0;
  z-index: 50;
  background: rgba(255,255,255,.82);
  backdrop-filter: blur(14px);
  border-bottom: 1px solid rgba(229,231,235,.8);
}
.nav { height: 72px; display: flex; align-items: center; justify-content: space-between; gap: 24px; }
.brand { display: flex; align-items: center; gap: 12px; font-weight: 900; letter-spacing: .02em; }
.brand img { width: 42px; height: 42px; object-fit: contain; }
.nav-links { display: flex; gap: 20px; align-items: center; color: var(--muted); font-size: 15px; }
.nav-links a:hover { color: var(--blue); }

.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  min-height: 44px;
  padding: 12px 18px;
  border-radius: 999px;
  font-weight: 750;
  border: 1px solid transparent;
  transition: .2s ease;
}
.btn.primary { background: linear-gradient(135deg, var(--blue), var(--cyan)); color: white; box-shadow: 0 14px 30px rgba(47,128,237,.22); }
.btn.secondary { background: white; color: var(--blue); border-color: rgba(47,128,237,.22); }
.btn:hover { transform: translateY(-2px); }

.hero {
  position: relative;
  overflow: hidden;
  background:
    radial-gradient(circle at 85% 20%, rgba(86,204,242,.20), transparent 34%),
    linear-gradient(180deg, #fff, #F7FBFF);
}
.hero::after {
  content: "";
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(120deg, rgba(47,128,237,.08) 1px, transparent 1px),
    linear-gradient(20deg, rgba(86,204,242,.08) 1px, transparent 1px);
  background-size: 120px 120px, 160px 160px;
  opacity: .35;
  pointer-events: none;
}
.hero-inner { position: relative; z-index: 1; display: grid; grid-template-columns: 1.05fr .95fr; gap: 48px; align-items: center; padding: 92px 0; }
.eyebrow { color: var(--blue); font-weight: 850; text-transform: uppercase; letter-spacing: .12em; font-size: 13px; }
h1 { font-size: clamp(42px, 7vw, 76px); line-height: .96; margin: 14px 0 22px; letter-spacing: -.05em; }
.lead { font-size: clamp(18px, 2vw, 22px); color: var(--muted); max-width: 670px; }
.hero-actions { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 30px; }
.logo-panel { background: rgba(255,255,255,.78); border: 1px solid rgba(47,128,237,.12); border-radius: 32px; padding: 46px; box-shadow: 0 30px 80px rgba(31,41,55,.08); }
.logo-panel img { margin: 0 auto; max-height: 180px; }
.keyword-list { display: grid; gap: 14px; margin-top: 34px; font-size: 24px; font-weight: 850; }
.keyword-list span { display: flex; gap: 12px; align-items: center; }
.keyword-list b { color: var(--blue); }

h2 { font-size: clamp(32px, 4vw, 48px); line-height: 1.05; letter-spacing: -.04em; margin: 0 0 14px; }
.section-head { display: flex; justify-content: space-between; gap: 24px; align-items: end; margin-bottom: 34px; }
.section-head p { color: var(--muted); max-width: 620px; margin: 0; }

.feature-event {
  display: grid;
  grid-template-columns: .9fr 1.1fr;
  gap: 34px;
  align-items: center;
  background: white;
  border: 1px solid var(--line);
  border-radius: 32px;
  padding: 22px;
  box-shadow: 0 26px 70px rgba(31,41,55,.08);
}
.feature-event img { border-radius: 24px; aspect-ratio: 1/1; object-fit: cover; background: #EEF7FF; }
.event-content { padding: 22px; }
.badge { display: inline-flex; align-items: center; padding: 7px 12px; border-radius: 999px; background: rgba(47,128,237,.10); color: var(--blue); font-weight: 800; font-size: 13px; }
.event-title { font-size: clamp(30px, 4vw, 48px); line-height: 1.05; letter-spacing: -.04em; margin: 18px 0; }
.meta { display: flex; flex-wrap: wrap; gap: 10px; color: var(--muted); margin: 18px 0 26px; }
.meta span { background: #F3F4F6; border-radius: 999px; padding: 8px 12px; }

.grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; }
.card { background: white; border: 1px solid var(--line); border-radius: 22px; overflow: hidden; transition: .2s ease; }
.card:hover { transform: translateY(-4px); border-color: rgba(47,128,237,.35); box-shadow: 0 18px 48px rgba(31,41,55,.08); }
.card img { aspect-ratio: 1/1; object-fit: cover; background: #EEF7FF; }
.card-body { padding: 18px; }
.card h3 { margin: 0 0 10px; line-height: 1.18; font-size: 20px; }
.card p { margin: 0; color: var(--muted); }

.about-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 32px; align-items: start; }
.stats { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
.stat { background: white; border: 1px solid var(--line); border-radius: 22px; padding: 24px; }
.stat strong { display: block; font-size: 34px; line-height: 1; color: var(--blue); }
.stat span { color: var(--muted); }

.tatry-ai { background: linear-gradient(135deg, rgba(47,128,237,.09), rgba(86,204,242,.14)); border: 1px solid rgba(47,128,237,.14); border-radius: 32px; padding: 42px; }
.newsletter { background: var(--ink); color: white; border-radius: 32px; padding: 42px; }
.newsletter p { color: rgba(255,255,255,.76); }
.embed-placeholder { margin-top: 22px; background: rgba(255,255,255,.10); border: 1px dashed rgba(255,255,255,.25); border-radius: 20px; padding: 24px; color: rgba(255,255,255,.72); }

.footer { padding: 36px 0; border-top: 1px solid var(--line); color: var(--muted); background: white; }
.footer-inner { display: flex; justify-content: space-between; gap: 20px; flex-wrap: wrap; }
.footer a { color: var(--blue); }

.event-page { padding: 64px 0 96px; }
.event-layout { display: grid; grid-template-columns: .9fr 1.1fr; gap: 42px; align-items: start; }
.event-layout img { border-radius: 28px; border: 1px solid var(--line); }
.prose { background: white; border: 1px solid var(--line); border-radius: 28px; padding: 34px; }
.prose h1 { font-size: clamp(36px, 5vw, 58px); margin-top: 0; }
.prose h2 { font-size: 28px; margin-top: 34px; }

@media (max-width: 860px) {
  .nav-links { display: none; }
  .hero-inner, .feature-event, .about-grid, .event-layout { grid-template-columns: 1fr; }
  .grid { grid-template-columns: 1fr; }
  .section { padding: 64px 0; }
  .section-head { display: block; }
  .stats { grid-template-columns: 1fr; }
}
EOF

cat > themes/tatryit/layouts/_default/baseof.html <<'EOF'
<!doctype html>
<html lang="sk">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ if .Title }}{{ .Title }} | {{ end }}{{ .Site.Title }}</title>
  <meta name="description" content="{{ .Site.Params.description }}">
  <link rel="icon" href="/favicon-32x32.png">
  {{ $css := resources.Get "css/main.css" | minify | fingerprint }}
  <link rel="stylesheet" href="{{ $css.RelPermalink }}">
</head>
<body>
  <header class="header">
    <div class="container nav">
      <a class="brand" href="/">
        <img src="/images/logo_clean.png" alt="Tatry IT logo">
        <span>Tatry IT</span>
      </a>
      <nav class="nav-links">
        <a href="/#podujatia">Podujatia</a>
        <a href="/#tatry-ai">Tatry AI</a>
        <a href="/#o-komunite">O komunite</a>
        <a href="/#newsletter">Newsletter</a>
        <a class="btn secondary" href="{{ .Site.Params.meetup }}">Meetup</a>
      </nav>
    </div>
  </header>
  <main>{{ block "main" . }}{{ end }}</main>
  <footer class="footer">
    <div class="container footer-inner">
      <span>© {{ now.Year }} Tatry IT Community</span>
      <span><a href="mailto:{{ .Site.Params.email }}">{{ .Site.Params.email }}</a> · <a href="{{ .Site.Params.youtube }}">YouTube</a> · <a href="{{ .Site.Params.meetup }}">Meetup</a></span>
    </div>
  </footer>
</body>
</html>
EOF

cat > themes/tatryit/layouts/index.html <<'EOF'
{{ define "main" }}
{{ $events := where .Site.RegularPages "Section" "events" }}
{{ $upcoming := sort (where $events "Params.status" "upcoming") "Date" "asc" }}
{{ $past := first 6 (sort (where $events "Params.status" "past") "Date" "desc") }}
{{ $next := index $upcoming 0 }}

<section class="hero">
  <div class="container hero-inner">
    <div>
      <div class="eyebrow">Poprad · Technológie · Komunita</div>
      <h1>Tatry IT Community</h1>
      <p class="lead">Lokálna IT komunita v Poprade pre ľudí z technológií, produktov, AI a digitálneho biznisu.</p>
      <div class="hero-actions">
        <a class="btn primary" href="#podujatia">Najbližšie podujatie</a>
        <a class="btn secondary" href="#newsletter">Newsletter</a>
        <a class="btn secondary" href="{{ .Site.Params.youtube }}">YouTube</a>
      </div>
    </div>
    <div class="logo-panel">
      <img src="/images/logo_clean.png" alt="Tatry IT Community">
      <div class="keyword-list">
        <span><b>01</b> Technológie</span>
        <span><b>02</b> Vzdelávanie</span>
        <span><b>03</b> Komunita</span>
      </div>
    </div>
  </div>
</section>

<section id="podujatia" class="section">
  <div class="container">
    <div class="section-head">
      <div>
        <div class="eyebrow">Podujatia</div>
        <h2>Najbližší meetup</h2>
      </div>
      <p>Prednášky, Q&A, diskusie a networking v Coworking Poprad.</p>
    </div>

    {{ with $next }}
    <article class="feature-event">
      <a href="{{ .RelPermalink }}"><img src="{{ .Params.poster }}" alt="{{ .Title }}"></a>
      <div class="event-content">
        <span class="badge">Najbližšie podujatie</span>
        <h3 class="event-title"><a href="{{ .RelPermalink }}">{{ .Title }}</a></h3>
        <div class="meta">
          <span>{{ .Date.Format "02.01.2006" }}</span>
          <span>{{ .Params.time }}</span>
          <span>{{ .Params.location }}</span>
        </div>
        <p>{{ .Summary }}</p>
        <div class="hero-actions">
          {{ with .Params.registration_url }}<a class="btn primary" href="{{ . }}">Registrovať sa</a>{{ end }}
          <a class="btn secondary" href="{{ .RelPermalink }}">Detail podujatia</a>
        </div>
      </div>
    </article>
    {{ end }}
  </div>
</section>

<section class="section soft">
  <div class="container">
    <div class="section-head">
      <div>
        <div class="eyebrow">Program</div>
        <h2>Nadchádzajúce podujatia</h2>
      </div>
    </div>
    <div class="grid">
      {{ range after 1 $upcoming }}
      <a class="card" href="{{ .RelPermalink }}">
        <img src="{{ .Params.poster }}" alt="{{ .Title }}">
        <div class="card-body">
          <h3>{{ .Title }}</h3>
          <p>{{ .Date.Format "02.01.2006" }} · {{ .Params.time }}</p>
        </div>
      </a>
      {{ end }}
    </div>
  </div>
</section>

<section id="tatry-ai" class="section">
  <div class="container tatry-ai">
    <div class="eyebrow">Podséria</div>
    <h2>Tatry AI</h2>
    <p>Tatry AI je podskupina v rámci Tatry IT zameraná na umelú inteligenciu, praktické využitie AI a nové technologické trendy.</p>
    <a class="btn primary" href="#podujatia">Pozrieť AI podujatia</a>
  </div>
</section>

<section id="o-komunite" class="section soft">
  <div class="container about-grid">
    <div>
      <div class="eyebrow">O komunite</div>
      <h2>Spájame ľudí z IT pod Tatrami</h2>
      <p>Tatry IT Community je otvorená komunita v Poprade. Prepája profesionálov z technológií, digitálnych produktov a inovácií. Cieľom je vzdelávanie, networking, zdieľanie know-how a budovanie IT ekosystému v regióne.</p>
    </div>
    <div class="stats">
      {{ range site.Data.site.stats }}
      <div class="stat"><strong>{{ .value }}</strong><span>{{ .label }}</span></div>
      {{ end }}
    </div>
  </div>
</section>

<section class="section">
  <div class="container">
    <div class="section-head">
      <div>
        <div class="eyebrow">Archív</div>
        <h2>Minulé podujatia</h2>
      </div>
      <a class="btn secondary" href="{{ .Site.Params.youtube }}">Videá na YouTube</a>
    </div>
    <div class="grid">
      {{ range $past }}
      <a class="card" href="{{ .RelPermalink }}">
        <img src="{{ .Params.poster }}" alt="{{ .Title }}">
        <div class="card-body">
          <h3>{{ .Title }}</h3>
          <p>{{ .Date.Format "02.01.2006" }}</p>
        </div>
      </a>
      {{ end }}
    </div>
  </div>
</section>

<section id="newsletter" class="section">
  <div class="container newsletter">
    <div class="eyebrow">Newsletter</div>
    <h2>Pridaj sa ku komunite</h2>
    <p>Dostávaj pozvánky na meetupy, videá a komunitné novinky.</p>
    {{ if .Site.Params.mailerlite_embed }}
      {{ .Site.Params.mailerlite_embed | safeHTML }}
    {{ else }}
      <div class="embed-placeholder">Sem vlož MailerLite embed kód do <code>hugo.toml</code> → <code>params.mailerlite_embed</code>.</div>
    {{ end }}
  </div>
</section>
{{ end }}
EOF

cat > themes/tatryit/layouts/events/single.html <<'EOF'
{{ define "main" }}
<section class="event-page">
  <div class="container event-layout">
    <img src="{{ .Params.poster }}" alt="{{ .Title }}">
    <article class="prose">
      <span class="badge">{{ .Params.series | default "Tatry IT" }}</span>
      <h1>{{ .Title }}</h1>
      <div class="meta">
        <span>{{ .Date.Format "02.01.2006" }}</span>
        <span>{{ .Params.time }}</span>
        <span>{{ .Params.location }}</span>
      </div>
      {{ with .Params.speaker }}<p><strong>Spíker:</strong> {{ . }}</p>{{ end }}
      {{ .Content }}
      <div class="hero-actions">
        {{ with .Params.registration_url }}<a class="btn primary" href="{{ . }}">Registrovať sa</a>{{ end }}
        {{ with .Params.youtube_url }}<a class="btn secondary" href="{{ . }}">Pozrieť video</a>{{ end }}
        {{ with .Params.meetup_url }}<a class="btn secondary" href="{{ . }}">Meetup</a>{{ end }}
      </div>
    </article>
  </div>
</section>
{{ end }}
EOF

cat > themes/tatryit/layouts/_default/list.html <<'EOF'
{{ define "main" }}
<section class="section">
  <div class="container">
    <div class="section-head">
      <div>
        <div class="eyebrow">Tatry IT</div>
        <h1>{{ .Title }}</h1>
      </div>
    </div>
    <div class="grid">
      {{ range .Pages.ByDate.Reverse }}
      <a class="card" href="{{ .RelPermalink }}">
        {{ with .Params.poster }}<img src="{{ . }}" alt="{{ $.Title }}">{{ end }}
        <div class="card-body">
          <h3>{{ .Title }}</h3>
          <p>{{ .Date.Format "02.01.2006" }}</p>
        </div>
      </a>
      {{ end }}
    </div>
  </div>
</section>
{{ end }}
EOF

cat > themes/tatryit/archetypes/events.md <<'EOF'
---
title: ""
date: {{ .Date }}
time: "18:00"
location: "Coworking Poprad"
speaker: ""
series: "Tatry IT"
status: "upcoming"
poster: "/images/events/placeholder.jpg"
registration_url: ""
youtube_url: ""
meetup_url: ""
summary: ""
---

## Program

- 18:00 Privítanie
- 18:10 Hlavná téma
- 19:30 Q&A a diskusia
EOF

cat > content/events/tit43-salesforce.md <<'EOF'
---
title: "Salesforce: viac než len CRM"
date: 2026-04-16
time: "18:00"
location: "Coworking Poprad"
speaker: "Karol Macák"
series: "Tatry IT"
status: "upcoming"
poster: "/images/events/tit43-salesforce.jpg"
registration_url: ""
youtube_url: ""
meetup_url: ""
summary: "Meetup o Salesforce platforme a možnostiach, ktoré idú ďalej než klasické CRM."
---

## Program

- 18:00 Privítanie
- 18:10 Salesforce: viac než len CRM
- 19:30 Q&A a diskusia
EOF

cat > content/events/tai2-tatry-ai-1.md <<'EOF'
---
title: "Tatry AI 1"
date: 2026-03-11
time: "18:00"
location: "Coworking Poprad"
speaker: "Tatry AI"
series: "Tatry AI"
status: "upcoming"
poster: "/images/events/tatry-ai-placeholder.jpg"
registration_url: ""
youtube_url: ""
meetup_url: ""
summary: "Stretnutie podsérie Tatry AI zameranej na umelú inteligenciu a praktické použitie AI."
---

## Program

Program doplníme čoskoro.
EOF

cat > content/events/tit42-ai-do-produktov.md <<'EOF'
---
title: "Ako implementovať AI do produktov pre dobrý zážitok"
date: 2026-02-26
time: "18:00"
location: "Coworking Poprad"
speaker: "Tadeáš Adamjak"
series: "Tatry IT"
status: "past"
poster: "/images/events/tit42-ai-do-produktov.jpg"
registration_url: ""
youtube_url: ""
meetup_url: ""
summary: "Ako zapojiť AI do produktov tak, aby prinášala dobrý používateľský zážitok."
---

## Program

- 18:00 Privítanie
- 18:10 Ako implementovať AI do produktov pre dobrý zážitok
- 19:30 Q&A a diskusia
EOF

cat > content/events/tit41-nis2.md <<'EOF'
---
title: "NIS2 na Slovensku: Kybernetická bezpečnosť pre organizácie"
date: 2026-01-22
time: "18:00"
location: "Coworking Poprad"
speaker: "Michaela Uhríková"
series: "Tatry IT"
status: "past"
poster: "/images/events/tit41-nis2.jpg"
registration_url: ""
youtube_url: ""
meetup_url: ""
summary: "Čo prináša novela zákona o kybernetickej bezpečnosti pre organizácie."
---

## Program

- 18:00 Privítanie
- 18:10 NIS2 na Slovensku
- 19:30 Q&A a diskusia
EOF

cat > content/events/tit40-elastic-mcp.md <<'EOF'
---
title: "Elastic MCP, Agent builder a Vianočná Kapustnica"
date: 2025-12-18
time: "18:00"
location: "Coworking Poprad"
speaker: "Radovan Ondáš"
series: "Tatry IT"
status: "past"
poster: "/images/events/tit40-elastic-mcp.jpg"
registration_url: ""
youtube_url: ""
meetup_url: ""
summary: "Technologický meetup o Elastic MCP, Agent builderi a komunitnej vianočnej kapustnici."
---

## Program

- 18:00 Privítanie
- 18:10 Elastic MCP, Agent builder
- 19:30 Q&A a kapustnica
EOF

cat > README.md <<'EOF'
# Tatry IT Hugo web

Projekt používa vlastnú Hugo tému v `themes/tatryit`.

Nepoužívame Tailwind, aby bol web jednoduchý, rýchly a bez Node.js buildu. Celý dizajn je v `themes/tatryit/assets/css/main.css`.

## 1. Inštalácia Hugo

macOS:

```bash
brew install hugo
```

Windows:

```bash
winget install Hugo.Hugo.Extended
```

Linux:

```bash
sudo snap install hugo
```

Odporúčaná verzia: Hugo Extended 0.120+.

## 2. Vytvorenie projektu

```bash
hugo new site tatryit-web
cd tatryit-web
```

Potom spusti skript `setup-tatryit.sh`, ktorý vytvorí tému, obsah a konfiguráciu:

```bash
chmod +x setup-tatryit.sh
./setup-tatryit.sh
```

## 3. Obrázky

Do `static/images/` vlož:

```txt
logo_clean.png
favicon-32x32.png
```

Do `static/images/events/` vlož plagáty podľa názvov použitých vo frontmatteri, napr.:

```txt
tit43-salesforce.jpg
tit42-ai-do-produktov.jpg
tit41-nis2.jpg
tit40-elastic-mcp.jpg
tatry-ai-placeholder.jpg
```

## 4. Spustenie lokálne

```bash
hugo server
```

Web bude na:

```txt
http://localhost:1313/
```

## 5. Pridanie nového eventu

Najjednoduchšie:

```bash
hugo new events/tit44-nazov-eventu.md
```

Potom uprav frontmatter:

```yaml
---
title: "Názov podujatia"
date: 2026-05-21
time: "18:00"
location: "Coworking Poprad"
speaker: "Meno spíkra"
series: "Tatry IT"
status: "upcoming"
poster: "/images/events/tit44-nazov-eventu.jpg"
registration_url: "https://..."
youtube_url: ""
meetup_url: ""
summary: "Krátky popis podujatia."
---
```

Ak je event ukončený, nastav:

```yaml
status: "past"
```

## 6. Newsletter / MailerLite

Do `hugo.toml` vlož embed kód:

```toml
[params]
  mailerlite_embed = '''
  SEM VLOŽ MAILERLITE EMBED KÓD
  '''
```

## 7. Build pre produkciu

```bash
hugo --minify
```

Výstup bude v:

```txt
public/
```

Ten priečinok sa dá nasadiť na Netlify, Cloudflare Pages, GitHub Pages alebo vlastný hosting.

## 8. Úprava dizajnu

Téma je tu:

```txt
themes/tatryit/
```

Najdôležitejšie súbory:

```txt
themes/tatryit/assets/css/main.css
themes/tatryit/layouts/index.html
themes/tatryit/layouts/events/single.html
themes/tatryit/layouts/_default/baseof.html
```

Farby sú na začiatku CSS:

```css
:root {
  --blue: #2F80ED;
  --cyan: #56CCF2;
  --ink: #1F2937;
  --bg: #F9FAFB;
}
```
EOF

echo "Hotovo: čistá Hugo téma je v themes/tatryit. Spusti: hugo server"
