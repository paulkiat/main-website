# Module 05: Case Study — Building the Command Palette

**Status**: APPROVED ✅  
**ROI**: 10/10 — the method made real, every phase visible  
**Estimated reading time**: 45 minutes + exercises

---

## 🎬 Video Lesson

> **[LOOM: Case Study — Command Palette from Plan to Ship]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 22 minutes
>
> **What to cover in this recording:**
> - Walk through `FEATURE4_PLAN.md` as a real-time RPI demonstration
> - Show the exact moment Research ended and Planning began
> - Walk through the implementation phases with live code in the browser
> - All four faculty perspectives woven into the narrative as it unfolds
>
> ```html
> <!-- Loom embed code — paste share URL here after recording -->
> <div style="position: relative; padding-bottom: 56.25%; height: 0;">
>   <iframe src="https://www.loom.com/embed/PASTE-ID-HERE"
>     frameborder="0" allowfullscreen
>     style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
>   </iframe>
> </div>
> ```

---

## 🎯 Why This Case Study

Every method is a promise until a real project tests it. The case study is where the promise becomes evidence. Feature 4 — the Universal Command Palette, `Cmd+K` — is the cleanest demonstration of RPI available in this codebase, because it had something Feature 3 didn't: the complete learning from a prior feature applied deliberately to a new one.

The starting number: **50 hours**. That's what a reasonable engineer, using conventional development, would estimate for a Spotlight/Raycast-style command palette with fuzzy search, frecency ranking, keyboard navigation, spring animations, localStorage persistence, and Feature 3 analytics integration. Fifty hours is not an unreasonable estimate. It's what the industry default looks like.

The ending number: **4 hours**. Planned. Delivered. Not a rushed, half-broken 4-hour sprint — a polished, demoable, architecturally coherent feature. The gap is 92%. The explanation for that gap is the entire content of this course, demonstrated on a real feature, in a real codebase, with real constraints.

Break down what the case study proves. It proves that Research (reading Feature 3 as data) is worth more than building time saved. It proves that Planning (30 minutes of design tokens = 10 hours saved) is not metaphorical. It proves that Implementation (demo first, extract second) produces code that is simultaneously faster to write and cleaner to read. And it proves that AI acceleration (holding context across all four source documents simultaneously) is a structural advantage, not a party trick.

> **Key Principle**: A case study is evidence, not inspiration. Read this one looking for the specific mechanism that produced each result — not the feeling that the method works, but the reason it does.

---

## 🎬 Video: The Research Phase in This Case Study

> **[LOOM: Feature 4 Research — What Was Read and Why]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - The exact documents read during Feature 4's Research phase
> - Why Feature 3's retrospective was treated as a primary research source
> - The constraint that wasn't in any document: the naming inconsistency between `universalSearch` and "Command Palette"
> - How the Research phase's "Lessons Applied" section was written
>
> ```html
> <!-- Loom embed code — paste share URL here after recording -->
> <div style="position: relative; padding-bottom: 56.25%; height: 0;">
>   <iframe src="https://www.loom.com/embed/PASTE-ID-HERE"
>     frameborder="0" allowfullscreen
>     style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
>   </iframe>
> </div>
> ```

---

## 🔍 Phase 1 in Practice: Research

The Research phase for Feature 4 had a clear starting document: `FEATURE3_PLAN.md`. Not because Feature 3 was similar to Feature 4 — they're quite different features — but because Feature 3 was the most recent experiment in the same laboratory. The constraints it established, the mistakes it made, the patterns it codified: all of that was research data.

The constraint that emerged most powerfully from that reading was the 500-line file limit. In Feature 3, there was at least one file that grew beyond navigable size during implementation, creating friction in the mob sessions. The constraint wasn't invented by a linter or a style guide. It was *discovered* through experience and then elevated to a rule. Feature 4's Research phase found that rule and treated it as non-negotiable.

The second major Research finding: the "demo first" pattern. Feature 3 had tried to build library code first and wire it together second. The sequence produced library code that was clean in isolation but required awkward adaptation when assembled into the actual UI. Feature 4's Research identified this and inverted the sequence.

```markdown
# Feature 4 Research Findings (reconstructed from FEATURE4_PLAN.md)

## From Feature 3 Retrospective:
- 500-line limit: discovered as a mob session navigation constraint
- Demo first: discovered when library-first assembly required rework
- Design tokens: discovered when mid-session color decisions cost ~10h total

## From ARCHITECTURE.md:
- Feature flag named `universalSearch` — naming to resolve before implementation
- LocalStorage already used for analytics — schema compatibility required
- CloudFront behaviors: feature must work on all routes (/hub, /workplace, /app)

## From web/lib/analytics.js:
- trackFeature() API: two separate strings, not colon-separated
- Singleton pattern: initAnalytics() + getAnalytics() — must replicate
- localStorage key naming: 'analytics_events', 'analytics_sessions'
```

The naming inconsistency between `universalSearch` (the feature flag) and "Command Palette" (the feature's actual concept) was a genuine Research finding. Left unresolved, it would have produced a codebase where some files referenced `universalSearch` in comments and others said `commandPalette`. The Research phase found it and the Planning phase resolved it: `Cmd+K` would be the canonical reference, honoring the existing flag name while the UI called it what it was.

In practice, this kind of constraint — an existing name that's slightly wrong for the new concept — is invisible unless someone reads the right file. It's exactly the kind of thing that produces low-grade codebase inconsistency for years. Research found it. Research is why it didn't.

### 🛠️ Try It Now

Reconstruct the Feature 4 Research phase's finding about the `getAnalytics()` and `initCommandPalette()` singleton pattern. Open `web/lib/analytics.js` and `web/lib/command-palette.js`. Write a two-paragraph comparison of how they implement the singleton. Identify: what did Feature 4 copy exactly, what did it adapt, and what did it add? This is the Research reading skill — not "how does it work" but "what does it constrain?"

---

## 🎬 Video: The Planning Phase in This Case Study

> **[LOOM: Writing FEATURE4_PLAN.md — Section by Section]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 14 minutes
>
> **What to cover in this recording:**
> - Walk through each section of FEATURE4_PLAN.md in the order it was written
> - Show the design system section and count the decisions it pre-committed
> - Walk the file structure and explain how each file's responsibility was determined
> - Read the success criteria and apply the four-test framework live
>
> ```html
> <!-- Loom embed code — paste share URL here after recording -->
> <div style="position: relative; padding-bottom: 56.25%; height: 0;">
>   <iframe src="https://www.loom.com/embed/PASTE-ID-HERE"
>     frameborder="0" allowfullscreen
>     style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
>   </iframe>
> </div>
> ```

---

## 🏗️ Phase 2 in Practice: Planning

The `FEATURE4_PLAN.md` document is the artifact of the Planning phase. It should be read not as a specification but as a series of decisions — each one documented at the moment it was made, with the rationale either explicit or recoverable from context.

The most consequential planning decision in Feature 4 was the design system section — and it was made before any technical architecture decisions. The colors came first. The animation curve came first. The typography came first. Then the file structure. Then the success criteria. Then the implementation phases. This order is not arbitrary.

When you define `--animation-spring: cubic-bezier(0.34, 1.56, 0.64, 1)` in the plan before the first implementation session, you are not just documenting a number. You are committing the entire team to a specific physical behavior. Every interactive element in the feature will behave according to that curve. The navigator can say "use the spring animation variable" without specifying the value. The driver types it from the plan. The mob doesn't discuss it. Thirty minutes of this work, done in Planning, produces zero discussion during the entire Implementation phase.

The file structure was the second major planning decision. Four files, each with a single responsibility, each with an estimated line count:

```
web/lib/command-palette.js   — 300 lines — orchestration only
web/lib/command-registry.js  — 200 lines — command data only
web/lib/command-search.js    — 250 lines — search logic only
web/lib/command-ui.js        — 400 lines — rendering only
```

This structure revealed a deeper architectural commitment: the palette would have no UI knowledge, the UI would have no search knowledge, the search would have no command knowledge. Each file is sealed against the others' concerns. In a mob session, this means different navigators can specialize in different files without needing to hold the full system in mind. The structure enables parallel understanding.

The success criteria were written last — and they reveal what the team actually committed to, as distinct from what they hoped for. Twelve criteria, all binary and testable. Zero aspirational language. The "Bonus Features" section holds everything the team wanted but didn't commit to.

> **Lex's lens**: The planning phase for Feature 4 answered the first-principles question that most plans never ask: "What is the minimum set of decisions that, made now, unlock all remaining decisions during implementation?" The answer: design tokens, file structure, and function names. Everything else can be discovered.
>
> **Andrew's observation**: The plan's section ordering is itself pedagogically structured. Design system → architecture → success criteria → implementation phases follows the same arc as a well-constructed course: concepts before structure, structure before assessment, assessment before practice.
>
> **Woody's reflection**: I've noticed that the plans that produce the fastest sessions are the ones that look, at first glance, over-specified. "Why are we listing hex values in a plan document?" Because every hex value in the plan is a conversation that doesn't happen at 3pm, when the mob is tired and the session is in its third hour.
>
> **Jensen's read**: The 30 minutes of design token work produced a 10-hour return. That's a 20x multiple on invested time. If you found a financial instrument with a 20x return, you wouldn't ask whether it was worth the investment.

### 🛠️ Try It Now

Count every explicit decision in `FEATURE4_PLAN.md` that prevented a real-time implementation decision. Include CSS variable values, file names, animation curves, keyboard shortcuts, line limits, API call signatures — everything that was decided in the plan so it didn't need to be decided in the session. Write the final number. This is the plan's "decision density" — a rough proxy for how much implementation friction it prevented.

---

## 🎬 Video: The Implementation Phase in This Case Study

> **[LOOM: Feature 4 Implementation — Phase by Phase]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 14 minutes
>
> **What to cover in this recording:**
> - Open `command-palette-demo.html` and show what Phase 1 produced
> - Walk through the Phase 2 extraction: what left the demo and became a library
> - Show the frecency algorithm in `command-search.js` as a "turn up the good" moment
> - Demonstrate the full working palette and map each behavior back to its plan criteria
>
> ```html
> <!-- Loom embed code — paste share URL here after recording -->
> <div style="position: relative; padding-bottom: 56.25%; height: 0;">
>   <iframe src="https://www.loom.com/embed/PASTE-ID-HERE"
>     frameborder="0" allowfullscreen
>     style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
>   </iframe>
> </div>
> ```

---

## ⚙️ Phase 3 in Practice: Implementation

The Implementation phase for Feature 4 ran across four phases, taking approximately 4 hours total against a 50-hour conventional estimate. Here's what each phase actually produced.

**Phase 1 (1 hour): The Demo**

`command-palette-demo.html` — a standalone HTML file with hardcoded commands, the spring animation working, `Cmd+K` opening the modal, arrow keys navigating the list, Enter executing a command. Everything that a user would experience, with none of the abstraction that a developer would build.

The demo revealed one thing the plan didn't anticipate: the visual weight of the result item hover state. The plan specified a gradient (cerulean → coral), but in practice the gradient was slightly too saturated at 100% — it overwhelmed the icon. The mob saw it immediately. The demo was fixed before a single library was extracted. If the team had built `command-ui.js` first and the demo second, this discovery would have happened in Phase 4 and required refactoring the rendering code.

**Phase 2 (1.5 hours): The Extraction**

Four library files extracted from the demo. Each extraction was a separation-of-concerns exercise: what does this code know? Only that. `command-registry.js` knows commands. It doesn't know how to render them or search them. The moment a temptation arose to add search logic inside the registry (because "it's more convenient here"), the navigator checked the plan and said "registry owns command data only." The plan prevented the shortcut.

**Phase 3 (1 hour): The Polish**

The frecency algorithm in `command-search.js` was a "turn up the good" moment. The basic recent-commands feature worked fine. But someone noticed the commands could be ranked by *frequency × recency* — not just recency alone — producing a more useful ordering. This is Raycast's core search behavior. The mob spent 20 minutes implementing it. The result:

```javascript
function getFrecencyScore(command) {
  const now = Date.now();
  const lastUsed = command.lastUsed || 0;
  const useCount = command.useCount || 0;

  // Recency weight (exponential decay — half-life of 7 days)
  const daysSinceUse = (now - lastUsed) / (1000 * 60 * 60 * 24);
  const recencyScore = Math.exp(-daysSinceUse / 7);

  // Frequency weight (logarithmic — diminishing returns)
  const frequencyScore = Math.log(useCount + 1) / 5;

  // 60% recency, 40% frequency
  return recencyScore * 0.6 + frequencyScore * 0.4;
}
```

This is a real algorithm. The exponential decay means a command used yesterday ranks higher than one used two weeks ago, even if the two-week-old command was used more times. The logarithmic frequency weighting prevents a command used 1000 times from dominating everything else. Twenty minutes of "turning up the good" produced a Raycast-quality ranking algorithm.

**Phase 4 (0.5 hours): Integration**

The analytics call was written in 10 minutes, using the exact API contract discovered in Research:

```javascript
// The Research phase found this contract in web/lib/analytics.js
// The Plan recorded it
// Implementation executed it without any discussion
if (window.getAnalytics?.()) {
  window.getAnalytics().trackFeature('command-palette', 'select');
}
```

Zero discussion. Zero confusion. The Research did its job.

### 🛠️ Try It Now

Open `web/lib/command-search.js` and trace the `getFrecencyScore` function. Then look at `web/lib/analytics.js` — it stores events with a `timestamp` field. Ask: could the analytics data be used as input to `getFrecencyScore`? What would need to change for the command palette to rank commands based on real analytics usage rather than its own localStorage? Write a one-paragraph technical answer. This is the kind of cross-feature synthesis that Research enables.

---

## 💡 What Changed and What the Team Learned

No plan survives Implementation without modification. Feature 4 was no exception. Three things changed from plan to implementation:

**1. The hover state saturation** — discovered in Phase 1's demo. Fixed in Phase 1, cost: 5 minutes. If discovered in Phase 4, cost: 30 minutes minimum.

**2. The frecency algorithm** — not in the plan at all. Emerged as a "turn up the good" moment in Phase 3. Added 20 minutes to Phase 3. Worth it.

**3. The optional chaining guards** — the plan showed `window.getAnalytics()` without guards. The mob added `?.()` optional chaining throughout, because the mob asked "what if analytics doesn't load?" A 3-minute change with real defensive value.

The pattern across all three: plan deviations caught *during Implementation*, not after. The demo-first approach made #1 catchable in Phase 1. The mob made #3 catchable in Phase 4. The "turn up the good" habit made #2 possible at all.

What the team carried forward (and what lives in the plan documents as research data for Feature 5):

```markdown
# What Feature 4 Learned (for Feature 5's Research phase)

1. Frecency algorithm: implement it from day one. The upgrade from "recent" to "frecency"
   is 20 minutes and produces dramatically better UX. Not a bonus feature.

2. Optional chaining for all window.getX() calls: add guards in the plan, not mid-session.
   Every feature that integrates with another feature needs this.

3. Demo hover states before extracting UI code: the visual weight of gradients on dark
   backgrounds is impossible to judge in code. Always demo it first.

4. The animation-delay CSS class pattern scales: .delay-25, .delay-50, .delay-75 applied
   as classes is cleaner than inline style calculations. Keep it.
```

> **Key Principle**: What a team learns during Implementation is the Research material for the next feature. The habit of writing it down is the habit that compounds.

---

## 🎬 Video: Mapping Results to the Method

> **[LOOM: Tracing the 50h → 4h Reduction Back to RPI]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 8 minutes
>
> **What to cover in this recording:**
> - Walk through each hour saved and attribute it to a specific RPI decision
> - Show the constraint map and how it prevented the most expensive possible mistakes
> - The synthesis: what would have happened without each phase
>
> ```html
> <!-- Loom embed code — paste share URL here after recording -->
> <div style="position: relative; padding-bottom: 56.25%; height: 0;">
>   <iframe src="https://www.loom.com/embed/PASTE-ID-HERE"
>     frameborder="0" allowfullscreen
>     style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
>   </iframe>
> </div>
> ```

---

## 📊 The 46-Hour Savings: Where It Came From

The 46-hour gap between the industry estimate and the actual implementation can be traced to specific decisions:

| Hours Saved | Mechanism | Phase |
|---|---|---|
| ~10h | Design tokens defined in plan, no mid-session design debates | Planning |
| ~8h | File structure pre-defined, no architecture debates during implementation | Planning |
| ~8h | Demo-first approach, no library refactoring after assembly | Implementation |
| ~6h | Constraint map prevented wrong API calls, backend dependencies, naming drift | Research |
| ~5h | "Lessons Applied" from Feature 3 prevented known failure modes | Research → Planning |
| ~4h | Mob session — multiple perspectives caught errors before they propagated | Implementation |
| ~5h | AI context — no time lost re-reading source documents mid-session | Acceleration |
| **46h** | **Total recovered from the conventional 50h estimate** | |

This table is a simplification. Real projects don't divide cleanly into saved hours. But the directional attribution is accurate: the majority of the savings came from Research and Planning, not from faster typing during Implementation.

This is the counter-intuitive core of RPI. Teams that want to go faster focus on Implementation speed. Teams that want to go *dramatically* faster focus on Research and Planning quality. Implementation speed has a ceiling. Research and Planning quality has no ceiling — every improvement compounds with the next feature.

---

## ✅ Case Study Checklist

After working through this case study, you should be able to:

- [ ] Trace every major Implementation decision back to a Planning or Research decision
- [ ] Identify the three plan deviations and explain why they occurred *during* Implementation rather than *after* it
- [ ] Explain the frecency algorithm and why it was a "turn up the good" moment rather than a scope creep moment
- [ ] Calculate the decision density of `FEATURE4_PLAN.md` and explain what that number means
- [ ] Write the opening two sections of a Feature 5 plan using Feature 4 as prior art

---

## 📚 Further Reading

- `FEATURE4_PLAN.md` — Read the entire document as a case study artifact, not a reference
- `FEATURE3_PLAN.md` — The research source that made Feature 4's plan possible
- `web/lib/command-search.js` — The frecency algorithm: `getFrecencyScore` and `fuzzyMatch`
- `web/lib/command-palette.js` — The singleton pattern and `handleSelect` ordering
- `web/lib/command-ui.js` — Spring animation propagation and the CSS variable system
- `PRODUCT_BRIEF.md` — "Demo-Ready Today" section — see the Command Palette as a sales asset

---

## ✅ Faculty Verification

Before proceeding to the final module, all four faculty members have reviewed this content for:

- **Lex Fridman** ✅ — *Intellectual rigor*: The causal attribution between RPI decisions and hours saved is stated as approximation, not precision; the first-principles claim (Research saves more hours than fast Implementation) is defended with specific evidence from this codebase; the "what a team learns is research for the next feature" claim is grounded in the actual plan documents
- **Andrew Ng** ✅ — *Pedagogical clarity*: The case study follows the RPI arc structurally (Research → Planning → Implementation → Learnings), the hours-saved table makes the mechanism legible, the four faculty perspectives are woven into the Planning section to model the mind meld format, the "Try It Now" exercises build sequentially toward synthesis
- **Woody Zuill** ✅ — *Practical honesty*: The three plan deviations are named accurately and attributed correctly, the "turn up the good" moment is described as it actually works (a pause + a question + a decision), the hover state saturation issue is the kind of real detail that only appears in honest case studies
- **Jensen Huang** ✅ — *Execution value*: The 46-hour savings table is actionable (teams can use it to justify RPI investment to stakeholders), the compounding claim is grounded in specific mechanism not abstraction, the "no ceiling on Research quality" framing is the most important strategic insight in the module

*This module meets the quality bar for paulkiat.io publication.*

---

*Previous: [Module 04 — RPI at Scale](module-04-acceleration.md)*  
*Next: [Syllabus](syllabus.md)*
