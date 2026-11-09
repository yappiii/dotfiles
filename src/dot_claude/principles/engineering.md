# Engineering Principles

These principles describe how to reason about engineering decisions, collaboration, complexity, and trade-offs.

They are not rigid rules. Apply judgment based on the context and the consequences of the decision.

## 1. Optimize for Sustainable Delivery

Optimize for sustainable delivery speed, not only immediate implementation speed.

A shortcut that makes today's implementation faster but repeatedly slows down debugging, maintenance, onboarding, reviews, or future changes is usually not a real optimization.

Engineering quality is not an end in itself.

Its purpose is to preserve the team's ability to change the system safely and quickly.

When evaluating a compromise, distinguish between:

- a one-time cost,
- a temporary and bounded compromise,
- and a recurring cost imposed on future work.

Recurring engineering costs deserve particular scrutiny.

---

## 2. Research Before Reasoning From Scratch

Before defining a complex problem or proposing a solution, investigate what the organization and codebase already know.

Useful sources include:

- existing code and tests,
- specifications and design documents,
- ADRs and other decision records,
- issues and pull requests,
- incident reports and retrospectives,
- previous implementations,
- rejected approaches,
- and day-to-day team communication such as Slack.

Look for:

- similar problems that occurred before,
- existing implementation patterns,
- previous decisions and their rationale,
- constraints that are not immediately visible,
- alternatives that were previously considered,
- known failure modes,
- and people who may possess relevant context.

A problem that appears new may already have useful fragments of its solution somewhere in the organization.

Do not copy precedent blindly.

Understand why the previous decision was made and whether its assumptions still hold.

Historical communication is evidence of context, not necessarily the current specification.

---

## 3. Structure Information Before Acting

Collected information is not yet understanding.

Organize it and make relationships explicit.

Separate at least:

- facts,
- assumptions,
- unknowns,
- constraints,
- problems,
- options,
- decisions,
- and proposed actions.

When useful, represent the problem using:

- diagrams,
- flows,
- state transitions,
- comparison tables,
- responsibility boundaries,
- dependency relationships,
- mappings between problems and responses,
- or other visual or structured representations.

The purpose is not to produce beautiful documentation.

The purpose is to transform complexity into something that can be understood intuitively, discussed precisely, and challenged by others.

---

## 4. Build Shared Understanding Before Execution

Before committing to a solution, make sure the relevant people are reasoning about the same problem.

Create a shared mental model of:

- the current state,
- the desired state,
- the problem,
- the constraints,
- the important uncertainties,
- and the proposed direction.

Prefer making ambiguity visible early rather than discovering disagreement after implementation.

When prose leaves room for interpretation, use concrete examples, diagrams, data flows, interfaces, or state changes.

Especially when multiple people or teams are involved, treat alignment as part of engineering work rather than as overhead.

---

## 5. Make Knowledge Accessible

Avoid keeping important knowledge only in the heads of experienced individuals.

Aim for a state where someone without deep historical context can understand:

- what is happening,
- why it is happening,
- what constraints exist,
- and why a decision was made.

Externalize important implicit knowledge when practical.

For complex systems, improve understandability through structure rather than relying on individual memory or expertise.

A solution that only one person can safely operate or modify carries organizational risk even if it is technically elegant.

---

## 6. Optimize for Team Understanding

Evaluate designs not only by whether they work, but also by whether the team can:

- understand them,
- review them,
- explain them,
- operate them,
- hand them over,
- and onboard new contributors into them.

A locally elegant solution can be worse than a slightly less clever solution that the whole team can reason about.

Shared understanding is often more valuable than individual cleverness.

---

## 7. Prefer Reversible Decisions

When uncertainty is high, prefer decisions that are cheap and easy to undo.

Do not over-engineer decisions that can be changed later at low cost.

Spend more design effort on decisions that are:

- difficult to reverse,
- widely depended upon,
- expensive to migrate,
- likely to affect persistent data,
- or likely to create long-lived operational constraints.

The harder a decision is to reverse, the more evidence and deliberate reasoning it deserves.

---

## 8. Keep Solutions as Simple as the Problem Allows

Choose the simplest implementation that fully satisfies the current requirements.

Avoid speculative abstractions, generalized frameworks, or extension points created only for hypothetical future requirements.

Do not confuse simplicity with shortcuts.

Simplicity removes unnecessary complexity.

A shortcut transfers complexity into the future.

Prefer straightforward implementations when future refactoring remains cheap.

---

## 9. Treat Cognitive Load as an Engineering Cost

Minimize how much context a developer must keep in their head to safely understand and change the system.

Prefer:

- explicit behavior,
- clear boundaries,
- predictable conventions,
- local reasoning,
- and visible dependencies.

Avoid designs that require developers to understand:

- historical accidents,
- undocumented assumptions,
- hidden coupling,
- unnecessary indirection,
- inconsistent patterns,
- or scattered special cases.

If a technically correct design significantly increases cognitive load, consider a simpler alternative.

---

## 10. Take Technical Debt Deliberately

Technical debt can be an acceptable trade-off.

A shortcut may be reasonable when:

- the business value of speed is meaningful,
- the compromise is understood,
- the affected scope is limited,
- the decision is easy to reverse,
- the ongoing operational cost is small,
- and the debt is unlikely to silently spread.

Avoid shortcuts that impose recurring costs on every future change.

Recurring:

- debugging,
- manual operations,
- fragile deployments,
- difficult onboarding,
- review complexity,
- and repeated workarounds

are interest payments on technical debt.

Do not create recurring engineering taxes for small one-time gains.

---

## 11. Prefer Local and Incremental Change

Prefer small changes with limited blast radius.

Avoid broad refactors unless they are necessary to solve the current problem or materially reduce an existing cost.

When changing existing code, improve the area when doing so is cheap and relevant, but do not turn every task into a redesign.

Prefer incremental improvement over large speculative cleanup.

---

## 12. Preserve Reasonable Consistency

Prefer existing conventions when they are reasonable.

A locally elegant solution can be worse than a slightly less elegant solution that matches the surrounding system.

Introduce a new pattern when the existing pattern creates a meaningful problem, not merely because another design appears cleaner in isolation.

When introducing a new pattern, make the reason explicit.

Avoid leaving competing approaches without a clear reason.

---

## 13. Optimize for Changeability

Prefer architectures that keep future changes localized and understandable.

Keep responsibilities and dependencies explicit.

Separate business rules from infrastructure concerns when that separation meaningfully reduces coupling or cognitive load.

Avoid coupling unrelated parts of the system merely to reduce today's implementation effort.

The goal is not maximum abstraction.

The goal is minimizing the cost of future change.

---

## 14. Use AI to Reduce the Cost of Reversible Work

AI-assisted development lowers the cost of implementation, experimentation, and refactoring.

Therefore, avoid premature abstraction whose primary purpose is saving hypothetical future coding effort.

It is often better to implement the straightforward solution now and refactor when real requirements emerge.

However, AI does not eliminate:

- migration cost,
- production risk,
- data compatibility concerns,
- operational complexity,
- cognitive load,
- organizational coordination,
- or the cost of decisions that are difficult to reverse.

Treat those costs as real even when generating code is cheap.

---

## 15. Make Trade-offs Explicit

When choosing a non-obvious implementation or accepting a compromise, reason explicitly about:

- What are we optimizing for?
- What cost are we accepting?
- Is the decision reversible?
- Who will pay the ongoing cost?
- Is the cost one-time or recurring?
- Does this increase cognitive load?
- What relevant precedent or prior knowledge exists?
- Which statements are facts, assumptions, or unknowns?
- Do the relevant people share the same understanding of the problem?
- Will this make the next change easier or harder?

Prefer compromises that are visible and intentional rather than accidental.
