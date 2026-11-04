# Proposal: [Feature Name]

* **Author:** [Author Name or GitHub Handle]
* **Date:** [YYYY-MM-DD]
* **Status:** Draft

## 1. Executive Summary & Problem Statement

<!-- 2-3 sentences: What specific problem, bottleneck, or pain point does this solve? Why now? -->

## 2. Six-Lens Shootdown Analysis

<!-- Evaluated with Elephant Ideator before drafting -->

* **Contrarian / YAGNI:** [Why does this feature need to exist? Can an existing library, API, or pattern solve 80% of this without new code?]
* **Cost, Quota & Token Economics:** [Expected QPS, memory footprint, database load, or LLM token budgets. Are quota ceilings at risk?]
* **UX & Developer Ergonomics:** [Is the CLI/API intuitive? Are error messages actionable, or does it add cognitive friction?]
* **Migration & Backward Compatibility:** [How do existing clients/data migrate? Does this break serialized schemas, APIs, or persistent storage?]
* **Observability & SRE Debuggability:** [Are operations traceable via logs/telemetry? How will oncall engineers triage a production failure?]
* **Long-Term Tech Debt:** [Does this introduce tight coupling or brittle state machines that will be painful to maintain in 2 years?]

## 3. Goals vs. Non-Goals

* **In-Scope Goals:**
  - [Explicit goal 1]
  - [Explicit goal 2]
* **Out-of-Scope Non-Goals:**
  - [Explicit non-goal 1]
  - [Explicit non-goal 2]

## 4. Alternatives Weighed

<!-- Each option rejected during ideation, with technical justification. Attribute rejections to author, not unattributed maintainers. -->
* **Alternative 1:** [Description] - **Rejected by author:** [Technical reason]
* **Alternative 2:** [Description] - **Rejected by author:** [Technical reason]

## 5. Affected Capabilities & Specifications

<!-- List capabilities being introduced or modified. Each capability will become a spec file under specs/<capability-path>/spec.md -->
* **New Capabilities:**
  - `<capability-path>`: [Short description of durable behavior boundary]
* **Modified Capabilities:**
  - `<existing-capability-path>`: [Description of changed requirements]

## 6. Target Impact & File Boundary

* **Affected Services / Modules:** [List of components]
* **Estimated File Scope:** [Anticipated files to be touched or created]
