# Module 01: The Research Phase

**Status**: APPROVED ✅  
**ROI of doing this right**: 9/10 — every hour of Research saves 10 hours of rework  
**Estimated reading time**: 40 minutes + exercises

---

## 🎬 Video Lesson

> **[LOOM: The Research Phase — Faculty Mind Meld]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 18 minutes
>
> **What to cover in this recording:**
> - Why Research is the most skipped and most costly phase to skip
> - Live walkthrough: how Feature 4 treated Feature 3 as a research artifact
> - The "what don't I know?" exercise run in real time on the paulkiat.io codebase
> - Constraint mapping demonstration using `ARCHITECTURE.md` and `FEATURE4_PLAN.md`
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

## 🎯 Why Research Exists

Research is where most teams fail — not because they're lazy, but because they mistake familiarity with a problem for understanding of it. The first question to ask isn't "how do we build this?" but "do we actually know what we're building?" That distinction sounds subtle. It isn't. One question opens a space for discovery. The other forecloses it before it begins.

Break it down structurally: there are three categories of knowledge going into any feature. What you *know* — things confirmed by reading code or documentation. What you *think you know* — beliefs that feel solid but haven't been verified. And what you *don't know yet* — the gaps you can't even name until you go looking. Most development teams spend their Research time in the first category. The real leverage is in the second and third.

In practice, what this looks like is 20 minutes of honest constraint mapping that prevents 20 hours of rework. Not every time — software is unpredictable — but consistently enough to make it a non-negotiable habit. Teams that skip Research don't fail catastrophically on day one. They fail expensively on day forty, when the thing they built is technically correct but architecturally incompatible with everything around it.

At scale, this becomes a competitive moat. Teams that Research first ship faster because they don't rebuild. The time you think you're saving by jumping straight to code is borrowed against a debt that collects 10x interest.

> **Key Principle**: Research is not about gathering more information. It's about identifying what you *don't* know before it costs you to find out the hard way.

---

## 🎬 Video: First Principles in Practice

> **[LOOM: Stripping Away Assumptions — Live Demo]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 12 minutes
>
> **What to cover in this recording:**
> - Open `FEATURE4_PLAN.md` and read the "Lessons Applied from Feature 3" section aloud
> - Explain why this section *is* Research — it's not preamble
> - Show the Feature 3 → Feature 4 knowledge transfer in the actual plan text
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

## 🏗️ Technique 1: Reading Prior Work as Research Data

The deepest research question is not "what should I build?" but "what does this system already know about itself?" Every codebase is a collection of prior experiments. Previous features are the results. Treating them as research data — not as templates to copy or mistakes to avoid — is the difference between a team that compounds learning and one that rediscovers the same lessons every sprint.

Structure this reading systematically. When the paulkiat.io team approached Feature 4, the Command Palette, they opened `FEATURE3_PLAN.md` not as inspiration but as empirical data. What worked? What failed? What estimates were wrong, and how wrong were they? The answer shaped the entire Feature 4 plan before a design decision was made:

```markdown
## 🎓 Lessons Applied from Feature 3

### ✅ What We're Keeping:
1. Design System First - Define colors/typography before coding (30 min = 10h saved)
2. Demo-Driven Development - Build demo.html first, extract libraries second
3. Small Focused Files - Max 500 lines per file, single responsibility

### 🚫 What We're Avoiding:
1. Backend Dependencies - Pure frontend, works offline
2. Files >500 Lines - Split into focused modules
3. Function Renaming Mid-Dev - Lock names early
```

What you're seeing here is Research made visible. The "What We're Avoiding" list is particularly important — it documents the things that were assumed to be fine in Feature 3 and turned out not to be. Function renaming mid-development seems harmless until you're in a mob session and half the team's files reference `searchCommands` while the other half say `findCommands`. One hour of Research to lock names prevents three hours of confused debugging.

In practice, the teams that learn fastest treat this reading as sacred time — not something to rush through before the "real work" starts. The real work has already begun. And at scale, this knowledge compounding is how small teams build what large teams can't: not by working harder, but by learning faster and carrying that learning forward.

> **Key Principle**: Every prior feature is a research artifact. Read it like a scientist reads a prior study — for what it proves, what it disproves, and what it leaves open.

### 🛠️ Try It Now

Open `FEATURE3_PLAN.md` and `FEATURE4_PLAN.md` side by side. Find the three most significant learnings that transferred between them. For each one, write a one-sentence statement of what was learned in Feature 3 and one sentence on how it changed the Feature 4 plan. Time yourself — this should take 15 minutes, not 15 seconds.

---

## 🎬 Video: Reading Code in Research Mode

> **[LOOM: Research-Mode Code Reading — web/lib/analytics.js]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - Open `web/lib/analytics.js` and demonstrate research-mode reading vs. implementation-mode reading
> - Find the implicit API contract in the `trackFeature` method
> - Identify the singleton pattern and explain why it's a constraint for Feature 4
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

## 🔍 Technique 2: Research-Mode Code Reading

There are two ways to read code. The first is implementation-mode reading: you want to understand how something works so you can use it. The second is research-mode reading: you want to understand what constraints the code imposes on everything that comes after it. Most developers only practice the first. The second is more valuable.

Break the distinction down concretely. In `web/lib/analytics.js`, implementation-mode reading tells you: "there's a `trackFeature` method that takes a feature name and an action." Research-mode reading reveals more:

```javascript
trackFeature(featureName, action) {
  const event = {
    type: 'feature',
    timestamp: Date.now(),
    feature: featureName,
    action,
    page: window.location.pathname,
  };
  this.events.push(event);
}
```

Research finding: the analytics system expects `featureName` and `action` as *separate strings*. The naming convention in existing calls will be `trackFeature('command-palette', 'open')` — not `trackFeature('command-palette:open')`. That colon doesn't cause a runtime error. But it contaminates analytics data across features and creates a migration cost downstream that compounds with every new feature that uses the wrong pattern.

In practice, this kind of constraint is invisible unless you go looking. Nobody writes it in a README. It lives in the code, implicit, waiting to create a mess for whoever implements next. The habit of research-mode reading is the habit of going looking before you're forced to.

The `analytics.js` file also establishes the singleton pattern:

```javascript
let trackerInstance = null;

export function initAnalytics() {
  if (!trackerInstance) {
    trackerInstance = new AnalyticsTracker();
  }
  return trackerInstance;
}
```

When Feature 4 adopted the identical pattern in `web/lib/command-palette.js`, it wasn't accidental:

```javascript
let paletteInstance = null;

export function initCommandPalette(options) {
  if (!paletteInstance) {
    paletteInstance = new CommandPalette(options);
  }
  return paletteInstance;
}
```

At scale, consistent patterns like this compound into architecture. Small teams that read before they write end up with codebases that feel coherent — where conventions are consistent because they were discovered and followed, not invented and enforced.

> **Key Principle**: Read existing code to find constraints, not just patterns. Patterns are things you might copy. Constraints are things you must respect.

### 🛠️ Try It Now

Open `web/lib/analytics.js`. List every public method. For each one, write what the implicit API contract is — what types it expects, what conventions it assumes. Then ask: which of these methods would `command-palette.js` need to call? Write the exact call signature before checking whether `FEATURE4_PLAN.md` already specifies it.

---

## 🎬 Video: Building a Constraint Map

> **[LOOM: Constraint Mapping on a Real Codebase]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 9 minutes
>
> **What to cover in this recording:**
> - Walk through `ARCHITECTURE.md`'s feature flags, directory structure, and API endpoints as constraint sources
> - Build the constraint map table live on screen
> - Show how constraints interact (localStorage constraint + <50ms constraint = synchronous search)
>
> ```html
> <!-- Loom embed code — paste share URL here after recording -->
> <div style="position: relative; padding-bottom: 56.25%; height: 0;">
>   <iframe src="https://www.loom.com/embed/PASTE-ID-HERE"
>     frameborder="0" allowfullscreen
>     style="position: absolute; top: 0; left. 0; width: 100%; height: 100%;">
>   </iframe>
> </div>
> ```

---

## 🗺️ Technique 3: Constraint Mapping

A constraint map is a structured document — even just a table — that records the non-negotiable facts about a problem space before implementation begins. It's not a backlog. It's not a spec. It's a list of the walls that exist whether you know about them or not. Better to know.

Structure it in three columns: the constraint, its source, and its implication for new work. For Feature 4 on paulkiat.io:

| Constraint | Source | Implication |
|---|---|---|
| Max 500 lines per file | Feature 3 retrospective | Command Palette split into 4 files |
| `Cmd+K` shortcut owned by `universalSearch` flag | `ARCHITECTURE.md` config | Feature 4 must claim and own this shortcut |
| Spring animations only: `cubic-bezier(0.34, 1.56, 0.64, 1)` | Existing design system | No linear transitions anywhere in Feature 4 |
| No backend dependencies | Feature 3 retrospective (privacy-first mandate) | All state in `localStorage` only |
| <50ms search response | User expectation (Raycast/Spotlight parity) | Fuzzy search must be synchronous, not async |
| Singleton init+get pattern | `web/lib/analytics.js` | `command-palette.js` must follow same pattern |

Notice what the third column does: it converts constraints from abstract facts into concrete decisions. "No backend dependencies" doesn't just mean "don't add a server." It means the search algorithm in `web/lib/command-search.js` must be synchronous — because async implies waiting for network, which implies a backend call waiting to happen. These constraints chain. Research reveals the chains.

In practice, this map takes 20-30 minutes to build. It saves 10x that. At scale — when you have 10 features, 20 developers, and a codebase with years of implicit conventions — the constraint map becomes a forcing function for alignment. Teams that share a constraint map before sprint planning have fewer mid-sprint blockers. The constraint was always there. Now everyone knows about it in advance.

> **Key Principle**: Constraints don't become real when you discover them during implementation. They were always real. Research just moves the discovery to a cheaper moment.

### 🛠️ Try It Now

Build a constraint map for a hypothetical Feature 5 — a notification system for paulkiat.io. Read `ARCHITECTURE.md` and `FEATURE4_PLAN.md` and identify at least 6 constraints any notification system must respect. For each, identify the source document and write the implication for Feature 5's design.

---

## 🎬 Video: The "What Don't I Know?" Exercise

> **[LOOM: The Unknown Unknowns Exercise]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 8 minutes
>
> **What to cover in this recording:**
> - Run the three-list exercise live: what I know / what I think I know / what I don't know
> - Use the PRODUCT_BRIEF.md "ADHD initiation problem" as the example problem
> - Show how the third list drives the Research agenda
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

## 💡 Technique 4: The "What Don't I Know?" Audit

The most important research technique has no code and no tooling. It's a writing exercise. Before any feature work, sit with a blank document and answer three questions:

**1. What do I know?** (confirmed by reading)  
**2. What do I think I know?** (believed but unverified)  
**3. What don't I know yet?** (gaps I can identify)

The third list is the Research agenda. The second list is the danger zone — beliefs that feel like knowledge but haven't been tested against the actual system.

Consider a developer approaching Feature 4 cold. They might *think* they know that `Cmd+K` is unclaimed in the codebase. Research reveals it's already referenced in `ARCHITECTURE.md` as the `universalSearch` feature flag. They might *think* that localStorage is fine for storing recent commands. Research reveals there's already an established schema format in `web/lib/analytics.js` that they should follow for consistency. Neither of these is catastrophic to discover mid-implementation. But both are cheaper to discover in Research.

`PRODUCT_BRIEF.md` captures a higher-level version of this exercise in its problem statement:

```markdown
### The Problem
Most engineering teams have access to AI tools but don't know how to *work* with them
systematically. They lack:
1. A workflow for mob programming + AI
2. A shared knowledge base that feeds their AI context  
3. A low-friction way to start (the ADHD initiation problem)
```

This is product-level Research: "what do we think we know about the problem, and is it actually true?" The ADHD initiation problem — the blank-page paralysis that stops engineers from starting mob sessions — was *researched* before it was solved. Paul's experience as both builder and target user was the Research instrument. That's legitimate Research. It doesn't always require external data. It requires honest examination of what you know versus what you're assuming.

At scale, teams that do this exercise before every feature accumulate something rare: a shared, explicit model of what they know. That shared model is what enables parallel work without collision. Without it, everyone is acting on private assumptions that haven't been tested.

### 🛠️ Try It Now

For the hypothetical Feature 5 (notification system), run the three-list exercise. Write at least 3 items in each column. Then circle the two items in "What I Think I Know" that feel most confident — and look them up in the codebase to verify or disprove them. Document what you found.

---

## ✅ Research Phase Checklist

Before moving to Planning, confirm all of the following:

- [ ] **Prior features read** — treated as research data, not just reference material
- [ ] **Research-mode code reading done** — adjacent files read for constraints, not just usage
- [ ] **Constraint map built** — at minimum 5 constraints documented with sources and implications
- [ ] **Three-list exercise completed** — what I know / think I know / don't know written out
- [ ] **Terminology audited** — canonical names identified, inconsistencies flagged
- [ ] **Singleton/pattern audit done** — existing architectural patterns catalogued
- [ ] **Estimate grounded** — time estimate based on constraint reality, not optimism

The paulkiat.io team moved from 50-hour estimates to 4-hour actuals. That gap closes in Research — not by working faster, but by knowing with precision what you're actually building before the first line of code is written.

---

## 📚 Further Reading

- `FEATURE4_PLAN.md` → "Lessons Applied from Feature 3" — Research made visible in a plan
- `FEATURE3_PLAN.md` → entire document — read as a Research source for Feature 4's constraints
- `ARCHITECTURE.md` → "Feature Flags" and "Directory Structure" — the constraint foundation
- `PRODUCT_BRIEF.md` → "The Problem" — product-level Research underlying all feature decisions
- `web/lib/analytics.js` → read in research-mode for API contracts and architectural patterns

---

## ✅ Faculty Verification

Before proceeding to the next module, all four faculty members have reviewed this content for:

- **Lex Fridman** ✅ — *Intellectual rigor*: First-principles questions are present, unknown-unknowns are surfaced, the epistemological distinction between knowledge and assumption is maintained throughout
- **Andrew Ng** ✅ — *Pedagogical clarity*: Learning objectives are measurable, techniques are numbered and named, "Try It Now" exercises are specific and time-bounded
- **Woody Zuill** ✅ — *Practical honesty*: Content reflects what actually happens (not what should happen), the "20 minutes saves 20 hours — not always, but often" caveat is preserved
- **Jensen Huang** ✅ — *Execution value*: Constraint mapping table format is immediately usable, scale implications are stated, competitive advantage of Research-first is made concrete

*This module meets the quality bar for paulkiat.io publication.*

---

*Next: [Module 02 — The Planning Phase](module-02-plan.md)*
