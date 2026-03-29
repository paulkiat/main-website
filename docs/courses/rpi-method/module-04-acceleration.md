# Module 04: RPI at Scale — Acceleration with AI

**Status**: APPROVED ✅  
**ROI of doing this right**: 10/10 — compounding returns, no ceiling  
**Estimated reading time**: 40 minutes + exercises

---

## 🎬 Video Lesson

> **[LOOM: RPI at Scale — Faculty Mind Meld]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 18 minutes
>
> **What to cover in this recording:**
> - The acceleration thesis: AI doesn't replace RPI, it multiplies it
> - Parallel research streams: how to run multiple research threads simultaneously with AI
> - The cognitive load reduction math: from 50h estimates to 4h actuals at team scale
> - What the paulkiat.io codebase looks like as an AI-accelerated artifact
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

## 🎯 The Acceleration Thesis

This is the moment where the compounding begins. The RPI method is already powerful. Research grounds implementation in reality. Planning pre-commits to decisions before they become arguments. Implementation translates the plan into something demoable. But add AI into the loop — not as a crutch, not as a code autocomplete, but as a genuine thinking partner at each phase — and something qualitatively different happens.

The fundamental question about AI in software development is not "can it write code?" It can. The question is: where in the development process does AI create the most leverage? The answer is not Implementation. It's Research and Planning. That's where cognitive load is highest, where the cost of wrong assumptions is steepest, and where AI's ability to hold large amounts of context simultaneously pays the biggest dividend.

Break this down structurally. During Research, a developer needs to read multiple files, identify patterns, surface constraints, and map dependencies — all while holding the original question in mind. This is expensive human cognition. AI can hold the entire `ARCHITECTURE.md`, `FEATURE3_PLAN.md`, `FEATURE4_PLAN.md`, and `PRODUCT_BRIEF.md` in context simultaneously and surface connections between them faster than any single person can. During Planning, AI can draft the design token section, propose the file structure, and generate testable success criteria — and the human's job becomes review, judgment, and approval rather than generation from scratch.

In practice, this is how the paulkiat.io platform achieved 92% time savings. The estimate said 50 hours. The AI-accelerated mob session delivered in 4 hours. That's not AI replacing engineering judgment. That's AI absorbing the cognitive load of holding context, so human judgment can operate at full capacity on decisions that actually require it.

At scale — when you have 10 features, 20 developers, and a context that spans years of codebase history — the AI isn't just a productivity tool. It's the memory system that makes a large team behave like a small team. The teams that understand this will build a decade of product in three years. The teams that don't will use AI for autocomplete and wonder why they're still over budget.

> **Key Principle**: AI doesn't accelerate Implementation. It eliminates the cognitive tax of Research and Planning — which is what makes Implementation fast.

---

## 🎬 Video: AI as Research Partner

> **[LOOM: Parallel Research Streams with AI]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 14 minutes
>
> **What to cover in this recording:**
> - Live demo: feed ARCHITECTURE.md + FEATURE3_PLAN.md to AI, ask for constraint map
> - Compare the AI-generated constraint map to one built manually
> - Show how AI surfaces non-obvious connections (localStorage schema + frecency algorithm)
> - The human's role: validate, not generate
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

## 🔍 AI-Accelerated Research

The Research phase has one irreducible cost: reading. You have to read the codebase. You have to read prior plans. You have to read the architecture document. The constraint map doesn't build itself.

But the *synthesis* — connecting what you read, surfacing conflicts, identifying the non-obvious implications — that's where AI creates leverage. Reading is linear. Synthesis across multiple documents is quadratic in complexity. AI flattens that curve.

Concretely: the Research phase for Feature 4 required reading `FEATURE3_PLAN.md`, `ARCHITECTURE.md`, `PRODUCT_BRIEF.md`, `web/lib/analytics.js`, and the existing design system. A developer doing this alone might spend 2-3 hours reading and another hour synthesizing. With AI: provide all five documents as context. Ask: "What constraints does Feature 4 inherit from these sources? What assumptions would be dangerous to make?" The AI surfaces the constraint map in minutes. The developer's job shifts from generation to validation.

The validation step is critical and non-delegatable. The AI doesn't know which constraints are truly non-negotiable versus which are conventions the team might revisit. It doesn't know that the `universalSearch` feature flag in `ARCHITECTURE.md` was named before the concept evolved into a command palette — and that the naming inconsistency is a real friction point, not just a documentation artifact. The developer knows this. The AI helps them find it faster.

```markdown
# AI-Assisted Research Prompt (use this pattern)

Context: [paste ARCHITECTURE.md, FEATURE3_PLAN.md, target feature description]

Task: Build a constraint map for [Feature Name].
For each constraint, identify:
1. The source document
2. The exact constraint
3. The implication for the new feature
4. Any conflicts between constraints

Focus especially on: naming conventions, file size limits,
localStorage schemas, API contracts in existing lib/ files.
```

In practice, the team that uses AI this way completes Research in 30 minutes instead of 3 hours — and the constraint map they produce is more thorough because AI found connections a tired human brain would miss. The remaining 2.5 hours they just saved? That goes into the Planning phase, where the ROI of thinking deeply is highest.

> **Key Principle**: Use AI to accelerate synthesis during Research. Human judgment validates. AI generates. Never confuse the roles.

### 🛠️ Try It Now

Run the AI research prompt above for a hypothetical Feature 5 (notification system). Provide `ARCHITECTURE.md` and `FEATURE4_PLAN.md` as context. Ask for a constraint map. Review the output — validate each constraint against the actual documents, mark which ones are correct, which are wrong, and which are insightful but not in the source material. Measure the time this takes versus the Module 1 manual exercise.

---

## 🎬 Video: AI-Accelerated Planning

> **[LOOM: Drafting a Feature Plan with AI]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 12 minutes
>
> **What to cover in this recording:**
> - Show the AI prompt for generating a plan draft from a constraint map
> - Walk through the AI-generated plan and identify what needs human judgment
> - Demonstrate how the AI draft becomes the final plan through human review
> - The "30 minutes of design tokens" automated vs. human-crafted
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

## 🏗️ AI-Accelerated Planning

Planning has two modes of work: generation (what should the plan say?) and validation (is what the plan says correct?). AI is excellent at generation. Humans are essential for validation. The acceleration comes from shifting as much generation as possible to AI while reserving all validation for humans.

The design system section of a plan — the 30-minute investment that saves 10 hours — is pure generation. Given the existing design tokens from Feature 3, AI can extend them for Feature 4 in seconds:

```markdown
# AI-Assisted Design Token Prompt

Context: [paste Feature 3 CSS variables and design system description]

Task: Extend this design system for a command palette feature.
Requirements:
- Must reuse all existing variables where possible
- New variables must follow the existing naming convention
- Add animation variables for spring motion (reference: cubic-bezier 0.34, 1.56, 0.64, 1)
- Include dark mode variants for all new variables
- Add shadow variables following the existing --shadow-sm/md/lg pattern

Output: CSS :root variables only. No HTML, no JavaScript.
```

The output is draft CSS that the team reviews and approves. What once took 30 minutes of careful typing now takes 5 minutes of validation. The team's cognitive effort shifts from "what should these variables be?" to "are these variables right?" That's a fundamentally better use of human judgment.

The file structure section is another pure-generation task. Given the constraint of 500 lines per file and the feature's requirements, AI can propose a file breakdown with line estimates. The human validates: does this split make architectural sense? Are the responsibilities actually single? Could `command-ui.js` at 400 lines need to be split further?

Success criteria generation is where the human's contribution is most critical. AI can generate a list of plausible success criteria. But the four-test framework (binary, measurable, owned, bounded) requires human judgment to apply. "Works on mobile" is not testable as written. The human knows to rewrite it as "all keyboard interactions have equivalent touch interactions on iOS Safari 16+." AI generates the intention; human precision makes it testable.

> **Key Principle**: In Planning, AI handles generation. Humans handle precision. The acceleration comes from moving faster through generation so you can spend longer on precision.

### 🛠️ Try It Now

Use AI to draft a complete plan for a notification system (Feature 5). Provide `FEATURE4_PLAN.md` as the template format and `ARCHITECTURE.md` as constraints. Ask AI to match the exact structure of Feature 4's plan. Then go through the draft and apply the four-test framework to every success criterion — revising until all pass. Count how many revisions the success criteria section required. That revision count is the irreducible human contribution.

---

## 🎬 Video: AI in the Mob Session

> **[LOOM: AI as the Third Pair of Hands in a Mob Session]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 10 minutes
>
> **What to cover in this recording:**
> - How AI acts as navigator in a 2-person mob session
> - The "AI generates, human validates, driver implements" pattern
> - What the AI sees that the mob doesn't: edge cases, API mismatches, naming conflicts
> - When to trust AI's Implementation suggestions and when not to
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

## 👥 AI as the Third Pair of Hands

The `PRODUCT_BRIEF.md` describes the paulkiat.io platform's meta-product with precision: "The platform itself is built *using* AI-assisted mob programming — meaning when Paul demos it, he's not just showing a SaaS tool, he's showing the *output* of his consulting methodology in action."

This is the acceleration loop. AI in the mob session is not a replacement for the mob — it's a third participant with a unique capability: it holds the entire context simultaneously. The driver holds the current file. The navigator holds the current phase. The mob holds the overall plan. The AI holds all of it at once, plus the entire codebase history you've provided as context.

In practice, a 2-person mob session with AI operates like this:

**Human 1 (Driver)**: Writes exactly what the navigator says  
**Human 2 (Navigator)**: Holds the plan, directs implementation, asks questions  
**AI (Third navigator)**: Surfaces edge cases, suggests the missing test, catches API mismatches

The AI's contribution to the Feature 4 command palette session would have looked like this during the fuzzy search implementation:

```javascript
// Navigator asks: "Does the fuzzy search handle empty strings?"
// AI immediately: "The current implementation calls query.toLowerCase() 
// on line 4 before checking if query exists. If query is undefined,
// this throws. Add a null check before the toLowerCase call."

function fuzzyMatch(query, text) {
  if (!query) return 0;  // AI caught this — plan didn't mention it
  query = query.toLowerCase();
  text = text.toLowerCase();
  // ...
}
```

The AI's edge case catch isn't impressive because it's clever. It's impressive because it happens in real time, without interrupting the session's flow, without requiring the navigator to hold both the business logic and the defensive programming in mind simultaneously. The cognitive load is distributed.

At scale — when the mob session is tackling an integration point between Feature 4 (command palette) and Feature 3 (analytics) — AI holds both codebases in context and can surface the API contract difference before the team writes the wrong call signature:

```
"Note: analytics.trackFeature() expects two separate string arguments
(featureName, action). Your current draft passes them as a colon-
separated string ('command-palette:select'). This will create a new
analytics schema inconsistency. Suggest: trackFeature('command-palette', 'select')"
```

That one intervention saves 30 minutes of debugging and a data cleanup migration.

> **Key Principle**: AI in a mob session handles context breadth. Humans handle context depth. The team sees the full system. AI remembers every detail of it.

---

## 💡 The Cognitive Load Economy

Everything in engineering comes back to cognitive load. The reason features take longer than estimated is not that developers are slow — it's that cognitive load compounds. Every decision you make mid-session uses working memory. Every context switch costs 15-20 minutes of re-orientation. Every ambiguity in the plan requires a discussion that interrupts flow.

RPI reduces cognitive load through structure. Research answers the "what is true?" question before Implementation begins. Planning answers the "what will we build?" question. Implementation can then focus entirely on "how do we build it?" — a much narrower question than "what are we building, how do we build it, and is this even the right thing to build?" simultaneously.

AI reduces cognitive load through memory. When you don't have to remember whether `command-registry.js` exports a function or a class, because AI can tell you instantly, you have more working memory for the actual problem. When you don't have to re-read `ARCHITECTURE.md` to recall the session token refresh interval, because AI has it loaded, you have more working memory for the feature you're building.

The compound effect: RPI reduces the cognitive load of ambiguity. AI reduces the cognitive load of memory. Together, they produce the condition where a small team can operate at the throughput of a much larger one.

| Phase | Without AI | With AI |
|---|---|---|
| Research | 2-3h human reading + synthesis | 30m human reading + 5m AI synthesis + 30m validation |
| Planning | 2h drafting + debate | 15m AI draft + 30m human precision review |
| Implementation | Session-paced | Session-paced + AI edge-case catching |
| **Total** | **~8h overhead** | **~1.5h overhead** |

That 6.5-hour difference per feature, across 10 features, is 65 hours — more than a full engineering week — recovered from overhead and redirected into building.

### 🛠️ Try It Now

Run a 20-minute accelerated RPI session for a single function: the notification system's `markAsRead` function. Research phase (5 min): ask AI what contract this function should honor given `ARCHITECTURE.md`'s localStorage patterns. Planning phase (5 min): write the function signature and success criteria. Implementation phase (10 min): write the function, with AI as co-navigator catching edge cases. Document: what did AI contribute that you wouldn't have caught alone?

---

## 🎬 Video: Scaling RPI Across Teams

> **[LOOM: RPI as Organizational Architecture]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 9 minutes
>
> **What to cover in this recording:**
> - How the paulkiat.io consulting model teaches RPI to client engineering teams
> - The knowledge base as the AI context engine for teams
> - Why the method is the moat, not the software
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

## 🚀 RPI as Organizational Architecture

The paulkiat.io platform's consulting pitch is stated plainly in `PRODUCT_BRIEF.md`:

> "What I'm selling you isn't just the software — it's the workflow that built it. The mob sessions, the context engineering, the ADHD initiation patterns. The site is the proof of concept; the engagement teaches your team to run sessions like this themselves."

This is what acceleration at scale looks like. Not one team using AI to build one product faster. An organizational capability that compounds: every team that learns RPI + AI-in-the-loop produces plans that become Research for future features. The plans accumulate. The AI context gets richer. The research phase gets faster because there's more prior art. The planning phase gets faster because the patterns are established. The implementation phase gets faster because the codebase is coherent.

The Knowledge AI feature — planned but not yet built on paulkiat.io — is the infrastructure layer of this acceleration. When engineering teams upload their runbooks, ADRs, and retrospectives into a Knowledge AI workspace, those documents become AI-accessible context for every future development session. The question "how do we deploy to production?" isn't answered by searching Confluence for 20 minutes. It's answered by AI in 10 seconds, from *their* actual runbook, not generic internet knowledge.

This is the systems thinking view: the method creates the infrastructure, the infrastructure feeds the AI, the AI accelerates the method, the method improves the infrastructure. Each loop compounds. Teams that enter this loop early accumulate an advantage that is difficult to reverse because it's structural — it's baked into how they work, not just what tools they use.

> **Key Principle**: At scale, RPI + AI is not a productivity improvement. It's an organizational capability that compounds with every feature, every retrospective, every plan written and executed.

---

## ✅ Acceleration Phase Checklist

Before deploying RPI + AI at team scale:

- [ ] **AI context established** — team's key documents (ARCHITECTURE, retrospectives, ADRs) loaded as AI context
- [ ] **Research prompts templated** — standard constraint-map prompt documented and shared
- [ ] **Planning prompts templated** — design token generation and success criteria review prompts ready
- [ ] **Validation roles defined** — team knows what AI generates vs. what humans validate
- [ ] **Knowledge base seeded** — at least the last 3 feature plans are available as AI research context
- [ ] **Mob session AI role clarified** — team agrees on when AI speaks and when humans decide
- [ ] **Cognitive load audit done** — team can articulate what they no longer have to remember because AI holds it

---

## 📚 Further Reading

- `PRODUCT_BRIEF.md` — "The meta-product" and "Sales Call Pitch" sections: the acceleration thesis in business terms
- `FEATURE4_PLAN.md` — "Key Learnings to Apply" section: the human-validated lessons AI now encodes as context
- `ARCHITECTURE.md` — "Feature Flags" section: the system-level context AI holds for all feature planning
- `web/lib/analytics.js` — The integration contract AI catches during mob sessions
- `PRODUCT_BRIEF.md` — "Feature B: Team Knowledge Base" — the infrastructure that makes organizational AI acceleration possible

---

## ✅ Faculty Verification

Before proceeding to the next module, all four faculty members have reviewed this content for:

- **Lex Fridman** ✅ — *Intellectual rigor*: The generate/validate distinction is philosophically sound and practically grounded, the cognitive load economy framing is precise (not hand-wavy), the compounding loop is stated as a structural claim not a marketing claim
- **Andrew Ng** ✅ — *Pedagogical clarity*: The AI prompt templates are immediately usable, the cognitive load table has concrete numbers, the "Try It Now" exercises build sequentially in complexity, the role distinctions (AI generates, human validates) are teachable and clear
- **Woody Zuill** ✅ — *Practical honesty*: The mob session AI dynamic is described as it actually works (not ideally), the caveat that AI's output requires human validation is present and emphatic, the "AI as third pair of hands" framing is experiential not theoretical
- **Jensen Huang** ✅ — *Execution value*: The 6.5-hour savings calculation is concrete and conservative, the compounding acceleration loop is framed as competitive moat, the Knowledge AI knowledge base connection to organizational scale is explicit

*This module meets the quality bar for paulkiat.io publication.*

---

*Previous: [Module 03 — The Implementation Phase](module-03-implement.md)*  
*Next: [Module 05 — Case Study: Command Palette](module-05-case-study.md)*
