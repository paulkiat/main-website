# Exercise 02: The Planning Phase

**Module**: [Module 02 — The Planning Phase](../module-02-plan.md)  
**Time**: 60 minutes  
**Format**: Solo or pair (team of 2 recommended)  
**Prerequisite**: Completed [Exercise 01](01-research-exercise.md) — you need your constraint map  
**Deliverable**: A complete `FEATURE5_PLAN.md` document

---

## 🎬 Exercise Walkthrough Video

> **[LOOM: Exercise 02 Walkthrough — Planning Phase]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 12 minutes
>
> **What to cover in this recording:**
> - How to use the constraint map from Exercise 01 as planning input
> - Walk through `FEATURE4_PLAN.md` as the template — section by section
> - Demonstrate the four-test framework on a live success criterion
> - Show what "design tokens before architecture" looks like in practice
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

## 🎯 Exercise Objective

You are writing `FEATURE5_PLAN.md` — the plan for the notification system on paulkiat.io. Your constraint map from Exercise 01 is your primary input. `FEATURE4_PLAN.md` is your template.

By the end of this exercise, you will have written a complete plan document that:
- Any team member could implement with fewer than 3 clarifying questions
- Has all design tokens specified before the technical architecture
- Has success criteria that pass the four-test framework
- Has a phased implementation plan where Phase 1 produces a demo

---

## 📋 Part 1: Plan Header (10 minutes)

Write the plan header for Feature 5. Match `FEATURE4_PLAN.md`'s header format exactly.

**Required fields:**
- Feature name and keyboard shortcut (if applicable)
- ROI score (1-10) with one-sentence justification referencing `PRODUCT_BRIEF.md`
- Priority level
- Dual time estimate: industry default AND your actual estimate
- Status

**ROI guidance**: Reference `PRODUCT_BRIEF.md`'s feature priority framework. Ask: how much does a notification system improve the platform's demo-readiness? How much does it reduce friction for the engineering teams who are the target users?

**Dual estimate guidance**: The industry default for a notification system with real-time delivery, UI rendering, and localStorage persistence is 30-40 hours. Your actual estimate should reflect the constraint map — what are you *not* building (backend? no. real-time websocket? check architecture.) and what patterns are you reusing (singleton, spring animations, localStorage schema)?

---

## 📋 Part 2: Lessons Applied (10 minutes)

Write the "Lessons Applied" section — the bridge between your Exercise 01 Research and this plan.

**Required structure** (match `FEATURE4_PLAN.md`):

```markdown
## 🎓 Lessons Applied from Feature 4

### ✅ What We're Keeping:
1. [Pattern from Feature 4] — [why it applies to Feature 5]
2. ...

### 🚫 What We're Avoiding:
1. [Failure from prior features] — [how Feature 5 pre-empts it]
2. ...
```

**Requirements:**
- At least 5 items in "Keeping"
- At least 4 items in "Avoiding"
- Every "Avoiding" item must be traceable to a real constraint in your Exercise 01 map
- At least one item from Feature 3 (not just Feature 4) — research compounds

---

## 🎬 Mid-Exercise Check-In

> **[LOOM: Common Planning Mistakes at the Halfway Point]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 6 minutes
>
> **What to cover in this recording:**
> - Plans that skip design tokens and go straight to architecture — why this is backwards
> - Success criteria that fail the four-test framework — live rewrites
> - File structures where the responsibilities overlap — how to fix
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

## 📋 Part 3: Design System (8 minutes)

Define the design tokens for Feature 5 *before* touching architecture. Reuse Feature 4's variables where possible.

**Required:**
```css
:root {
  /* Notification-specific variables */
  --notif-bg: ;        /* notification panel background */
  --notif-unread: ;    /* unread indicator color */
  --notif-text: ;      /* notification body text */
  --notif-timestamp: ; /* timestamp muted text */
  --notif-border: ;    /* panel border */
  
  /* Reused from Feature 4 (include verbatim) */
  --animation-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
  --animation-duration: 0.3s;
  /* ... any other Feature 4 variables you'll use */
}
```

**Rule**: If you catch yourself choosing a color during Part 4 or 5 of this exercise, you didn't complete Part 3.

---

## 📋 Part 4: File Structure + Architecture (8 minutes)

Define the file structure for Feature 5. Apply the 500-line constraint. Give each file a single, specific responsibility.

**Template:**
```
web/
├── lib/
│   ├── notifications.js          # ??? lines — [single responsibility statement]
│   ├── notification-store.js     # ??? lines — [single responsibility statement]
│   ├── [your files here]
└── notifications-demo.html       # ??? lines — demo only, no imports
```

**Requirements:**
- At least 3 library files
- Every file has an estimated line count
- Every file's responsibility is stated in one clause — and it's a constraint, not a description (e.g., "rendering only — no storage logic")
- `notifications-demo.html` must appear and must be the first file built in Phase 1

---

## 📋 Part 5: Success Criteria (8 minutes)

Write at least 10 success criteria. Apply the four-test framework to each before including it.

**Four-test checklist for each criterion:**
- [ ] Binary (yes/no answer)
- [ ] Measurable (has a number, state, or observable behavior)
- [ ] Owned (one specific person can verify this right now)
- [ ] Bounded (prevents scope creep — finite)

**Aspirational drafts to rewrite** (practice):
1. ~~"Notifications should feel fast"~~ → *rewrite with a specific millisecond threshold*
2. ~~"The notification panel should be attractive"~~ → *rewrite with a specific visual behavior*
3. ~~"Users should be able to manage their notifications"~~ → *rewrite as 3 separate specific criteria*

**Also required:** A "Bonus Features" section with at least 3 items explicitly out of scope.

---

## 📋 Part 6: Implementation Phases (8 minutes)

Write the phased implementation plan. Phase 1 must produce a demo. Total must be under 8 hours actual (not 50-hour industry estimate).

**Required format:**
```markdown
### Phase 1: Create Demo First (?h)
- [ ] Create `notifications-demo.html`
- [ ] [hardcoded sample notifications]
- [ ] [static UI matching design tokens]
- [ ] [test interaction: mark as read, dismiss]

### Phase 2: [name] (?h)
...

**Total Estimated: ? hours** (vs. ?h industry estimate — ?% savings from constraint reuse)
```

**Requirements:**
- 4 phases minimum
- Phase 1 = demo, Phase 4 = integration with existing features (analytics minimum)
- Time estimates in hours, not story points
- Total and percentage savings explicitly stated

---

## 📋 Part 7: Self-Review (8 minutes)

Before you submit, apply the Planning Phase Checklist from Module 02:

- [ ] Objective stated in one user-facing sentence
- [ ] ROI justified with reference to `PRODUCT_BRIEF.md`
- [ ] Lessons Applied: Keeping + Avoiding lists present
- [ ] Design system fully specified before architecture
- [ ] File structure: named, line-counted, single-responsibility
- [ ] All success criteria pass the four-test framework
- [ ] Phase 1 produces a demo
- [ ] Bonus Features section explicitly bounds scope
- [ ] Total time estimate with percentage savings stated

For any unchecked item: fix it before considering the exercise complete.

---

## ✅ Pass Criteria

Your Planning phase exercise passes if:

- [ ] Plan follows `FEATURE4_PLAN.md` structure with all sections present
- [ ] Design tokens section appears before architecture section
- [ ] Minimum 10 success criteria, all passing the four-test framework
- [ ] Bonus Features section with at least 3 items
- [ ] Phase 1 of implementation plan produces a demoable artifact
- [ ] Total time estimate is accompanied by a percentage savings calculation
- [ ] "What We're Avoiding" list has at least 4 items, all traceable to Exercise 01's constraint map
- [ ] A competent developer on the team could implement this plan with fewer than 3 clarifying questions

---

## 🎬 Exercise Debrief Video

> **[LOOM: Exercise 02 Debrief — What a Great Plan Looks Like]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - Walk through an example completed Feature 5 plan
> - Count the decision density: how many implementation decisions were pre-made
> - Show two success criteria that failed the four-test framework and the rewrites
> - Preview: how Phase 1 of the implementation plan becomes Exercise 03
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

## 📚 Reference Materials

- `FEATURE4_PLAN.md` — Template: match its structure exactly for every section
- `FEATURE3_PLAN.md` — Prior art: at least one "Lessons Applied" item must come from here
- `PRODUCT_BRIEF.md` — ROI justification source
- `ARCHITECTURE.md` — Constraint validation: every architectural choice should be checked against this
- Exercise 01 constraint map — Your primary planning input: every "Avoiding" item should trace back here

*Previous: [Exercise 01 — Research Phase](01-research-exercise.md)*  
*Next: [Exercise 03 — Implementation Phase](03-implement-exercise.md)*
