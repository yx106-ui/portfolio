# CLAUDE.md

Standing instructions for this project. Read this and `DESIGN_GUIDELINES.md` at the start of every session.

---

## Project

Personal portfolio site for **Yuchen Xiao** — UX/UI designer and researcher, Wellesley College.

Purpose: showcase UX/UI case studies (primary), research experience, and studio art work, for recruiters and graduate programs.

## Stack

- **Astro** — static site generator. No backend, no database, no auth.
- **Plain CSS** (or Astro scoped styles). If Tailwind is used, all tokens from `DESIGN_GUIDELINES.md` must be defined in config and arbitrary values for color/radius/spacing are banned.
- **Deploys to Netlify** via GitHub. Every push to `main` auto-deploys.
- Node LTS. Ask before adding any dependency.

## Design rules

**`DESIGN_GUIDELINES.md` is binding.** Read it before writing any code. If a request conflicts with it, follow the guidelines and flag the conflict.

Design intent in one line: quiet, cool, full of air (安静、清冷、有空气感). The interface is a frame, not a performance — the work is loud, the UI stays quiet.

Light mode only. Do not build a dark mode.

## Interactivity

- Interactive elements use **vanilla JS in `<script>` tags by default**.
- Use a framework island (`client:load`) **only** when component state genuinely requires it — not for hover effects, scroll reveals, or animations.
- Astro ships zero JS by default. Keep it that way unless there's a real reason.

## Site structure

Nav: **Design · Research · Art · Resume**

- `/` — homepage: brief intro + headshot
- `/design` — UX/UI case studies index
  - `/design/wbeauty` — WBeauty (priority project — the strongest case study)
  - `/design/lets-fly-now` — Let's Fly Now (Ninety-Nines / Develop for Good)
  - `/design/bee-my-eyes` — Bee My Eyes (Buildathon, AI prototyping)
- `/research` — BRAT Lab research experience
- `/art` — studio art gallery (see `DESIGN_GUIDELINES.md` §8 — this section is the deliberate exception to the design system)
- **Resume** — not a page. Nav item links directly to `/resume.pdf` with the `download` attribute.

## Content

- All copy lives in `/content` as Markdown. **Never hardcode copy into components.**
- The three case studies share **one layout** (`CaseStudyLayout.astro`). Build it once, render all three through it.
- Markdown files contain `[IMAGE: ...]`, `[VIDEO: ...]`, and `[EMBED: ...]` placeholders marking where assets go.
- **Never invent content.** If a bio, date, caption, or project detail is missing, ask — do not write placeholder text or lorem ipsum.

## Assets

```
assets/
  paintings/     reference paintings — source for design tokens, NOT site content
  mountain.jpg   loader background (see DESIGN_GUIDELINES.md §6)
  headshot.jpg   homepage
  wbeauty/       Figma exports (2x PNG)
  lets-fly-now/  Figma exports (2x PNG)
  bee-my-eyes/   slides + demo .mp4
  art/           studio art photographs
```

- Compress every image before use. Serve WebP. `loading="lazy"` below the fold.
- Project screenshots are **off-palette on purpose** (purple/pink, navy/gold, bright blue/yellow). They must be mounted per `DESIGN_GUIDELINES.md` §7 — never bled full-width, never recolored.
- Page weight budget: **<1MB**. LCP <2.5s on 4G.

## Working style

- **One section at a time.** Do not scaffold the whole site at once.
- Discuss the approach before writing code for anything new.
- **Commit whenever something works.** Small, frequent commits with clear messages.
- Ask before adding dependencies, changing the stack, or deviating from the guidelines.
- Verify against the `DESIGN_GUIDELINES.md` §12 checklist before considering a page done.

## Build order

1. Project scaffold + Git/GitHub setup
2. Design tokens (CSS variables from `DESIGN_GUIDELINES.md` §1–4)
3. Homepage + nav → **deploy to Netlify immediately**
4. WBeauty case study (this page becomes the template)
5. Let's Fly Now + Bee My Eyes
6. Research + Art
7. Loading screen (rain over mountain — §6), polish, mobile

The loader comes **last**. It is the most fun and the least important.
