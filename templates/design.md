# Technical Design: [Feature Name]

* **Status:** In Review
* **Target Release:** [Milestone / Sprint]

---

## Part 1: Feature Architecture (FeatureRange)

### 1. Heilmeier Catechism & Problem Context

1. **What are we trying to do?** [Articulate problem without jargon.]
2. **How is it done today, and what are the limits of current practice?** [Current architecture bottlenecks.]
3. **What is new in our approach and why do we think it will succeed?** [Core architectural innovation.]
4. **Who cares? If we are successful, what difference will it make?** [Impact on latency, throughput, or DX.]
5. **What are the risks?** [Key technical unknowns.]
6. **How much will it cost?** [Infrastructure, compute, or token budgets.]
7. **How long will it take?** [Rough engineering timeline.]
8. **What are the mid-term and final "exams" to check for success?** [Quantifiable success metrics.]

### 2. System Architecture & Component Interaction

```
[Insert ASCII/Mermaid component interaction diagram here]
```

* **Component Responsibilities:** [Data structures, boundaries, and lifecycles.]
* **Protocol & API Contracts:** [Typed interfaces, request/response formats, error models.]

### 3. Decisions & Trade-offs Weighed

* **Decision 1: [Choice Made]**
  - **Rationale:** [Why choice X was selected over Y.]
  - **Trade-off:** [Known limitation or accepted downside.]
  - **Alternatives Considered:** [Option A, Option B.]

---

## Detailed Implementation Plan

<!-- CRITICAL: Semantic split boundary line. Content below this header is DetailedRange. -->
<!-- ZERO-DECISION RULE: Leave zero choices open to the implementer. -->

### 4. Target Scope & File Boundary Allowlist

<!-- Strictly enforceable: Implementation may ONLY touch or create the files listed below. -->

* **New Files to Create:**
  - `path/to/new_file.ts` - [Single responsibility]
* **Existing Files to Modify:**
  - `path/to/existing_file.ts` - [Specific function or type to update]
* **Explicitly Prohibited Files:**
  - `path/to/untouchable/**` - [Protected boundary]

### 5. Step-by-Step Execution Logic

#### Step 1: Data Models & Type Signatures
* Define exact types, exported constants, and error classes.
* Verify types compile via typechecker.

#### Step 2: Core Algorithm & State Transitions
* Implement logic adhering strictly to the spec contract.
* Co-locate unit tests verifying edge cases and boundary conditions.

#### Step 3: Integration & External Boundaries
* Wire components to CLI or service endpoints.
* Verify end-to-end integration scenario passes.

### 6. Verification Commands & Regression Tests

```bash
# Exact commands the implementer must execute to verify completion:
pnpm vitest run path/to/test.ts
pnpm lint
```
