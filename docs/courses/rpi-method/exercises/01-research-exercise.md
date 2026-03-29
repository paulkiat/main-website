# Exercise 01: The Research Phase

**Module**: [Module 01 — The Research Phase](../module-01-research.md)  
**Time**: 60 minutes  
**Format**: Solo or pair  
**Deliverable**: Written constraint map + "What I Think I Know" audit

---

## 🎬 Exercise Walkthrough Video

> **[LOOM: Exercise 01 Walkthrough — Research Phase]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - Walk through each part of the exercise before the student starts
> - Demonstrate Part 1 using a different hypothetical feature (not notifications)
> - Show what a complete constraint map entry looks like vs. an incomplete one
> - Explain what "research-mode reading" looks like on screen
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

You are the first developer assigned to **Feature 5: Team Notification System** for paulkiat.io. There is no plan yet. Your job is to complete the Research phase — before anyone has written a single line of code or made a single design decision.

By the end of this exercise, you will have:
1. A constraint map with at least 8 entries derived from the actual codebase
2. A completed three-list audit (Know / Think I Know / Don't Know)
3. At least 3 verified or disproven assumptions
4. A Research summary: two paragraphs stating the most important findings and why

---

## 📋 Part 1: Build the Constraint Map (25 minutes)

**Your research sources** (read all four before building the map):
- `ARCHITECTURE.md`
- `FEATURE4_PLAN.md`
- `FEATURE3_PLAN.md`
- `web/lib/analytics.js`

**The constraint map template:**

| Constraint | Source Document | Implication for Feature 5 |
|---|---|---|
| *(fill in)* | *(document name + section)* | *(specific impact on notification system design)* |

**Requirements:**
- Minimum 8 constraint entries
- Every entry must cite the specific document AND section where the constraint was found
- The "Implication" column must be specific to a notification system — not generic
- At least 2 constraints must be naming/terminology constraints
- At least 2 constraints must be architectural constraints (file structure, pattern)
- At least 1 constraint must be from reading `web/lib/analytics.js` in research-mode (not implementation-mode)

**Hints** (try to find these yourself first):
- What does `ARCHITECTURE.md` say about feature flags? What does this mean for notifications?
- What naming convention do all existing localStorage keys follow?
- What is the singleton pattern in `web/lib/analytics.js` and what does it constrain about how a notification tracker would be initialized?
- What does the 500-line file limit mean for a notification system that has multiple concerns (tracking, rendering, storage, API)?

---

## 🎬 Mid-Exercise Check-In

> **[LOOM: Constraint Map Review — Common Mistakes]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 5 minutes
>
> **What to cover in this recording:**
> - The most common incomplete constraint map entries and how to complete them
> - How to distinguish a constraint from a preference
> - What "research-mode reading" of analytics.js looks like vs. implementation-mode
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

## 📋 Part 2: The Three-List Audit (15 minutes)

Before you read anything, write your three lists. Do this from memory — what do you already think you know about this system?

### What I Know
*(Things you can confirm are true from the documents you just read — at least 4 items)*

1. 
2. 
3. 
4. 

### What I Think I Know
*(Beliefs that feel solid but you haven't explicitly verified — at least 4 items)*

1. 
2. 
3. 
4. 

### What I Don't Know Yet
*(Gaps you can name — at least 4 items. These are your research agenda.)*

1. 
2. 
3. 
4. 

---

## 📋 Part 3: Verify Two Assumptions (15 minutes)

Take the two items from "What I Think I Know" that feel most confident. Look them up in the codebase. Write what you found.

**Assumption 1:**
- *Statement*: 
- *Where I looked*: 
- *What I found*: 
- *Result*: ✅ Confirmed / ❌ Disproved / ⚠️ Partially correct

**Assumption 2:**
- *Statement*: 
- *Where I looked*: 
- *What I found*: 
- *Result*: ✅ Confirmed / ❌ Disproved / ⚠️ Partially correct

---

## 📋 Part 4: Research Summary (5 minutes)

Write two paragraphs:

**Paragraph 1**: The most important constraint the notification system must respect, and why. Be specific — cite the source, the constraint, and the consequence of violating it.

**Paragraph 2**: The assumption you thought was most solid that turned out to be wrong (or partially wrong). What would have happened if you'd implemented based on the wrong assumption?

---

## ✅ Pass Criteria

Your Research phase exercise passes if:

- [ ] Constraint map has at least 8 entries, all with source citations
- [ ] At least one entry comes from research-mode reading of `web/lib/analytics.js`
- [ ] Three-list audit has at least 4 items in each column
- [ ] Both assumptions are formally verified (not just "I still think this is true")
- [ ] Research summary paragraph 2 is specific — it names a real consequence, not a vague "things could go wrong"

---

## 🎬 Exercise Debrief Video

> **[LOOM: Exercise 01 Debrief — What Good Research Looks Like]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 8 minutes
>
> **What to cover in this recording:**
> - Walk through an example completed constraint map
> - Show the most common disproved assumption (students usually think the feature flag name is flexible — it isn't)
> - Preview: how this constraint map becomes the foundation of Exercise 02's plan
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

- `ARCHITECTURE.md` — system-level constraints (feature flags, directory structure, API patterns)
- `FEATURE4_PLAN.md` — most recent plan: the constraint baseline for Feature 5
- `FEATURE3_PLAN.md` — prior plan: what Feature 4 learned from Feature 3, which Feature 5 inherits
- `web/lib/analytics.js` — read in research-mode: find the implicit API contracts and singleton pattern

*Next: [Exercise 02 — Planning Phase](02-plan-exercise.md)*
