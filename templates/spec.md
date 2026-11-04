# Spec Delta: [Capability Name]

## Purpose

<!-- For new capabilities: 1-2 sentences (50+ characters) describing what this capability provides and why it exists. Omit for existing capabilities. -->
[Describe the purpose of this capability and the durable system boundary it governs.]

## ADDED Requirements

<!-- Requirements being introduced for the first time. Keep descriptions under 500 characters. Use SHALL or MUST. -->

### Requirement: [Requirement Name]
The system SHALL [concise observable behavior, input/output contract, or constraint].

#### Scenario: [Scenario Name]
- **WHEN** [trigger or input event occurs]
- **THEN** [expected observable system outcome]

## MODIFIED Requirements

<!-- Existing requirements whose behavior is changing. Copy the ENTIRE requirement block from living specs, edit, and keep all scenarios intact. -->

### Requirement: [Existing Requirement Name]
The system SHALL [updated normative behavior].

#### Scenario: [Preserved or Updated Scenario Name]
- **WHEN** [trigger]
- **THEN** [outcome]

## REMOVED Requirements

<!-- Requirements being deprecated or removed. Must provide explicit Reason and Migration. -->

### Requirement: [Deprecated Requirement Name]
* **Reason:** [Why this behavior is being removed or replaced]
* **Migration:** [Exact instructions on alternative API, endpoint, or behavior]

## RENAMED Requirements

<!-- Header renames only without behavioral modification. -->
* **FROM:** `### Requirement: [Old Name]`
* **TO:** `### Requirement: [New Name]`
