# Exercise 03: The Implementation Phase

**Module**: [Module 03 — The Implementation Phase](../module-03-implement.md)  
**Time**: 90 minutes  
**Format**: Mob session (3+ people recommended; minimum 2)  
**Prerequisite**: Completed [Exercise 02](02-plan-exercise.md) — you need your Feature 5 plan  
**Deliverable**: Working demo + one extracted library file + session reflection

---

## 🎬 Exercise Walkthrough Video

> **[LOOM: Exercise 03 Walkthrough — Implementation Phase]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 14 minutes
>
> **What to cover in this recording:**
> - How to set up a mob session for this exercise (one screen, one keyboard, rotation)
> - What Phase 1 (demo) should look like when it's done — show a working example
> - How to identify a "Turn up the good" moment in real time
> - The extraction step: what "extract a library" means in practice
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

You are running Phase 1 and the beginning of Phase 2 of your Feature 5 (notifications) implementation. This is a live mob session. Your plan from Exercise 02 is the navigator's primary document.

By the end of this exercise, you will have:
1. A working `notifications-demo.html` that runs in a browser
2. One extracted library file from the demo
3. A session reflection documenting what the plan got right, what it got wrong, and one "Turn up the good" moment

---

## 🏗️ Setup (10 minutes before the session)

### Mob session roles
- **Driver**: One person at the keyboard. Types exactly what the navigator says. No improvising.
- **Navigator**: Holds the plan (your Exercise 02 `FEATURE5_PLAN.md`). Directs the driver. References the plan for every decision.
- **Mob**: Everyone else. Watching, catching edge cases, asking questions. One voice at a time.

**Role rotation**: Every 20 minutes, the driver becomes a mob member, the navigator becomes driver, and one mob member becomes navigator. Set a timer.

### Design system setup
Before writing any HTML or JavaScript, copy the design token CSS variables from your Exercise 02 plan into a `<style>` tag at the top of `notifications-demo.html`. This is the first thing the driver types.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Notifications Demo — Feature 5</title>
  <style>
    :root {
      /* Paste your design tokens from Exercise 02 here */
      /* Also paste Feature 4's animation variables */
      --animation-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
      --animation-duration: 0.3s;
    }
    
    /* Your notification styles go here */
  </style>
</head>
<body>
  <!-- Your demo content goes here -->
</body>
</html>
```

---

## 🎬 Mid-Session Check-In

> **[LOOM: Phase 1 Milestone Check — Is Your Demo Working?]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 5 minutes
>
> **What to cover in this recording:**
> - What "working" means at the Phase 1 milestone: renders, interactions fire, no console errors
> - Common Phase 1 blockers and quick fixes
> - How to tell if your spring animation variable is actually working
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

## 📋 Phase 1: Build the Demo (45 minutes)

### What the demo must include

**Required — core behavior:**
- [ ] A notification panel that opens and closes (triggered by a button or keyboard shortcut)
- [ ] At least 3 hardcoded sample notifications with: icon/emoji, title, body text, timestamp
- [ ] An unread indicator (badge count or dot) on the trigger button
- [ ] "Mark as read" interaction on individual notifications
- [ ] Spring animation on panel open/close using your design token variable

**Required — design system:**
- [ ] All colors come from CSS variables defined in your design tokens section — no hardcoded hex values in the component CSS
- [ ] Typography uses the Feature 4 font stack if present, or `system-ui` as fallback

**Do NOT include in Phase 1:**
- No `import` or `export` statements — everything is inline in the HTML file
- No localStorage reads or writes — hardcoded data only
- No analytics calls — not yet
- No real notification data — fictional hardcoded content only

### The demo milestone

At 45 minutes, stop. The demo either works or it doesn't. If it doesn't fully work, document what's missing and move on to the reflection. The purpose of the time limit is to practice shipping something real in a bounded window — not to optimize endlessly.

**Demo checklist (verify before moving to Phase 2):**
- [ ] Opens without console errors
- [ ] Spring animation is visible on open (not just instant)
- [ ] All 3 hardcoded notifications are visible
- [ ] At least one interaction works (mark as read or close)
- [ ] All colors come from CSS variables (inspect any element — no hardcoded hex values)

---

## 📋 Phase 2: Extract One Library (25 minutes)

Choose one of these extraction targets from your demo:
- **Option A**: Extract the notification rendering logic into `notifications-ui.js`
- **Option B**: Extract the notification data model into `notification-store.js`
- **Option C**: Extract the open/close toggle logic into `notifications.js`

**The extraction rules:**
1. The demo must still work after extraction — this is your acceptance test
2. The extracted file must use `export` — it's a real library now
3. The demo imports from the library using a `<script type="module">` tag
4. The extracted file must be under your planned line count from Exercise 02

**Extraction template:**
```javascript
/**
 * [filename].js — [single responsibility from your Exercise 02 plan]
 * 
 * Extracted from notifications-demo.html
 * Line limit: [your Exercise 02 estimate] lines
 * 
 * What this file owns: [one sentence]
 * What this file does NOT own: [one sentence]
 */

export function [mainExport]() {
  // Your extracted code here
}
```

After extraction, open the demo in the browser. If it still works: extraction successful. If it doesn't: debug until it does (this is the learning moment).

---

## 🎬 Extraction Milestone Check

> **[LOOM: Phase 2 Extraction — Common Extraction Mistakes]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 6 minutes
>
> **What to cover in this recording:**
> - The most common extraction mistake: pulling too much into one file
> - How to test that the demo still works after extraction (not just "looks like it works")
> - What to do if the extraction reveals a responsibility boundary that was wrong in the plan
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

## 📋 Session Reflection (15 minutes)

This is not optional. The reflection is the learning artifact that makes this exercise useful for future features.

### What the plan got right
*(Minimum 3 items — specific decisions from Exercise 02 that proved correct during the session)*

1. 
2. 
3. 

### What the plan got wrong
*(Minimum 2 items — specific plan decisions that had to change during the session, and why)*

1. 
2. 

### The "Turn up the good" moment
*(One specific moment in the session when something worked better than expected — what was it, and what did the mob decide to do with it?)*

**What worked well**:  
**The mob's decision**:  
**What it produced**:  

### Plan deviation log
*(For each deviation from the plan, write: what the plan said, what you actually did, and why)*

| Plan Said | Actually Did | Reason |
|---|---|---|
| | | |
| | | |

### Research debt discovered
*(Any constraint or API contract you wish you'd found during Exercise 01 — things that surprised you during implementation)*

1. 
2. 

---

## ✅ Pass Criteria

Your Implementation phase exercise passes if:

- [ ] `notifications-demo.html` opens in a browser without console errors
- [ ] Spring animation is visible (not instant) using the CSS variable from your design tokens
- [ ] At least one extracted library file exists with a correct `export` statement
- [ ] The demo still works after extraction
- [ ] The extracted file has the single-responsibility comment header
- [ ] Session reflection has at least 3 "got right", 2 "got wrong", and 1 "turn up the good" entry
- [ ] Plan deviation log has at least 2 entries (if you had zero deviations, you didn't look hard enough)
- [ ] Research debt section has at least 1 entry (if you had none, the Exercise 01 was unusually thorough)

---

## 🎬 Exercise Debrief Video

> **[LOOM: Exercise 03 Debrief — The Implementation Loop Completed]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - Walk through an example completed demo and extracted library
> - Show the session reflection and how the "Research debt" section becomes Exercise 01 input for Feature 6
> - The full RPI loop: Research 01 → Plan 02 → Implement 03 → Retrospective → Research for next feature
> - How this exercise connects to the Case Study module
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

## 💡 If You're Doing This Solo

Mob sessions require at least 2 people. If you're doing this exercise alone:

1. **Narrate out loud** — describe what you're doing and why as if to a navigator. This forces the same explicit reasoning.
2. **Use a 20-minute rotation substitute**: every 20 minutes, stop typing and read the plan aloud. This simulates the rotation moment where you re-anchor to the plan.
3. **Write the reflection immediately** — solo sessions are more prone to letting the reflection slip. Set a timer the moment the demo works.
4. **Consider asking AI to navigate**: provide it your Exercise 02 plan and ask it to act as navigator — saying what to build, not how to code it. This is the "AI as third pair of hands" pattern from Module 04.

---

## 📚 Reference Materials

- Your `FEATURE5_PLAN.md` from Exercise 02 — the navigator's primary document
- `FEATURE4_PLAN.md` — reference for what Phase 1 output should look like
- `web/lib/command-ui.js` — reference for the spring animation implementation pattern
- `web/lib/analytics.js` — reference for the singleton export pattern you'll use in your library
- [Module 03 — Implementation](../module-03-implement.md) — "Turn up the good" and mob session dynamics

*Previous: [Exercise 02 — Planning Phase](02-plan-exercise.md)*  
*Back to: [Course Overview](../README.md)*
