# Kiro Strategic Blueprint: The Complete Engineering Model

This repository serves as the **Complete Engineering Model** for Kiro IDE projects, implementing a robust, self-governing architecture based on **Spec-Driven Development (SDD)** and the **Security First** principle.

It is designed to be cloned and used as the foundation for any professional project that requires high standards of security, quality, and architectural consistency.

---

## 🚀 Quickstart: How to Use This Blueprint

This blueprint is ready to use. Simply clone the repository and open it in your Kiro IDE.

### 1. The Core: The `.kiro/` Governance System

The entire project is governed by the files within the `.kiro/` folder. This folder acts as the **Single Source of Truth** for the Kiro Agent.

| Component | Purpose | Key Files |
| :--- | :--- | :--- |
| **Steering** | **Architectural Governance.** Enforces the project's philosophy, tech stack, security standards, and structure. | `philosophy.md`, `security.md`, `tech-stack.md`, `structure.md`, `product.md` |
| **Specs** | **Spec-Driven Development.** Enforces the three-phase specification lifecycle (Requirements → Design → Tasks). | `requirements.md`, `design.md`, `tasks.md` |
| **Prompts** | **Agent Guidance.** Contains the system prompts that force the Kiro Agent to adhere to all Steering and Spec files. | `system_spec_writer.prompt.md`, `system_code_generator.prompt.md` |
| **Hooks** | **Preventive Automation.** Automatically runs security checks and documentation updates on commit/save. | `on-commit/10_security_scan.sh`, `on-save/30_update_docs.sh` |
| **Settings** | **External Context.** Configures the Model Context Protocol (MCP) to balance global (OWASP) and cloud (AWS) references. | `mcp.json` |

### 2. The Governing Principles

This blueprint enforces two non-negotiable principles:

1.  **Zero Principle: Security First** (`steering/philosophy.md`)
    *   All development activities **MUST** adhere to the security standards defined in `steering/security.md` (OWASP ASVS, AWS Best Practices).
    *   The `on-commit` hook **prevents** hardcoded secrets from reaching the repository.
2.  **Core Principle: Spec-Driven Development (SDD)** (`steering/philosophy.md`)
    *   No code generation or modification is allowed without a complete, approved Spec.

### 3. Next Steps: Start Your First Spec

To begin development, ask the Kiro Agent to create a new Spec. The Agent will guide you through the mandatory Requirements, Design, and Tasks phases, ensuring all generated code complies with the project's high standards.

---
*This README was generated and updated by the Manus Strategic Partner Agent to reflect the project's complete engineering status.*
