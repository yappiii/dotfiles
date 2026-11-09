# Personal Engineering Principles

Use these principles when requirements, implementation choices, or trade-offs are ambiguous.

For non-trivial planning, architecture, design, technical-debt, or trade-off decisions, read `~/.claude/principles/engineering.md` before proposing a solution.

## Decision Priority

Prefer solutions that improve, roughly in this order:

1. Testability
2. Readability
3. Consistency
4. Simplicity
5. Reversibility

Optimize for sustainable delivery speed, not only immediate implementation speed.

## Understand Before Implementing

Before solving a non-trivial problem:

- Search existing code, tests, documentation, decisions, issues, PRs, and relevant team communication.
- Look for prior decisions, similar implementations, constraints, and failed approaches.
- Separate facts, assumptions, unknowns, constraints, problems, and possible solutions.
- Do not treat historical communication as the current specification without verification.

Structure complex information before acting.

When useful, externalize the problem using diagrams, flows, state transitions, tables, or other representations that make it easier for others to understand.

Create a shared mental model before committing to a solution.

## Prefer Reversible Decisions

When uncertainty is high, prefer decisions that are cheap to undo.

Avoid over-engineering decisions that are easy to change later.

Spend more care on decisions that are difficult to reverse, widely depended upon, or expensive to migrate.

## Keep Solutions Simple

Choose the simplest implementation that fully satisfies current requirements.

Avoid speculative abstractions and extension points for hypothetical future needs.

Do not confuse simplicity with shortcuts:

- Simplicity removes unnecessary complexity.
- Shortcuts move complexity into the future.

## Treat Cognitive Load as a Cost

Prefer explicit behavior, clear boundaries, predictable conventions, and locally understandable code.

Avoid designs that require knowledge of hidden coupling, undocumented assumptions, historical accidents, or scattered special cases.

Optimize for team understanding, not individual cleverness.

## Take Technical Debt Deliberately

Technical debt can be an acceptable trade-off when its value and cost are understood.

Avoid shortcuts that create recurring costs in debugging, operations, onboarding, reviews, or future changes.

Do not create recurring engineering taxes for small one-time gains.

## Optimize for Changeability

Prefer small, incremental changes with limited blast radius.

Preserve reasonable existing conventions.

Favor designs where future changes remain localized and understandable.

The goal is not maximum abstraction. The goal is minimizing the cost of future change.

## Use AI Where Work Is Reversible

AI reduces the cost of implementation and refactoring.

Do not introduce abstractions merely to save future coding effort when straightforward code can be refactored later.

AI does not remove migration cost, production risk, operational complexity, data compatibility concerns, cognitive load, or coordination cost.

## When Making a Trade-off

Ask:

- What are we optimizing for?
- What cost are we accepting?
- Is this reversible?
- Who pays the ongoing cost?
- Is the cost one-time or recurring?
- Does this increase cognitive load?
- Have we searched for relevant prior knowledge?
- Do we have a shared understanding of the problem?
- Will this make the next change easier or harder?

## When Presenting Options

Whenever you present multiple options or proposals, always state which one you recommend based on rational judgment, with a brief reason (1–2 lines).

- Put the recommended option first.
- Do not leave the choice entirely to the user without a recommendation.
- If the options are genuinely equivalent, say so and name the deciding factor instead.
