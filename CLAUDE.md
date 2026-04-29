Tatry IT Hugo Website

Project goal

Build and maintain a simple static website for Tatry IT Community using Hugo.

The site should be light, clean, airy, and based primarily on the Tatry IT logo and rollup design. Avoid dark/cyberpunk UI. Event posters can remain visually strong/dark, but the website UI itself should stay bright and minimal.


Tech stack

- Hugo static site generator
- Custom Hugo theme located in themes/tatryit
- No Tailwind / no Node.js build unless explicitly requested
- CSS lives in themes/tatryit/assets/css/main.css


Current structure

hugo.toml
content/
  events/
    _index.md
    tit43-salesforce/
      index.md
      poster.jpg
themes/
  tatryit/
    theme.toml
    assets/css/main.css
    archetypes/events.md
    layouts/
      index.html
      _default/
        baseof.html
        list.html
      events/
        single.html
data/
  site.yaml
static/
  images/
    logo_clean.png
    favicon-32x32.png


Design direction

Use a light brand system:

--blue: #2F80ED
--cyan: #56CCF2
--ink: #1F2937
--muted: #6B7280
--line: #E5E7EB
--bg: #F9FAFB
--card: #FFFFFF

Visual principles:

- White / very light gray background
- Blue and cyan accents
- Rounded cards
- Soft shadows
- Plenty of whitespace
- Subtle network/technology pattern inspired by the rollup
- Event posters displayed inside cards, not used as overall site style


Content model

Events should use Hugo Page Bundles.

Preferred structure:

content/events/event-slug/
  index.md
  poster.jpg

Example frontmatter:

title: Salesforce: viac než len CRM
date: 2026-04-16
time: 18:00
location: Coworking Poprad
speaker: Karol Macák
series: Tatry IT
poster: poster.jpg
registration_url:
youtube_url:
meetup_url:
summary: Meetup o Salesforce platforme a možnostiach, ktoré idú ďalej než klasické CRM.

Allowed values:

series: Tatry IT
series: Tatry AI


Event display logic

Homepage:

- first upcoming event by date = highlighted “Najbližší meetup”
- remaining upcoming events = smaller cards
- all past events should be visible (no artificial limit)

Recommended Hugo logic:

$events := where .Site.RegularPages "Section" "events"
$upcoming := sort (where $events "Params.status" "upcoming") "Date" "asc"
$past := sort (where $events "Params.status" "past") "Date" "desc"
$next := index $upcoming 0


Page bundle image handling

Use:

$poster := .Params.poster
$img := .Resources.GetMatch $poster

if $img:
  use $img.RelPermalink
else:
  fallback to .Params.poster

Do not assume images are in static folder.


Main pages

- / (homepage)
- /events/ (archive)
- /events/{slug}/ (detail)

Homepage sections:

1. Hero
2. Najbližší meetup
3. Nadchádzajúce podujatia
4. Tatry AI
5. O komunite
6. Minulé podujatia
7. Newsletter
8. Footer


Newsletter

Configured in hugo.toml:

mailerlite_embed = (embed code)

Render using safeHTML.

If empty → show placeholder.


Community info

Tatry IT Community is a local IT community in Poprad.

Key facts:

- 200+ members
- ~20 regular attendees
- events monthly
- Tatry AI alternates → every 2 weeks
- includes talks, Q&A, networking
- covers dev, AI, product, UX, marketing, business


Commands

Run:

hugo server

Build:

hugo --minify

New event:

hugo new events/tit44-event/index.md


Coding style

- keep templates simple
- avoid JS unless needed
- avoid dependencies
- keep CSS centralized
- Slovak UI text
- keep site fast and minimal


Typical tasks

- show all past events (no limit)
- support page bundle images
- ensure /events/ archive works
- improve responsiveness if needed
- keep light design system