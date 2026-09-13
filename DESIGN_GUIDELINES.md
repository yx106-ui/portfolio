# DESIGN_GUIDELINES.md

Design system for Yuchen Xiao's portfolio site. **These rules are binding.** When a request conflicts with this document, follow this document and flag the conflict.

---

## 0. Design Intent

The site should feel **quiet, cool, and full of air** (安静、清冷、有空气感). Reference texture: **marker drawing + watercolor** — soft edges, layered washes, generous negative space.

The interface is a **frame, not a performance**. The work (case studies, prototypes, paintings) is loud; the UI stays quiet.

**Mode: LIGHT.** Snow White ground, deep navy text. Do not build a dark mode for v1.

---

## 1. Color

### Palette (the only permitted colors)

| Name | Hex |
|---|---|
| Deep Navy | `#020524` |
| Midnight Blue | `#1C304D` |
| Steel Blue | `#557683` |
| Dusty Teal | `#74A5B0` |
| Glacier Blue | `#83C7D8` |
| Mist Blue | `#ADC4CE` |
| Forest Green | `#355F4D` |
| Moss Green | `#4E6E58` |
| Snow White | `#DFEAF0` |

**One permitted derived token:** `#3E5A66` (Steel Blue Deep) — for muted body text only. See §1.2.

### 1.1 Semantic roles — use these tokens, never raw hexes in components

```css
:root {
  /* Surfaces */
  --bg:              #DFEAF0;  /* page ground (Snow White) */
  --surface:         #FFFFFF;  /* cards, image mounts — the only permitted pure white */
  --surface-sunken:  #ADC4CE;  /* recessed blocks, image mounts needing separation (Mist Blue) */
  --surface-invert:  #020524;  /* footer / rare dark section (Deep Navy) */

  /* Text */
  --text:            #020524;  /* body + headings (Deep Navy) */
  --text-secondary:  #1C304D;  /* subheads, captions (Midnight Blue) */
  --text-muted:      #3E5A66;  /* metadata, labels — passes AA */
  --text-on-invert:  #DFEAF0;  /* text on --surface-invert */

  /* Interactive */
  --accent:          #355F4D;  /* links, primary buttons (Forest Green) */
  --accent-hover:    #4E6E58;  /* hover state (Moss Green) */
  --accent-quiet:    #74A5B0;  /* secondary/ghost buttons (Dusty Teal) */

  /* Lines & decoration */
  --border:          #ADC4CE;  /* 1px borders, dividers (Mist Blue) */
  --decor:           #83C7D8;  /* washes, gradients, rain, decorative only (Glacier Blue) */
}
```

### 1.2 Contrast rules (hard)

- **NEVER** use `#83C7D8`, `#ADC4CE`, `#74A5B0`, or `#557683` for body text. All fail WCAG AA on Snow White.
- Light blues are **decoration and large display only** (≥32px, or non-text).
- Body text is always `--text`, `--text-secondary`, or `--text-muted`.
- Every text/background pair must pass **WCAG AA (4.5:1 body, 3:1 large text)**. Verify, don't assume.

### 1.3 Negative constraints (hard)

1. **No default tech-blue or indigo.** No `#007BFF`, no Tailwind `blue-*`/`indigo-*`, no `rebeccapurple`. Palette only.
2. **No color outside the palette** except `#FFFFFF` (as `--surface`) and `#3E5A66`.
3. **Do not tint or shade palette colors ad hoc.** Need emphasis? Change the token, not the hex.

---

## 2. Typography

**The biggest lever for "quiet + airy." Do not default here.**

### 2.1 Fonts

- **Body / UI (site-wide): `Inconsolata`** (Google Fonts) — monospace, used for all body text, nav, captions, and UI across every page.
- **Display (homepage only): `Irish Grover`** (Google Fonts) — used only for the homepage "Hi, I'm Yuchen" hero heading. Do not use it elsewhere.
- **Case study / non-homepage headings:** use `Inconsolata` at heavier weight (700). Do not use Irish Grover outside the homepage.
- Self-host or load via Google Fonts with `font-display: swap`. Max weights: 4 total.
- Note: Inconsolata is monospace by design — this is intentional. Keep body line-height generous (§2.2) to preserve readability.

### 2.2 Scale (do not invent sizes)

| Token | Size / line-height | Use |
|---|---|---|
| `--fs-display` | 56px / 1.1 | Hero name, case study titles |
| `--fs-h1` | 40px / 1.2 | Page titles |
| `--fs-h2` | 28px / 1.3 | Section heads |
| `--fs-h3` | 20px / 1.4 | Subsections |
| `--fs-body` | 17px / **1.7** | All prose |
| `--fs-small` | 14px / 1.5 | Captions, metadata |

- Mobile: scale display/h1 down ~25% (`clamp()` is fine).
- **Body line-height never below 1.6.** Air lives here.
- **Max line length 65–75 characters.** Enforce with `max-width: 68ch` on prose containers.
- Headings: `letter-spacing: -0.01em`. Body: default. **No letter-spacing on body text.**
- **No text over 3 weights on one page.** No all-caps paragraphs; all-caps permitted for small labels only, with `letter-spacing: 0.08em`.

---

## 3. Spacing & Layout

- **Base unit: 8px.** Every margin, padding, and gap is a multiple of 8. No 5px, no 13px, no 30px.
- **Scale:** 8 / 16 / 24 / 32 / 48 / 64 / 96 / 128.
- **Section padding:** 128px vertical desktop, 64px tablet, 48px mobile. Do not compress this to fit more content — the air *is* the design.
- **Max widths:** prose `68ch` (~720px) · galleries/image grids `1200px` · full-bleed only where §7 permits.
- Grid: 12-column desktop, 4-column mobile, 24px gutters.
- **Whitespace is not empty space.** If a section feels sparse, that is correct.

---

## 4. Shape, Borders, Shadows

### 4.1 Radius — ONE value

- **`--radius: 16px`.** Cards, buttons, image mounts, inputs, embeds. Everything.
- Permitted exceptions: `0px` for full-bleed elements and dividers; `999px` (pill) for small tags/chips only.
- **NEVER 4px or 8px.** Never mix 16 and 24 arbitrarily — one value reads as intent, mixed values read as accident.

### 4.2 Borders

- Default separation method: **1px solid `--border`**. Prefer this over shadow.
- Dividers: 1px `--border`, full-width or 64px rule — never a heavy bar.

### 4.3 Shadows (hard constraint)

- **BANNED:** any `#000000` shadow, any shadow with opacity > 0.08, any spread that produces a visible hard edge.
- Permitted, sparingly (elevated cards, sticky nav on scroll):
  ```css
  --shadow-soft: 0 24px 64px -24px rgba(2, 5, 36, 0.08);
  ```
- Default to **no shadow**. Use `--border` first.

### 4.4 Icons

- **Solid/filled icons only.** No generic outline/stroke icon sets.
- One family throughout (Phosphor Fill or Material Symbols Filled). Size on the 8px scale (16/24). Color: `--text-secondary` or `--accent`, never `--decor`.

---

## 5. Texture: Marker + Watercolor

The signature look — and the rule most likely to go wrong. Constrain tightly.

**Permitted:**
- Soft, low-contrast **CSS gradients** between palette colors, on section backgrounds and decorative dividers.
- A **subtle grain/noise overlay** at `opacity: 0.03–0.06`, implemented as an inline SVG `feTurbulence` filter or a tiling CSS pattern — **not** an image file.
- Soft-edged decorative shapes (blurred radial gradients in `--decor`) as background accents.

**Hard constraints:**
1. **Never behind text.** Texture goes on section backgrounds *below* a solid surface layer, or in margins. If a paragraph sits on texture, the texture is wrong.
2. **Never as large image files.** No PNG/JPG texture assets. CSS/SVG only. (Exception: the one mountain painting in §6.)
3. **Never above `opacity: 0.06`** for grain, `0.15` for decorative washes.
4. Texture is **decorative only** — it never conveys information, never marks state, never indicates interactivity.

---

## 6. Homepage Intro: Birds Fly In

The homepage signature moment (replaces the earlier rain-loader concept — do not build a rain loader).

**On homepage load:**
1. Four birds fly in from the right edge, crossing over/below the mountain, and come to rest at the left, each at its nav position.
2. Once the birds land, the four nav labels appear one by one, each beside its bird (bird to the LEFT of the label): 🐦 Design · 🐦 Research · 🐦 Art · 🐦 Resume.
3. The birds are the permanent nav markers — they stay after the intro as the bullet beside each label.

**Birds:**
- Sourced from `bird1–4.png`, but **traced into inline SVG** (not raster) so they scale cleanly, weigh nothing, and animate smoothly.
- Color: Snow White `#DFEAF0` fill (they read against the mountain/sky).
- **Different sizes** for an artistic, layered feel — not uniform.
- Zigzag horizontal alignment (see §6.1).

**Hard constraints:**
1. **First homepage visit only** per session — do not replay on every internal navigation back to home.
2. **`prefers-reduced-motion: reduce` → no fly-in.** Birds and nav appear in final position immediately, statically.
3. Intro is non-blocking: all content is rendered and accessible underneath; nav is keyboard-reachable regardless of animation state.
4. Total intro ≤ 2.5s. Never trap the user waiting.
5. Motion easing per §9 (ease-out); the fly-in may use a slightly longer duration than 200ms (up to ~800ms per bird) since it's the signature moment — this is the one permitted exception to the 200ms rule.

### 6.1 Bird / nav zigzag alignment

Four nav items, bird to the left of each label. Birds line up in a zigzag by horizontal indent:

- **Design** (item 1): indent A (further left)
- **Research** (item 2): indent B (further right)
- **Art** (item 3): indent A (matches Design — same vertical column)
- **Resume** (item 4): indent B (matches Research — same vertical column)

So items 1 & 3 share a left edge, items 2 & 4 share a left edge further right. The offset between A and B should relate to nav-label length (a subtle stagger, ~16–24px), producing a gentle two-column zigzag, not a large jump.

### 6.2 Mountain background

- `mountain.png` sits as the top band of the homepage main area.
- **Its background must match page `--bg`** so it blends seamlessly into the plain bio area below — no visible seam or color break.
- Export optimized WebP, ≤150KB, ~1600px wide.
- If it fails to load, fall back to `--bg`. Never a broken-image state.

---

## 7. Project Imagery — the rule that protects the palette

The case study screenshots are **loud and off-palette** (WBeauty: purple/pink · Let's Fly Now: navy/gold · Bee My Eyes: bright blue/yellow). They will fight this system unless framed.

**Rules:**
1. **Every project image is mounted inside a neutral container.** `--surface` or `--surface-sunken` background, `--radius`, 24–48px internal padding, optional 1px `--border`.
2. **Never bleed project screenshots full-width, edge-to-edge.** The container is the frame; the frame stays quiet so the work can be loud.
3. **One consistent mount treatment** across all three case studies. Do not style WBeauty's images differently from Bee My Eyes'.
4. **Never recolor, overlay, or tint project imagery** to match the palette. The work is shown as it is.
5. Figma embeds: same mount, `--radius`, 1px `--border`, `loading="lazy"`, with a visible "Open prototype in Figma →" link beside it as fallback.
6. Video (Bee My Eyes demo): same mount. `autoplay muted loop playsinline`, no controls chrome. Respect `prefers-reduced-motion` — show a poster frame with a play button instead.
7. Export images at 2x, serve as WebP, `loading="lazy"` below the fold.

---

## 8. Studio Arts — the deliberate exception

This section is granted a different treatment. **The palette recedes; the work takes over.**

- Near-full-bleed images permitted. Grid gutters may drop to 8–16px.
- Minimal chrome: no cards, no borders, no mounts. Image + caption only.
- Captions: `--fs-small`, `--text-muted`, generous space above.
- Navigation and typography stay on-system — everything else yields.
- **This is the only section permitted to break §7.** It is an exception, not a precedent.

---

## 9. Motion

- **One duration: 200ms. One easing: `ease-out`.** Applies to all hover, focus, and reveal transitions.
- Exceptions: the rain loop (§6) and the loader fade-out (400ms).
- Hover states on **interactive elements only** — never on static cards, headings, or images. Hover = color/opacity shift, never scale/translate.
- Entrance animations: at most a subtle fade+8px rise, once, on section reveal. **No parallax, no scroll-jacking, no staggered cascades, no bouncing.**
- **`prefers-reduced-motion: reduce` disables all animation** except opacity fades ≤200ms.

---

## 10. Accessibility (non-negotiable)

- Semantic HTML: real `<nav>`, `<main>`, `<article>`, `<h1>`–`<h3>` in order. Never skip levels.
- Every image has meaningful `alt`; decorative images `alt=""`.
- Visible focus states — `2px solid var(--accent)`, `outline-offset: 2px`. **Never `outline: none`.**
- Keyboard-navigable throughout; embeds and video reachable and labeled.
- Touch targets ≥ 44×44px.
- Test at 320px width and at 200% browser zoom.

---

## 11. Build Constraints

- **Static site.** No backend, no database, no auth. Deploys to Netlify from GitHub.
- **No `localStorage`/`sessionStorage`.**
- No CSS framework defaults leaking through. If using Tailwind, define these tokens in the config and **ban arbitrary values** for color/radius/spacing.
- Performance budget: **<1MB total page weight**, LCP <2.5s on 4G. Compress every image before adding it.
- Content lives in Markdown, not hardcoded in components.
- Mobile-first. Every rule here has a mobile answer.

---

## 12. Final Check

Before shipping any page, verify:

- [ ] Zero colors outside §1
- [ ] No 4px or 8px radius anywhere
- [ ] No black or high-opacity shadows
- [ ] Body text ≥1.6 line-height, ≤75ch, passes AA
- [ ] No banned fonts
- [ ] All spacing on the 8px scale
- [ ] Project images mounted per §7 (except Studio Arts)
- [ ] Texture never behind text
- [ ] `prefers-reduced-motion` honored
- [ ] Works at 320px and 200% zoom
- [ ] Page weight <1MB

**If a decision isn't covered here: choose the quieter option.**
