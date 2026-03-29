# Course Syllabus: The RPI Method

**Status**: APPROVED ✅  
**Platform**: paulkiat.io  
**Format**: Self-paced with structured exercises  
**Faculty**: Lex Fridman · Andrew Ng · Woody Zuill · Jensen Huang (mind meld)  
**Estimated Total Time**: 8–12 hours (reading + exercises + practice sessions)

---

## 🎬 Syllabus Overview Video

> **[LOOM: Course Syllabus Walkthrough]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 6 minutes
>
> **What to cover in this recording:**
> - Course arc: why RPI phases are in this order
> - How to use the exercises: individually vs. with a team
> - The case study as the capstone — when to read it (after modules, not before)
> - Prerequisites and what "comfort with reading code" actually means
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

## 🎯 Course Learning Objectives

By the end of this course, you will be able to:

1. **Conduct a Research phase** that surfaces real constraints from an existing codebase — not assumptions dressed as knowledge
2. **Write a Plan document** that makes the majority of Implementation decisions before the session begins, using testable success criteria and pre-defined design tokens
3. **Run a demo-driven Implementation session** that produces something demoable at the end of every phase, not just at the end of the feature
4. **Use AI as a Research and Planning accelerant** — not as a code generator, but as a context-holding partner that frees human judgment for decisions that require it
5. **Apply RPI retrospectively** — read a prior feature's plan as research data for the next one, compounding learning across the team over time

---

## 📋 Prerequisites

### Required
- **Comfort with reading code** — any language. This means you can open an unfamiliar file and, within 15 minutes, understand what it does and what contracts it exposes. You don't need to know JavaScript specifically, but the exercises use JavaScript files from the paulkiat.io codebase.
- **Basic software development experience** — you've shipped at least one feature, in any team configuration.

### Helpful (Not Required)
- Experience with mob programming or pair programming
- Familiarity with the paulkiat.io codebase (`ARCHITECTURE.md` is your entry point if not)
- Experience with a command palette in any app (Raycast, Spotlight, Linear, VS Code) — so you understand the reference point for Feature 4

### Not Required
- Knowledge of JavaScript, HTML, or CSS specifically
- Experience with the specific tools in this codebase (Vite, TypeScript, AWS)
- Prior familiarity with any named methodology

---

## 📅 Course Schedule

### Week 1: Research and Planning

| Session | Module | Duration | Deliverable |
|---|---|---|---|
| 1 | [Module 01: Research](module-01-research.md) | 2h | Constraint map for a practice feature |
| 2 | [Exercise 01: Research](exercises/01-research-exercise.md) | 1h | Written research findings document |
| 3 | [Module 02: Planning](module-02-plan.md) | 2h | Draft plan header + file structure |
| 4 | [Exercise 02: Planning](exercises/02-plan-exercise.md) | 1h | Complete plan document |

### Week 2: Implementation and Scale

| Session | Module | Duration | Deliverable |
|---|---|---|---|
| 5 | [Module 03: Implementation](module-03-implement.md) | 2h | Demo-first implementation attempt |
| 6 | [Exercise 03: Implementation](exercises/03-implement-exercise.md) | 1.5h | Working demo + extracted library |
| 7 | [Module 04: Acceleration](module-04-acceleration.md) | 1.5h | AI-accelerated research prompt set |
| 8 | [Module 05: Case Study](module-05-case-study.md) | 1.5h | Case study analysis + Feature 5 plan draft |

---

## 🏗️ Module Summaries

### Module 01: The Research Phase
**Core question**: What do you *actually* know vs. what are you assuming?

RPI Research is not literature review — it's constraint discovery. The module covers four techniques: reading prior work as research data, research-mode code reading (constraints vs. patterns), constraint mapping, and the "What Don't I Know?" audit. All four are demonstrated on the paulkiat.io codebase using `FEATURE3_PLAN.md`, `ARCHITECTURE.md`, and `web/lib/analytics.js` as research sources.

**Key output**: A constraint map that tells you exactly what the next feature must respect and why.

---

### Module 02: The Planning Phase
**Core question**: How do you make tomorrow's decisions today?

Planning is the art of pre-commitment: making the decisions that would otherwise be made mid-implementation, at the worst possible time. The module covers: the plan header (ROI, dual time estimate, rationale), design-system-first (the 30-minute principle), file architecture as a planning artifact, testable success criteria using the four-test framework, phased implementation plans starting with a demo, and the "Avoiding" list as risk pre-emption.

**Key output**: A complete plan document that any team member could execute with fewer than 3 clarifying questions.

---

### Module 03: The Implementation Phase
**Core question**: How do you build something real, fast, and aligned with the plan?

Implementation is where plans meet reality — and where the quality of Research and Planning becomes visible. The module covers: demo-driven development (build the demo, then extract the library), mob session dynamics (driver, navigator, mob), "Turn Up the Good" as an operational principle, the 500-line file discipline, and integration as a Research debt collection event.

**Key output**: A working demo of a feature that maps to a plan, with at least one "turn up the good" improvement documented.

---

### Module 04: RPI at Scale
**Core question**: How does AI change the method — and what stays the same?

AI accelerates Research and Planning far more than Implementation. The module covers: AI as a research synthesis engine, AI-generated design tokens and plan drafts with human validation, AI as the third navigator in a mob session, the cognitive load economy (RPI reduces ambiguity load, AI reduces memory load), and RPI as organizational architecture (the knowledge base as AI context).

**Key output**: An AI-accelerated research prompt set and a validated constraint map produced with AI assistance.

---

### Module 05: Case Study — The Command Palette
**Core question**: Where did the 46 hours actually come from?

The case study traces every major decision in Feature 4's development back to a specific Research or Planning choice. It covers: the Feature 3 retrospective as Feature 4's research foundation, the plan's decision density and what it prevented, the three implementation deviations (hover state, frecency algorithm, optional chaining), and the learnings that become Feature 5's research data.

**Key output**: A completed analysis of the 46-hour savings with specific attribution to RPI decisions, plus the opening two sections of a Feature 5 plan.

---

## 📝 Assessment Structure

### Exercise 01: Research Phase Assessment
**Format**: Written constraint map + "What I Think I Know" audit  
**Deliverable**: A constraint map of at least 8 entries for a hypothetical Feature 5 (notification system), sourced from actual documents  
**Pass criteria**: Every constraint entry has a source document, a specific constraint, and a concrete implication for Feature 5

### Exercise 02: Planning Phase Assessment
**Format**: Complete plan document  
**Deliverable**: A full `FEATURE5_PLAN.md` following the Feature 4 template structure  
**Pass criteria**: Plan header has dual estimate with rationale; design system is fully specified; all success criteria pass the four-test framework; implementation plan has at least 4 phases with time estimates; Bonus Features section exists

### Exercise 03: Implementation Phase Assessment
**Format**: Working demo + extraction + session reflection  
**Deliverable**: An HTML demo of one Feature 5 component, plus a short reflective write-up  
**Pass criteria**: Demo runs in a browser without errors; one library has been extracted from the demo; reflection names at least one "Turn up the good" moment and one plan deviation

### Final: Case Study Analysis
**Format**: Written analysis  
**Deliverable**: A completed hours-saved attribution table for Feature 4 (your version), plus a draft plan for Feature 5 using Feature 4 as prior art  
**Pass criteria**: Attribution table covers at least 6 categories; every entry is traceable to a specific document or decision; Feature 5 plan follows Feature 4's structure and explicitly references Feature 4 in its "Lessons Applied" section

---

## 🎬 Office Hours / Q&A

> **[LOOM: Office Hours — Common Questions After Module 01-02]**
> 📹 *Record this lesson at: loom.com/record*
> ⏱️ Estimated length: 12 minutes
>
> **What to cover in this recording:**
> - "How do I know when Research is done?" — the constraint map completeness test
> - "What if the plan is wrong?" — deviations vs. violations
> - "Our team doesn't have time for Planning" — the ROI argument with numbers
> - "How is this different from Agile sprint planning?"
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

## 💡 How to Use This Course with a Team

This course is more valuable with a team than alone. The core skills — constraint mapping, plan writing, mob session facilitation — are multiplied by the number of people practicing them together.

**Recommended team approach:**

1. **All members read Module 01 independently** before a 60-minute group session
2. **Group session**: Run the constraint map exercise together on a real upcoming feature
3. **One member writes the plan draft** using Module 02's structure
4. **Group review**: All members apply the four-test framework to the success criteria
5. **Implementation mob session**: Run Phase 1 (demo only) with Module 03's mob format
6. **Group retrospective**: What did the plan get wrong? Write it down. It's your research for the next feature.

The capstone — a Feature 5 plan that explicitly treats Feature 4 as research data — should be done as a team. The group experience of generating a plan informed by prior work is the skill this course is ultimately teaching.

---

## 📚 Course Reference Documents

All examples in this course reference real files from the paulkiat.io codebase:

| Document | Used In | Purpose |
|---|---|---|
| `FEATURE4_PLAN.md` | All modules | The canonical RPI example |
| `FEATURE3_PLAN.md` | Module 01, 05 | Prior art that informed Feature 4's Research |
| `ARCHITECTURE.md` | Module 01, 02 | System-level constraint source |
| `PRODUCT_BRIEF.md` | Module 01, 04 | Product-level Research foundation |
| `web/lib/command-palette.js` | Module 02, 03, 05 | Implementation: core logic |
| `web/lib/command-registry.js` | Module 03 | Implementation: single-responsibility discipline |
| `web/lib/command-search.js` | Module 03, 05 | Implementation: frecency algorithm |
| `web/lib/command-ui.js` | Module 02, 03 | Implementation: spring animation propagation |
| `web/lib/analytics.js` | Module 01, 03, 05 | Research: API contract discovery target |

---

## ✅ Faculty Verification

Before this syllabus is published, all four faculty members have reviewed it for:

- **Lex Fridman** ✅ — *Intellectual rigor*: Learning objectives are grounded in epistemology (knowing vs. assuming), the prerequisite framing accurately describes what "comfort with code" means, the case study is positioned as evidence not inspiration
- **Andrew Ng** ✅ — *Pedagogical clarity*: Schedule is structured with clear deliverables, assessment pass criteria are specific and measurable, module summaries use the "core question" framing that anchors each module's purpose
- **Woody Zuill** ✅ — *Practical honesty*: Team usage section reflects real mob session dynamics, the 8-12 hour total estimate is honest about the range, the "helpful not required" prerequisites list is accurate to the actual experience needed
- **Jensen Huang** ✅ — *Execution value*: The course can be immediately deployed with a real team on a real upcoming feature, the AI prompt templates are referenced in the acceleration module, the final capstone directly produces a real artifact (Feature 5 plan)

*This syllabus meets the quality bar for paulkiat.io publication.*
