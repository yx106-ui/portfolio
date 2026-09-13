# Bee My Eyes — Prototyping an Amblyopia Training Game with AI

**Role:** Design & front-end vibecoding — I owned the visual design and drove the AI prototyping in Lovable
**Team:** Team 42, 4 people — Emily Li, Tanya Shi, Qiyan Su, and me (Yuchen Xiao)
**Event:** The Generator Buildathon 2025, Babson College
**Timeline:** ~8 hours
**Tools:** Lovable (AI/"vibecoding" app builder), [ADD: Figma? Canva for the deck?]
**Type:** Rapid concept prototype + pitch

> **TL;DR:** In a single buildathon, my team designed and shipped a working prototype of *Bee My Eyes* — a maze game that helps children with amblyopia ("lazy eye") train their weaker eye *and* their hand-eye coordination, using red-blue anaglyph colors and an adaptive difficulty system. It was also my first time building with AI ("vibecoding") in Lovable — and the biggest thing I took away wasn't the game, it was learning how to *steer* an AI builder through precise prompting.

[VIDEO: 26-second prototype demo — the working game]

---

## The Concept

Amblyopia, or "lazy eye," is the most common cause of vision loss in children — affecting up to 3 in 100 kids. It happens when the brain starts favoring one eye, so the weaker eye never fully develops. Standard treatments (eye patches, anaglyph glasses, vision-training games) mostly focus on forcing the weak eye to work *alone*.

We spotted a gap: most existing games train the weak eye in isolation and ignore **hand-eye coordination**, which amblyopia also affects. So we framed our design question around cooperation, not isolation:

> *How might we help children train their weaker eye and their hand-eye coordination at the same time — in something that actually feels like play?*

**Our answer: Bee My Eyes** — a kid-friendly maze game where a worker bee collects flowers and reaches the queen, wrapped in a bee-colony theme. Worn with red-blue anaglyph glasses, the game's color design sends different information to each eye, gently pushing the weaker eye to engage while the child uses their hands to navigate.

---

## The Design

We built three core screens in the prototype:

**Homepage** — a daily **streak system** (check in each day) to build the consistent-training habit that vision therapy depends on, plus a clear entry into the game and a levels-passed record.
[IMAGE: Homepage screen]

**Game page** — the "Worker Bee Maze": navigate the bee with arrow controls, collect all 5 red flowers, and reach the queen. The red/blue color separation is the therapeutic core — worn with anaglyph glasses, it forces the weaker eye to cooperate with the stronger one.
[IMAGE: Game page screen]

**Results page** — a **suppression score** (0–1) representing how much the brain is favoring the stronger eye (0 = both eyes equal; 1 = stronger eye doing nearly all the work). Our prototype uses this score to **automatically adjust color contrast**, so the weaker eye is nudged to work a little harder as the child improves — a simple adaptive-difficulty loop.
[IMAGE: Results / suppression score screen]

Three design decisions I'd call out:

1. **A theme that carries the therapy.** The bee-colony framing wasn't decoration — "help the worker bee reach the queen" gives a small child a reason to keep going through what is, clinically, repetitive visual training.
2. **Habit design.** The streak system treats the real challenge honestly: vision therapy fails when kids stop doing it. Engagement *is* the medicine.
3. **Adaptive, not punishing.** Using the suppression score to adjust contrast automatically means the game meets each child where they are, instead of gating them behind fixed levels.

> **Honest scope note:** *Bee My Eyes* is a hackathon concept prototype, not a clinically validated medical device. The suppression score and adaptive contrast are designed as a plausible model, not a tested treatment. I keep this framing in the case study on purpose — knowing the line between "compelling prototype" and "validated product" is itself part of designing responsibly in a health space.

---

## The Real Story: Learning to Vibecode

This buildathon was my first time using **Lovable** to build a real, working prototype from natural-language prompts. Going in, I assumed "describe what you want and the AI builds it." What I actually learned is that **AI building is a design skill of its own** — the quality of what you get out is almost entirely about how you prompt.

Here's what I took away:

### 1. Specificity beats description

Early on, I'd write something like *"put a jar on the left"* — and get a generic, misplaced result. The output only matched our design once I described the layout concretely. For the game's top bar, the prompt that actually worked read like a spec:

> *"Add a soft rectangular bar across the top with: on the left, a honey jar icon with a number label like 'Nectar: 3/5'; in the middle, a small label 'Find your way back to the hive!'"*

Naming the container, the position of each element, the icon, and the exact label format is what got it right. I learned to prompt like I was writing a component description, not describing a vibe — position, content, and format spelled out, not implied.

### 2. Calibrating the "vibe" through keywords

I learned that certain phrases acted like dials — the *name* I gave a component changed what Lovable built. The clearest example: for the on-screen arrows that let a child move the bee, calling them "buttons" gave inconsistent results, but prompting for a **"control panel (interactive movement buttons)"** reliably produced the grouped directional control I wanted. Precise, slightly technical component names ("control panel," not "the clicky arrows") were a consistent lever for getting predictable output.

### 3. Iterating in small steps, not big rewrites

[ADD: your workflow — did you learn to make one change at a time? Revert when the AI "fixed" the wrong thing? Lock down working pieces before moving on? Describe how your prompting strategy evolved over the hackathon.]

Asking for one focused change at a time gave me far more control than requesting sweeping edits, which tended to break things that already worked.

### 4. Where AI building broke down — and how we steered around it

Our biggest struggle was movement. Because the game is grid-based, getting the bee to move *correctly* was surprisingly hard for the AI to produce from a casual prompt. Left to loose instructions, Lovable would let the bee move diagonally, or walk off the edge of the board entirely.

Fixing it took prompting in the game's own logic rather than its visuals: we had to describe movement in terms of **x and y coordinates** — the bee moves one step horizontally or vertically only (no diagonals), and every move must stay **within the bounds of the board**. Once I framed the prompt around the coordinate system and explicit constraints (stay on-grid, orthogonal moves only) instead of just "let the player move the bee," the behavior locked in.

That was the lesson that stuck: **when vibecoding hits a wall, the fix is usually to prompt in the underlying logic, not the surface description.** Knowing *what* the system actually needs to enforce — coordinates, bounds, allowed directions — is where design thinking and a bit of technical understanding earn their keep, even in an AI-built prototype.

---

## Reflection

Bee My Eyes taught me two different things at once:

- **On design:** in a health-adjacent product, the hardest problem isn't the interface — it's motivation. Our best decisions (the bee theme, the streak system, adaptive contrast) were all about making a child *want* to do their eye training.
- **On building with AI:** vibecoding isn't a shortcut around design thinking — it's a new medium that rewards it. Being precise about what I wanted, iterating in small steps, and learning the tool's "keyword levers" let me get a working, demoable product out of a single hackathon. That skill — turning clear design intent into working prototypes fast, through AI — is one I'll keep using.

[ADD: optional closing line — what you'd build next if you kept going, or a link to try the live prototype if you recover the Lovable link.]

---

*Built at The Generator Buildathon 2025 · Team 42*
