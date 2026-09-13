# WBeauty — A Peer-to-Peer Beauty Service Platform for Wellesley Students

**Role:** Project Lead · UX/UI Designer · UX Researcher
**Team:** 2 people. I led the project end-to-end — research design, prototyping, usability testing, and the final UX/UI of every screen. My teammate contributed to early user research and initial drafts of a few screens, which I later redesigned and unified under the final design system.
**Timeline:** [ADD: e.g., Sep–Dec 2025, one semester]
**Tools:** Figma, paper prototyping, contextual inquiry interviews, moderated usability testing
**Context:** CS 220 (Human-Computer Interaction), Wellesley College

> **TL;DR:** I designed a mobile app that lets Wellesley students both offer and receive affordable beauty services on campus, using a token-based exchange instead of cash. Through two rounds of user testing across low- and high-fidelity prototypes, the final design achieved a **92% task success rate**, with users especially praising the color-coded dual-role system I designed.

<!-- HERO: display these four screens as one horizontal row / grid, mounted per DESIGN_GUIDELINES.md §7 -->
![WBeauty client home page showing artist reviews and promotions](/assets/wbeauty/hero/home-client.png)
![WBeauty client profile page showing tokens, booked services, and service history](/assets/wbeauty/hero/profile-client.png)
![WBeauty artist profile page showing tokens, services offered, and upcoming appointments](/assets/wbeauty/hero/profile-artist.png)
![WBeauty artist toolkit shop page showing purchasable supplies priced in tokens](/assets/wbeauty/hero/shop-artist.png)

---

## The Problem

Many Wellesley students — especially those juggling classes, extracurriculars, and part-time jobs — struggle to access affordable, high-quality beauty services like haircuts, nail care, and lash extensions. The town of Wellesley is expensive, so students often travel as far as Chinatown in Boston for reasonably priced services: a trip that costs hours they don't have.

Meanwhile, other students *have* these skills and want to practice them — aspiring nail techs building toward certification, students who cut hair for friends — but have no structured way to find clients, promote their work, or be trusted by strangers.

Existing informal channels (Yik Yak, Sidechat, word of mouth) offer no verification, no reviews, and no booking structure. The opportunity was clear: a campus-specific, peer-to-peer platform where students can be both providers and receivers of beauty services.

**Design question:** *How might we help Wellesley students exchange beauty services in a way that feels safe, affordable, and convenient — for both sides of the exchange?*

---

## My Role

I led this two-person project from concept through final evaluation. I was responsible for:

- Designing the interview protocol and leading the ideation, prototyping, and evaluation phases
- The UX/UI design of the final prototype — I established the design system (colors, typography, components, layout rules) and designed or redesigned every screen to that standard, from paper prototypes and lo-fi wireframes through the complete high-fidelity Figma prototype
- Planning and running both rounds of moderated usability testing, and translating findings into design iterations
- The visual identity: color system, logo, typography, and component consistency

My teammate collaborated on the early user and market research phase and contributed initial drafts of several screens; as design lead, I revised these into the final unified design.

---

## Research: Understanding How Students Actually Get These Services

We began with contextual inquiry interviews with current Wellesley students, structured around a 13-question protocol I helped design ([see the full interview protocol](/assets/wbeauty/interview-protocol.png)). We asked about their current routines, motivations (big events turned out to be a major trigger), how they find providers today, and — critically — what would make them trust a *fellow student* with a beauty service.

**Key insights from the interviews:**

1. **Cost and travel time are the core pain points.** Students knowingly overpay locally or lose half a day traveling to Boston.
2. **Trust is the make-or-break factor.** Students were open to peer services, but only with verification, reviews, and a way to communicate before committing.
3. **Providers need visibility, not just bookings.** Student providers wanted to showcase work, build a client base, and get inspiration — a community, not just a marketplace.
4. **Money exchange between students felt awkward.** This insight led to one of our most distinctive design decisions: a token system where students earn credits by providing services and spend them receiving services, sidestepping cash transactions entirely.

### Personas

I synthesized our research into two personas that anchored every later design decision:

- **Julia** — an artistic, able-bodied studio art major working toward her nail technician certification. She needs visibility, a client base, and appointment management. *(Provider-side goals)*
- **Lila** — a busy, introverted CS major who is hard of hearing. She needs reliable, easy-to-book, on-campus services with minimal negotiation and messaging friction. *(Receiver-side goals — and a deliberate push to keep accessibility in frame)*

![Persona card for Julia, an artistic studio art major working toward nail technician certification](/assets/wbeauty/persona-julia.png)
![Persona card for Lila, a busy computer science major who is hard of hearing](/assets/wbeauty/persona-lila.png)

![Eight-panel storyboard following Julia from doing friends' nails for free to earning her nail technician certificate through the app](/assets/wbeauty/storyboard-julia.png)

Writing storyboards for both personas forced an important realization early: **the same student might be Julia on Monday and Lila on Friday.** The app couldn't treat providers and receivers as separate audiences — it had to make being *both* effortless.

---

## Ideation & Early Design Decisions

I sketched multiple layout directions, focusing on four hard problems:

1. Distinguishing the artist vs. client roles
2. The booking workflow
3. Profile clarity
4. Chat integration

![Hand-drawn design sketch exploring the first layout direction: profile creation, service search, provider profiles, booking calendar, and QR attendance verification](/assets/wbeauty/design-sketch-1.png)
![Hand-drawn design sketch exploring the second layout direction: role switching between provider and receiver, filtered home feed, location-based service map, and reserved services list](/assets/wbeauty/design-sketch-2.png)

After presenting the sketches for peer and professor critique, I committed to the defining structural decision of the app: **every user is both artist and client, and can switch roles with a single tap from their profile.** Supporting decisions followed:

- **Token economy instead of cash** — to keep exchanges safe, low-pressure, and community-oriented. Artists can also spend tokens in a built-in **toolkit shop** (nail supplies, etc.), giving earned tokens a concrete purpose and supporting providers' real-world goals.
- **Chat before booking** — so receivers like Lila can negotiate style and price in writing, on their own terms.
- **QR-code attendance confirmation** — at the appointment, the artist presents a QR code and the client scans it to confirm attendance, which triggers the token transfer. This closes the loop on the token economy: tokens only move when the service verifiably happened, building accountability into every exchange.

From these decisions I built complete low-fidelity wireframes covering both user flows end-to-end: Home (reviews, promotions, community), Search (location-based provider discovery), Profile, and Chat.

![Low-fidelity wireframe map showing the complete client and artist flows from home through search, booking, profile, and chat](/assets/wbeauty/lofi-overview.png)

---

## Usability Testing, Round 1 (Low-Fidelity)

I ran moderated testing sessions where participants completed four core tasks — checking out a profile, booking an appointment, switching roles, and chatting with an artist — followed by a post-task questionnaire.

![The four usability testing tasks and post-task questionnaire given to participants](/assets/wbeauty/usability-test-tasks.png)

**What worked:** Participants found the overall design intuitive, and specifically praised booking cancellation and visible service history. Several noted the concept's real value for students on tight budgets.

**What didn't:**

| Observed problem | What it told me |
|---|---|
| Users repeatedly tried to book from the **homepage** instead of the booking tab | The homepage's promotional content created an expectation of action, not just browsing |
| Artists struggled to find the **shop** | The shop was buried; providers' key feature had no visibility |
| Users saw their **token balance** but didn't understand what tokens were for | The token system needed to explain itself in context |
| Some users missed the **bottom tab bar** entirely | Navigation hierarchy was too weak |
| Users expected **response-time info** and chat entry points under posts | Trust requires setting communication expectations |

### Iterations after Round 1

Rather than fighting user instincts, I redesigned around them:

- **Embraced the homepage-booking behavior**: connected homepage posts and promotions directly into the booking flow, making the "wrong" path an official one
- **Split the tab bars by role**: clients get a booking-centered tab bar; artists get a shop-centered one — removing useless booking functions from the artist side and giving the shop the visibility it lacked
- Added **average reply time** to chat, **multi-artist map pins**, **booking cancellation in profile**, and increased font sizes flagged in testing

![Two screens side by side showing the pink client interface and blue artist interface with different bottom tab bars](/assets/wbeauty/figure-1-color-tabbar.png)

---

## High-Fidelity Design

For the high-fidelity Figma prototype, I designed the complete visual system:

- **Two-color role coding:** pinkish purple (#F6F0FA) for the client side, blue (#EFF3FA) for the artist side — so users always know which "mode" they're in without checking their profile. The WBeauty logo combines both colors, and tints/shades of each extend across their respective flows.
- **Consistency systems:** Istok Web as the single typeface; figure-ground principle applied to all clickable elements; internal consistency via shared tab bar structure and left/right padding alignment; external consistency via Google's icon library, so flows borrow recognizable patterns (like the cart icon) from apps users already know — improving memorability.
- **New functionality at hi-fi:** separated role-based tab bars, shop item detail pages, and in-profile booking cancellation.

![High-fidelity booking flow screens: browsing artists, selecting a time slot, and confirming the appointment](/assets/wbeauty/hifi-booking-flow.png)
![High-fidelity artist-side screens: the toolkit shop and the chat interface](/assets/wbeauty/hifi-shop-chat.png)
![QR attendance screen showing a code for the client to scan, confirming the appointment and transferring 10 tokens](/assets/wbeauty/qr-attendance.png)

<!-- FIGMA EMBED
  Client flow (main, embedded): <iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="450" src="https://embed.figma.com/proto/tyVAXtCbX5tlPiVcf8ah3w/P5-High-fidelity-prototype?node-id=4-7&p=f&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=4%3A7&show-proto-sidebar=1&embed-host=share" allowfullscreen></iframe>
  Artist flow (secondary link): <iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="800" height="450" src="https://embed.figma.com/proto/tyVAXtCbX5tlPiVcf8ah3w/P5-High-fidelity-prototype?node-id=52-333&p=f&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=52%3A333&show-proto-sidebar=1&embed-host=share" allowfullscreen></iframe>
  Build: embed the client flow as an iframe (mounted per DESIGN_GUIDELINES.md §7 —
    --radius, 1px --border, loading="lazy").
  Beside it: a text link "Explore the artist side →" opening the artist URL in a new tab.
  Below it: caption "Tip: tap the profile icon to switch between client and artist modes."
  Fallback link next to the embed: "Open prototype in Figma →" (client URL).
-->

---

## Usability Testing, Round 2 (High-Fidelity)

I tested the hi-fi prototype with a new group of four target users, using the same tasks as Round 1 so results were comparable.

**Results:**

| Task | Success rate | Notes |
|---|---|---|
| Book an appointment & view a profile | 4/4 (100%) | 3 of 4 users started from the homepage — validating the Round 1 decision to make that path official |
| Switch between client and artist roles | 4/4 (100%) | Users called the role switch intuitive and specifically cited the color differentiation as helpful |
| Use the chat function | 3/4 (75%) | The one failure came from overlooking the tab bar — a remaining navigation hierarchy issue |

**Overall: 92% task success (11/12 attempts).** The color-separated dual-role system — the project's riskiest and most distinctive design bet — was the feature users understood most clearly.

The failures were as informative as the successes: users still gravitated toward the homepage for everything, and the tab bar still lacked hierarchy. The interface was clear, but the *navigation system* needed stronger, more explicit flows to prevent unintended routes.

---

## What I'd Do Next

- **Apply Fitts's Law to touch targets** — back buttons in particular tested as too small; larger targets and spacing would improve accessibility
- **Make profile icons clickable**, not just profile names — a small mismatch with user expectations that caused real friction
- **Promote the toolkit shop on first launch** for artists, so earned tokens have an obvious purpose from day one
- **Close the chat-to-booking loop** — after choosing to chat from the booking confirmation page, users had no clear path back; a persistent navigation option would let them keep context

---

## Reflection

Three things this project taught me:

1. **Users tell you the real information architecture.** When 3 out of 4 users book from the homepage, the homepage *is* the booking entry point — the answer isn't better signposting to the "correct" path, it's redesigning the map.
2. **Trust is a design material.** Verification, reviews, reply times, and chat-before-booking weren't features on a list; they were the answer to the single question every interviewee asked in some form: *"How do I know I can trust this person?"*
3. **Leading a small team means owning the through-line.** With only two people, I carried the project's vision from first interview to final metric — which meant every design decision had to trace back to something a user actually said or did.

---

*[ADD: closing line linking to next case study or contact]*
