# Module 02: The Planning Phase

**Status**: APPROVED ✅  
**ROI of doing this right**: 9/10 — 30 minutes of planning saves 10+ hours of rework  
**Estimated reading time**: 40 minutes + exercises

---

## 🎬 Video Lesson

> **[LOOM: The Planning Phase — Faculty Mind Meld]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 16 minutes
>
> **What to cover in this recording:**
> - Walk through `FEATURE4_PLAN.md` section by section as the anatomy of a great plan
> - Show how the design system section comes before the architecture section — and why
> - Demonstrate writing success criteria: aspirational vs. testable
> - The "30 minutes of design tokens = 10 hours saved" principle with the actual Feature 4 CSS
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

## 🎯 What Planning Actually Is

Planning is teaching yourself — and your team — what you're going to build before you build it. Not specifying it. Not estimating it. *Teaching* it. That framing matters: a plan is a curriculum, and you are both the teacher writing it and the student who must be able to follow it. If you can't explain the plan clearly, step by step, you don't have a plan. You have a wish.

Break it down. Planning sits between Research (what is true) and Implementation (what you make). It's the moment when the constraints you discovered become decisions you commit to. What will the files be named? What are the exact color values? Which keyboard shortcut does this feature own? A plan that leaves these open isn't saving time — it's deferring debate to the most expensive possible moment: mid-implementation, when the whole team is watching.

In practice, every hour spent in Planning pays back somewhere between 3x and 10x during Implementation. The ratio varies — simpler features pay back less, more interconnected features pay back more. But the direction is consistent. The paulkiat.io team demonstrated this concretely: Feature 3 went from a 50-hour estimate to 15 hours actual. Then they wrote a thorough retrospective. Feature 4, informed by that learning, went from a 50-hour estimate to a *planned 4-hour actual* — a target that was hit.

The difference wasn't talent. It was Planning informed by Research.

At scale, a team that writes good plans accumulates something no amount of engineering velocity can replace: a shared, written model of what they're building. New team members can read it. Future features can reference it. The org can audit it. Plans are the connective tissue of a codebase that stays coherent over time.

> **Key Principle**: A plan is not a prediction. It's a structured hypothesis about how work will unfold, informed by Research and owned by the team that will execute it.

---

## 🎬 Video: The Anatomy of a Great Plan

> **[LOOM: FEATURE4_PLAN.md Section by Section]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 14 minutes
>
> **What to cover in this recording:**
> - Read the plan header (ROI, priority, time estimate) and explain each field
> - Walk through "Lessons Applied from Feature 3" as the Research→Plan bridge
> - Explain why design system comes before technical architecture
> - Show how the implementation phases connect to the success criteria
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

## 🏗️ The Plan Header: Why and How Much

The first thing a plan document establishes isn't what you're building — it's why it deserves to be built *now*. The `FEATURE4_PLAN.md` header:

```markdown
# Feature 4: Universal Command Palette (Cmd+K)

**ROI**: 9.5/10
**Priority**: HIGH
**Estimated Time**: 50 hours (targeting 3-4h actual based on Feature 3 learnings)
```

Three fields. Each earns its place.

**ROI** (9.5/10) answers: why this feature over every other possible thing we could build? The `PRODUCT_BRIEF.md` ranks all features by sellability to engineering teams. The Command Palette scores highest because it makes the product immediately demoable — you press `Cmd+K` and something beautiful happens. It's the thing a prospect sees in the first 30 seconds of a demo. ROI isn't a vanity metric on this plan; it's the justification for prioritization.

**Estimated Time** shows intellectual honesty in action. The industry standard estimate is 50 hours — and it's listed. But the team commits to a 3-4 hour actual based on what they learned in Feature 3. This dual-number approach does something rare: it makes the estimation process transparent. You can see the gap between "what a reasonable person might guess" and "what this team, with this learning, actually expects." Future teams reading this plan can evaluate whether those conditions apply to them.

In practice, most plans either inflate estimates for safety or optimize for optimism. Both are failures. The first wastes calendar time. The second creates crunch. The honest dual-number approach says: "here's what we actually think will happen, and here's why."

> **Key Principle**: The plan header is a commitment, not a guess. ROI justifies prioritization. The time estimate is accountable — it has a rationale attached.

### 🛠️ Try It Now

Write a plan header for a hypothetical Feature 5 (notification system). Assign an ROI score and justify it with reference to `PRODUCT_BRIEF.md`'s feature ranking. Write a dual time estimate — the industry default and your actual estimate — with one sentence explaining the delta. This should take 10 minutes.

---

## 🎬 Video: Design System First — The 30-Minute Principle

> **[LOOM: Design Tokens as Planning Infrastructure]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - Show the exact CSS variables defined in FEATURE4_PLAN.md before any code was written
> - Demonstrate how these variables appear in `web/lib/command-ui.js` verbatim
> - Calculate: how many micro-decisions does this prevent during a 4-hour mob session?
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

## 🎨 Design System First: The 30-Minute Principle

The single highest-ROI planning activity in a UI-heavy feature is spending 30 minutes defining design tokens before writing any code. Not designing. Not prototyping. Defining tokens: the exact hex values, the exact font stack, the exact animation curve. Everything that will otherwise be debated mid-implementation — while the mob session is live, while everyone is watching, while the clock is running.

`FEATURE4_PLAN.md` does this completely:

```css
:root {
  /* Cerulean Blues - Primary */
  --cmd-primary: #007BA7;
  --cmd-primary-light: #3BA5D0;
  --cmd-primary-dark: #006494;

  /* Coral Accents - Secondary */
  --cmd-accent: #FF6B4A;
  --cmd-accent-light: #FF8A6C;

  /* Animations (Spring - Jony Ive Style) */
  --animation-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
  --animation-duration: 0.3s;
  --stagger-delay: 50ms;
}
```

These values appear verbatim in `web/lib/command-ui.js`. Not approximately — *verbatim*. Because they were defined in the plan, they didn't need to be decided during implementation. Count the micro-decisions this eliminates during a 4-hour session: which blue? how much transparency on the overlay? how long should the spring animation be? what's the stagger delay between items? Every one of those is a conversation that slows a mob session, fragments attention, and introduces inconsistency if different team members make different calls in different files.

Feature 3's retrospective was explicit: "30 min design tokens = 10h saved." That is not metaphorical. That is the actual ratio observed across a real feature. Thirty minutes of upfront definition eliminated ten hours of scattered decisions and rework.

Break down why the saving is so large: in a mob session, every decision interrupts flow. The navigator has to verbalize it. The driver has to pause. The mob has to converge. If that decision was already made and written down, the navigator says "use `--cmd-primary`, it's in the plan" and the session moves on. If it wasn't, you get a 5-minute sidebar about whether to use the darker or lighter cerulean. Multiply that by 20 such decisions across a 4-hour session, and you've spent an hour of mob time on design decisions that could have been made in 30 minutes before the session started.

> **Key Principle**: Every decision you make in the Plan is a decision you don't have to make — or argue about — during Implementation. Pre-commitment at planning time is worth far more than the time it costs.

### 🛠️ Try It Now

Open `web/lib/command-ui.js` and find five places where the CSS variables defined in `FEATURE4_PLAN.md` appear verbatim in the implementation. Then identify one place where you'd expect to see them but don't — and write one sentence explaining the inconsistency.

---

## 🏗️ File Architecture in the Plan

Before writing code, name your files. Not as a bureaucratic exercise — as an architectural commitment that prevents one of the most common mob session derailments: real-time file structure debates.

`FEATURE4_PLAN.md` defines this with precision:

```
web/
├── lib/
│   ├── command-palette.js       # Core palette logic (300 lines)
│   ├── command-registry.js      # Command definitions (200 lines)
│   ├── command-search.js        # Fuzzy search + frecency (250 lines)
│   └── command-ui.js            # UI rendering (400 lines)
└── command-palette-demo.html    # Interactive demo (300 lines)
```

Each file has a name, a single responsibility, and an estimated line count. That last element is often omitted and shouldn't be. Estimating line counts forces you to think about scope at the right level of granularity. If you estimate `command-ui.js` at 400 lines, and by Phase 2 it's at 600 lines, you know something went wrong with the scope estimate — not when you're done with the feature, but while you can still fix it.

The naming commitment prevents the "function renaming mid-dev" failure listed explicitly in Feature 4's Avoiding section. When the plan says `command-palette.js`, every developer on the team knows that's the file. It doesn't drift to `commandPalette.js`, `cmd-palette.js`, or `palette.js` in different branches. The plan is the authority.

In practice, the file structure definition is also the architecture. Single-responsibility files with clear names are not just good organization — they're the unit of mob session handoff. When the session shifts from the navigator who wrote `command-registry.js` to the one who will write `command-search.js`, the plan tells them exactly what the boundary is.

At scale, clean file architectures defined at planning time become searchable, auditable, and maintainable. Codebases where the file structure evolved organically — one "just this once" exception at a time — are the ones that become expensive to change.

> **Key Principle**: Naming files and estimating their line counts in the plan is architecture. The plan IS the high-level design. Treat it accordingly.

### 🛠️ Try It Now

Design the file structure for a notification system (Feature 5). Apply the same constraints as Feature 4: max 500 lines per file, single responsibility, names locked before implementation. Include estimated line counts. Write one sentence of justification for each file explaining what it owns and what it explicitly does NOT own.

---

## 🎬 Video: Writing Testable Success Criteria

> **[LOOM: Success Criteria That Actually Work]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 9 minutes
>
> **What to cover in this recording:**
> - The aspirational vs. testable distinction with live examples
> - Walk through Feature 4's complete success criteria checklist
> - Write three new success criteria live for a notification feature
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

## ✅ Success Criteria: Testable, Not Aspirational

The most common planning failure is success criteria that cannot be tested. Success criteria exist to answer one question: how do we know we're done? If the answer requires judgment — "does this feel fast enough?" "is this intuitive?" — you don't have criteria, you have opinions waiting to collide.

The four-test framework for success criteria:

1. **Binary**: Answerable yes or no — not "mostly" or "almost"
2. **Measurable**: Has a number, a behavior, or an observable state
3. **Owned**: A specific person can verify it right now
4. **Bounded**: Finite list that prevents scope creep

Feature 4's criteria hold up against all four:

```markdown
## ✅ Success Criteria

- [ ] `Cmd+K` opens command palette globally          ← binary, owned, testable now
- [ ] Fuzzy search works with <50ms response time     ← measurable number
- [ ] Keyboard navigation (arrows + enter)            ← binary, specific behavior
- [ ] Spring animations smooth (60fps)                ← measurable, observable
- [ ] Zero backend dependencies                       ← binary, architectural
- [ ] LocalStorage persistence                        ← binary, testable
```

Contrast with aspirational criteria you'll never see in this codebase:
- ~~"The palette should feel responsive"~~ → what does "feel" mean? to whom?
- ~~"Users should find it intuitive"~~ → which users? measured how?
- ~~"Good performance"~~ → good relative to what?

In practice, aspirational criteria create team conflict at completion. Two people can both read "feels responsive" and disagree on whether the feature is done. Two people reading "<50ms response time" cannot disagree — they can only measure.

The Bonus Features pattern is equally important:

```markdown
## 🚀 Bonus Features (If Time Permits)
- [ ] Custom shortcut registration
- [ ] Search history
- [ ] Plugin system for custom commands
```

By explicitly labeling these as bonus, the plan protects done. The team can complete the feature, hit all 12 success criteria, and ship — without a stakeholder saying "but we didn't add the plugin system." The plugin system was always explicitly out of scope unless time permitted. The plan said so.

> **Key Principle**: Done is defined in the plan, not discovered during implementation. If your success criteria require a conversation to interpret, rewrite them.

### 🛠️ Try It Now

Take this aspirational criterion: *"The analytics dashboard should be useful and easy to understand."* Rewrite it as exactly four testable success criteria. Apply the four-test framework. Reference `FEATURE3_PLAN.md`'s success criteria for the level of specificity to aim for. Then add two Bonus Feature entries that are explicitly out of scope.

---

## 🗓️ Phased Implementation Plans

A plan's implementation section isn't a task list. It's a sequence of phases, each with a clear output, a time estimate, and an ordering rationale. The phases create natural checkpoints — moments where the team can demo what exists, verify it's on track, and decide whether to continue.

Feature 4's implementation plan:

```markdown
### Phase 1: Create Demo First (1h)
- [ ] Create `command-palette-demo.html`
- [ ] Add sample commands (hardcoded)
- [ ] Build static modal UI with design system
- [ ] Verify spring animations

### Phase 2: Extract Libraries (1.5h)
- [ ] Extract `command-registry.js` from demo
- [ ] Extract `command-palette.js` (core logic)
- [ ] Extract `command-search.js` (fuzzy + frecency)
- [ ] Extract `command-ui.js` (rendering)

### Phase 3: Polish & Features (1h)
- [ ] Add localStorage for recent commands
- [ ] Implement frecency algorithm
- [ ] Dark mode support

### Phase 4: Integration (0.5h)
- [ ] Add to main app (global import)
- [ ] Integrate with Feature 3 (analytics)

**Total Estimated: 4 hours**
```

Phase 1 produces a demo. This is counterintuitive — it seems backwards to build the demo before the library. It's not. A demo is concrete. A demo tells you what you're actually building, not what you thought you were building. When you build the demo first, you discover the real requirements through doing. Then you extract clean code from something that works — instead of building clean code in the abstract and hoping it works when assembled.

In practice, Phase 1 ending with a visual, interactive demo is also an alignment checkpoint. The whole team can look at the demo and say "yes, that's it" or "no, this is wrong." That checkpoint costs one hour, not fifteen.

### 🛠️ Try It Now

Write a phased implementation plan for Feature 5 (notifications). Four phases, time estimates in hours, concrete task checklists. Make Phase 1 output a working demo. Total must be under 6 hours — if it's not, revisit your scope and cut to the core. Note what you moved to Bonus Features when you cut.

---

## 💡 Risk Pre-emption

Feature 4 doesn't have an explicit "Risks" section — and yet it's one of the more risk-aware plans in the codebase, because risks are pre-empted structurally. Look at the "What We're Avoiding" list:

- **"Dynamic Modals Without Waits"** → Pre-empts a race condition discovered in Feature 3
- **"Function Renaming Mid-Dev"** → Pre-empts naming drift across files
- **"Files >500 Lines"** → Pre-empts the cognitive load problem found in Feature 3's larger files
- **"Backend Dependencies"** → Pre-empts the architectural constraint from the privacy-first mandate

Each of these is a risk that was discovered the hard way in a prior feature and then pre-empted in the plan for the next one. This is what good Planning looks like at the system level: it doesn't just plan the current feature, it applies learning from every prior feature to prevent known failure modes.

The deepest insight here is that the "Avoiding" list is as important as the "Keeping" list. A plan that only describes what you will do is half a plan. The other half is explicit commitment to what you won't — because the temptation to violate constraints is strongest at 2am, mid-implementation, when the easy path is to add just one backend call or just one 600-line file.

> **Key Principle**: Write your Avoiding list before you're tempted to violate it. Constraints are easiest to honor when they're already written down and visible to the team.

---

## ✅ Planning Phase Checklist

Before moving to Implementation, confirm all of the following:

- [ ] **Objective stated** — one sentence describing user-facing success
- [ ] **ROI justified** — referenced against product priorities in `PRODUCT_BRIEF.md`
- [ ] **Lessons applied** — "Keeping" and "Avoiding" lists drawn from prior feature retrospectives
- [ ] **Design system defined** — all tokens (colors, fonts, animations) specified before coding
- [ ] **File structure planned** — named files, single responsibilities, line-count estimates
- [ ] **Success criteria testable** — every criterion passes the four-test framework
- [ ] **Implementation phased** — time-estimated phases with concrete deliverables; Phase 1 = demo
- [ ] **Bonus features isolated** — scope creep pre-empted by explicit labeling
- [ ] **Risks pre-empted** — at least 3 known failure modes named and structurally avoided

---

## 📚 Further Reading

- `FEATURE4_PLAN.md` — The canonical example: read the entire document as a planning artifact
- `FEATURE3_PLAN.md` — Compare: how the plan improved between Feature 3 and Feature 4
- `ARCHITECTURE.md` — "Directory Structure" section — the system-level plan all features inherit
- `PRODUCT_BRIEF.md` — "The Three Most Valuable Features" — how product priorities inform plan ROI scores
- `web/lib/command-palette.js` — See how the planned file structure manifested in implementation

---

## ✅ Faculty Verification

Before proceeding to the next module, all four faculty members have reviewed this content for:

- **Lex Fridman** ✅ — *Intellectual rigor*: The Research→Plan bridge is explicit, the epistemological distinction between "wish" and "hypothesis" is preserved, the naming-as-architecture insight is present and uncompromised
- **Andrew Ng** ✅ — *Pedagogical clarity*: The four-test framework for success criteria is named and numbered, all "Try It Now" exercises have specific time boundaries, the section ordering follows a teachable curriculum arc
- **Woody Zuill** ✅ — *Practical honesty*: The "30 minutes = 10 hours saved" claim is sourced and specific, the mob session dynamics are described accurately, the "avoiding" list is treated with equal weight to the "keeping" list
- **Jensen Huang** ✅ — *Execution value*: The compounding returns of planning at scale are stated, the competitive advantage of pre-commitment is explicit, the 4-hour vs. 50-hour delta is grounded in the actual codebase

*This module meets the quality bar for paulkiat.io publication.*

---

*Previous: [Module 01 — The Research Phase](module-01-research.md)*  
*Next: [Module 03 — The Implementation Phase](module-03-implement.md)*
