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
