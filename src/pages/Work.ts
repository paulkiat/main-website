import { Header } from '../components/Header'
import { Footer } from '../components/Footer'
import { CTA } from '../components/CTA'

export function WorkPage(): string {
  return `
    ${Header('/work')}

    <section class="section">
      <div class="container-custom">
        <div class="max-w-3xl mx-auto text-center mb-16">
          <h1 class="heading-xl mb-6">Speaking & Consulting</h1>
          <p class="text-xl text-slate-600 dark:text-slate-300">
            Transform your engineering teams through psychology-informed leadership
          </p>
        </div>

        <!-- Speaking Topics -->
        <div class="mb-20">
          <h2 class="heading-lg text-center mb-12">Speaking Topics</h2>
          <div class="grid md:grid-cols-2 gap-6 max-w-5xl mx-auto">
            ${renderTopic({
              title: "The Psychology of Code Reviews",
              description: "Why your team takes feedback personally and how to build constructive review cultures using psychological principles.",
              audience: "Engineering managers, tech leads, senior engineers",
              duration: "45-60 min keynote or 2-hour workshop"
            })}

            ${renderTopic({
              title: "From Conflict to Collaboration: Engineering Team Dynamics",
              description: "Transform siloed teams into cohesive units. The Seven Habits framework applied to 40-person Medicare modernization teams.",
              audience: "Engineering leaders, CTOs, VP Engineering",
              duration: "45-60 min keynote"
            })}

            ${renderTopic({
              title: "AI-Augmented Engineering: Beyond Copilot",
              description: "Strategic vs tactical AI use. How I used Claude to reorganize this codebase in 10 phases with zero downtime.",
              audience: "Engineering teams, architects, tech leaders",
              duration: "30-45 min talk or 90 min workshop"
            })}

            ${renderTopic({
              title: "The Human Cost of Technical Debt",
              description: "How technical debt creates team burnout, and why fixing the human problems first leads to better technical solutions.",
              audience: "Engineering leaders, product managers, executives",
              duration: "30-45 min talk"
            })}

            ${renderTopic({
              title: "Modernizing Medicare: Leading Change in Risk-Averse Systems",
              description: "Lessons from modernizing government infrastructure at national scale. Change management when failure affects millions.",
              audience: "Government tech, enterprise leaders, regulated industries",
              duration: "45-60 min keynote"
            })}

            ${renderTopic({
              title: "Building Psychologically Safe Engineering Cultures",
              description: "Applied psychology for engineering environments. From formal psychology training to managing 101+ employees.",
              audience: "Engineering leaders, HR/People Ops, culture builders",
              duration: "45-60 min keynote or half-day workshop"
            })}

            ${renderTopic({
              title: "The Seven Habits for Engineering Teams",
              description: "Stephen Covey's framework adapted for software engineering. Real case study: transforming 40-person Medicare team from silos to synergy.",
              audience: "Cross-functional teams, engineering managers",
              duration: "60-90 min workshop"
            })}
          </div>
        </div>

        <!-- Case Studies -->
        <div class="mb-20">
          <h2 class="heading-lg text-center mb-12">Case Studies</h2>
          <div class="space-y-12">
            ${renderCaseStudy({
              title: "Medicare Team Transformation: From Silos to Synergy",
              challenge: "40-person Medicare modernization team split between two groups. Both technically skilled, but working in silos with duplicated work and mounting frustration. Collaboration had completely broken down.",
              solution: "Facilitated psychology-informed retrospective using Stephen Covey's 'Seek First to Understand, Then to Be Understood.' Applied structured empathy exercises, assumption challenging, and active listening frameworks.",
              before: [
                "Two teams working in silos",
                "Duplicated work across groups",
                "Mounting frustration on both sides",
                "Different approaches to same problems",
                "Productivity blocked by poor collaboration"
              ],
              after: [
                "Seamless, cohesive team collaboration",
                "Teams actively seek to understand each other",
                "Empathy replaced frustration",
                "Unified approach to technical decisions",
                "Self-organizing around shared goals"
              ],
              impact: [
                { metric: "40", label: "Engineers transformed" },
                { metric: "1", label: "Retrospective cycle" },
                { metric: "USA", label: "Medicare scale" }
              ],
              tags: ["Psychology", "Seven Habits", "Government Scale", "Team Dynamics", "Medicare"],
              image: "from-primary-500 to-primary-600"
            })}

            ${renderCaseStudy({
              title: "Whole Team Context Engineering: From AI Resistance to AI-Native",
              challenge: "A 4-person ensemble team had access to AI tools but wasn't using them effectively. Cognitive biases blocked adoption — engineers were skeptical, unsure how to prompt, and working with AI individually instead of collectively.",
              solution: "Introduced Whole Team Context Engineering — AI as driver, humans as navigators. Phase 1: Education. Phase 2: Showing (live sessions with James, Joel, Nechama, and Paul). Phase 3: Experimentation. Built shared context blocks so AI understood the codebase's conventions and constraints.",
              before: [
                "Cognitive biases blocking AI adoption",
                "Individual prompting with poor results",
                "No shared context for AI across the team",
                "8+ iterations to get usable AI output",
                "Skepticism and frustration with AI tools"
              ],
              after: [
                "Team thinking with AI, not at it",
                "Solutions the team couldn't reach alone",
                "Shared context blocks in the repo",
                "2-minute modifications to AI-generated solutions",
                "Engineers who genuinely enjoy the work more"
              ],
              impact: [
                { metric: "4", label: "Person ensemble" },
                { metric: "↑", label: "Creativity & productivity" },
                { metric: "↑", label: "Developer experience" }
              ],
              tags: ["Whole Team Context Engineering", "Pair Thinking", "AI Adoption", "Ensemble Programming"],
              image: "from-emerald-500 to-teal-600"
            })}

            ${renderCaseStudy({
              title: "AI-Augmented Codebase Reorganization",
              challenge: "Triple-nested directory structure causing confusion. Unclear architecture, hard-coded paths, scattered configuration. Manual reorganization too risky—one wrong move could break the entire production system.",
              solution: "Used Claude strategically as architecture partner (not code generator). Planned 10 incremental phases. Maintained constraint: 'entire codebase must compile, build, and work to demo after every change.'",
              before: [
                "Triple-nested directories",
                "Hard-coded paths everywhere",
                "Configuration scattered",
                "No clear separation of concerns",
                "High risk of breaking changes"
              ],
              after: [
                "Clean, flat directory structure",
                "Shared constants (TypeScript + JavaScript)",
                "Centralized configuration",
                "Hexagonal architecture principles",
                "Comprehensive documentation generated"
              ],
              impact: [
                { metric: "10", label: "Phases completed" },
                { metric: "0", label: "Downtime minutes" },
                { metric: "90%", label: "Project completion" }
              ],
              tags: ["AI Strategy", "Claude", "Architecture", "TypeScript", "Zero Downtime"],
              image: "from-accent-500 to-accent-600"
            })}
          </div>
        </div>

        <!-- Consulting Services -->
        <div class="mb-20">
          <h2 class="heading-lg text-center mb-12">Consulting Services</h2>
          <div class="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
            <div class="card">
              <h3 class="heading-sm mb-3">Team Dynamics Assessment</h3>
              <p class="text-slate-700 dark:text-slate-300 mb-4">
                Identify collaboration breakdowns, communication patterns, and psychological barriers preventing high performance.
              </p>
              <ul class="space-y-2 text-sm text-slate-600 dark:text-slate-400">
                <li class="flex items-start"><span class="mr-2">•</span><span>Cross-functional team analysis</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Communication pattern mapping</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Psychology-informed recommendations</span></li>
              </ul>
            </div>

            <div class="card">
              <h3 class="heading-sm mb-3">Cross-Functional Collaboration Facilitation</h3>
              <p class="text-slate-700 dark:text-slate-300 mb-4">
                Structured interventions to transform siloed teams into cohesive units using proven psychology frameworks.
              </p>
              <ul class="space-y-2 text-sm text-slate-600 dark:text-slate-400">
                <li class="flex items-start"><span class="mr-2">•</span><span>Seven Habits retrospectives</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Empathy exercises and assumption challenging</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Sustainable collaboration patterns</span></li>
              </ul>
            </div>

            <div class="card">
              <h3 class="heading-sm mb-3">Psychology-Informed Leadership Coaching</h3>
              <p class="text-slate-700 dark:text-slate-300 mb-4">
                1-on-1 coaching for engineering leaders applying formal psychology principles to team management challenges.
              </p>
              <ul class="space-y-2 text-sm text-slate-600 dark:text-slate-400">
                <li class="flex items-start"><span class="mr-2">•</span><span>Cognitive bias recognition</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Psychological safety building</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Conflict resolution frameworks</span></li>
              </ul>
            </div>

            <div class="card">
              <h3 class="heading-sm mb-3">AI Adoption Strategy for Engineering Teams</h3>
              <p class="text-slate-700 dark:text-slate-300 mb-4">
                Strategic (not tactical) AI integration. Human-AI collaboration patterns demonstrated through real projects.
              </p>
              <ul class="space-y-2 text-sm text-slate-600 dark:text-slate-400">
                <li class="flex items-start"><span class="mr-2">•</span><span>Strategic vs tactical AI use</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Architecture partner approach</span></li>
                <li class="flex items-start"><span class="mr-2">•</span><span>Team AI workflow integration</span></li>
              </ul>
            </div>
          </div>
        </div>

        <!-- Testimonials / Emerging Speaker Section -->
        <div class="card bg-slate-50 dark:bg-slate-800/50 max-w-3xl mx-auto text-center mb-20">
          <h2 class="heading-md mb-4">Building Speaking Portfolio</h2>
          <p class="text-slate-700 dark:text-slate-300 mb-6">
            As an emerging voice in psychology-informed engineering leadership, I'm currently building my speaking portfolio
            and available for:
          </p>
          <div class="grid md:grid-cols-3 gap-4 text-sm">
            <div class="bg-white dark:bg-slate-900 p-4 rounded-lg">
              <div class="font-semibold text-slate-900 dark:text-slate-100 mb-1">Conferences</div>
              <div class="text-slate-600 dark:text-slate-400">Regional & national tech events</div>
            </div>
            <div class="bg-white dark:bg-slate-900 p-4 rounded-lg">
              <div class="font-semibold text-slate-900 dark:text-slate-100 mb-1">Company Events</div>
              <div class="text-slate-600 dark:text-slate-400">All-hands, offsites, leadership summits</div>
            </div>
            <div class="bg-white dark:bg-slate-900 p-4 rounded-lg">
              <div class="font-semibold text-slate-900 dark:text-slate-100 mb-1">Workshops</div>
              <div class="text-slate-600 dark:text-slate-400">Half-day to full-day team transformations</div>
            </div>
          </div>
          <p class="text-sm text-slate-500 dark:text-slate-500 mt-6">
            <strong>Remote engagements preferred.</strong> Available for travel to scale-ups and enterprise organizations.
          </p>
        </div>
      </div>
    </section>

    ${CTA({
      title: "Let's Transform Your Team",
      description: "Your engineers have the technical skills. Let's unlock the collaboration that makes great software possible.",
      primaryButton: {
        text: "Book a speaking engagement",
        href: "/contact"
      },
      secondaryButton: {
        text: "Learn about consulting",
        href: "/contact"
      }
    })}

    ${Footer()}
  `
}

interface TopicProps {
  title: string
  description: string
  audience: string
  duration: string
}

function renderTopic(props: TopicProps): string {
  return `
    <div class="card">
      <h3 class="heading-sm mb-3">${props.title}</h3>
      <p class="text-slate-700 dark:text-slate-300 mb-4">
        ${props.description}
      </p>
      <div class="space-y-2 text-sm text-slate-600 dark:text-slate-400">
        <div><strong>Audience:</strong> ${props.audience}</div>
        <div><strong>Duration:</strong> ${props.duration}</div>
      </div>
    </div>
  `
}

interface CaseStudyProps {
  title: string
  challenge: string
  solution: string
  before: string[]
  after: string[]
  impact: Array<{ metric: string; label: string }>
  tags: string[]
  image: string
}

function renderCaseStudy(props: CaseStudyProps): string {
  return `
    <div class="card">
      <!-- Header with gradient visual -->
      <div class="grid md:grid-cols-2 gap-8 mb-6">
        <div class="aspect-video bg-gradient-to-br ${props.image} rounded-lg flex items-center justify-center">
          <svg class="w-20 h-20 text-white opacity-50" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
          </svg>
        </div>
        <div class="flex flex-col justify-center">
          <h3 class="heading-md mb-3">${props.title}</h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wide mb-1">Challenge</p>
              <p class="text-slate-700 dark:text-slate-300">${props.challenge}</p>
            </div>
            <div>
              <p class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wide mb-1">Solution</p>
              <p class="text-slate-700 dark:text-slate-300">${props.solution}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Before/After Comparison -->
      <div class="grid md:grid-cols-2 gap-6 mb-6 p-6 bg-slate-50 dark:bg-slate-800/50 rounded-lg">
        <div>
          <div class="flex items-center gap-2 mb-3">
            <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
            <h4 class="font-semibold text-slate-900 dark:text-slate-100">Before</h4>
          </div>
          <ul class="space-y-2">
            ${props.before.map(item => `
              <li class="flex items-start gap-2 text-sm text-slate-600 dark:text-slate-400">
                <span class="text-red-500 mt-1">•</span>
                <span>${item}</span>
              </li>
            `).join('')}
          </ul>
        </div>
        <div>
          <div class="flex items-center gap-2 mb-3">
            <svg class="w-5 h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
            </svg>
            <h4 class="font-semibold text-slate-900 dark:text-slate-100">After</h4>
          </div>
          <ul class="space-y-2">
            ${props.after.map(item => `
              <li class="flex items-start gap-2 text-sm text-slate-600 dark:text-slate-400">
                <span class="text-green-500 mt-1">•</span>
                <span>${item}</span>
              </li>
            `).join('')}
          </ul>
        </div>
      </div>

      <!-- Impact Metrics -->
      <div class="grid grid-cols-3 gap-4 mb-6">
        ${props.impact.map(item => `
          <div class="text-center p-4 bg-gradient-to-br from-primary-50 to-accent-50 dark:from-primary-900/20 dark:to-accent-900/20 rounded-lg">
            <div class="text-3xl font-bold text-gradient mb-1">${item.metric}</div>
            <div class="text-xs text-slate-600 dark:text-slate-400 font-medium">${item.label}</div>
          </div>
        `).join('')}
      </div>

      <!-- Technologies/Tags -->
      <div class="flex flex-wrap gap-2">
        ${props.tags.map(tag => `
          <span class="px-3 py-1 bg-accent-50 dark:bg-accent-900/30 text-accent-700 dark:text-accent-400 rounded-full text-sm font-medium">${tag}</span>
        `).join('')}
      </div>
    </div>
  `
}
