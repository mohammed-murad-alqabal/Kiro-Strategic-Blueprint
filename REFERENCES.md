# تحليل المراجع المعتمدة والمكونات الأساسية للقالب

هذه الوثيقة تلخص التحليل العميق لأفضل 5 مستودعات مرجعية، وتحدد المكونات الأساسية التي سيتم دمجها في القالب النموذجي `Kiro-Strategic-Blueprint`.

## 1. المراجع المعتمدة (Top 5 Repositories)

| المستودع | الرابط | التركيز الأساسي | المكونات المستخلصة |
| :--- | :--- | :--- | :--- |
| **1. kirodotdev/spirit-of-kiro** | [Link](https://github.com/kirodotdev/spirit-of-kiro) | الفلسفة، Specs، التوجيه (Steering) | الهيكل المنهجي لـ `specs/` (requirements, design, tasks)، ملفات التوجيه الفلسفية (`product.md`, `tech.md`). |
| **2. awsdataarchitect/kiro-best-practices** | [Link](https://github.com/awsdataarchitect/kiro-best-practices) | Hooks، Steering، الأمان، التشغيل | أمثلة عملية لـ `hooks/on-commit` (فحص الأمان)، `hooks/manual` (التقارير)، ملفات التوجيه التقنية (`99_security.md`). |
| **3. wirelessr/kiro-workflow-prompts** | [Link](https://github.com/wirelessr/kiro-workflow-prompts) | Prompts، سير العمل، المنهجية | `prompts/` كـ "برامج معرفية" (مثل `createSpec.prompt.md`)، ملفات التوجيه الفلسفية (`design-principle.instructions.md`). |
| **4. chidvilas1234/Project-MCP** | [Link](https://github.com/chidvilas1234/Project-MCP) | تكوين MCP، الاتصال الخارجي | إعداد ملف `settings/mcp.json` لتعريف نقاط نهاية (endpoints) خارجية للوصول إلى مصادر المعرفة. |
| **5. team-workflows/kiro-gitops-bridge** | [Link](https://github.com/team-workflows/kiro-gitops-bridge) | Hooks، الأتمتة، GitOps | مثال عملي لـ `hooks/on-commit` لربط Kiro بسير عمل GitOps (تحديث Manifests). |

## 2. المكونات الأساسية للقالب النموذجي

سيتم بناء القالب حول المكونات التالية، مع دمج أفضل الممارسات المستخلصة:

### أ. مجلد `specs/` (العقل المخطط)
*   **`specs/requirements.md`:** متطلبات القالب نفسه (ماذا يجب أن يحقق).
*   **`specs/design.md`:** الهيكل المعماري لملفات `.kiro/` وكيفية تفاعلها.
*   **`specs/metrics.md`:** تحديد مقاييس DORA و SPACE لقياس نجاح المشروع.

### ب. مجلد `steering/` (المبادئ الفلسفية والتقنية)
*   **`steering/00_philosophy.md`:** يفرض مبادئ التفكير الاستراتيجي (مستوحى من `design-principle.instructions.md`).
*   **`steering/10_tech_stack.md`:** يحدد المكدس التقني المعتمد (Go/Flutter) (مستوحى من `tech.md`).
*   **`steering/99_security.md`:** يفرض معايير الأمان (مستوحى من `99_security.md`).

### ج. مجلد `hooks/` (الأتمتة الاستباقية)
*   **`hooks/on-commit/10_security_scan.sh`:** لفحص الأمان قبل الـ Commit (مستوحى من `kiro-best-practices`).
*   **`hooks/on-save/10_update_docs.sh`:** لتحديث التوثيق تلقائيًا عند حفظ ملفات الكود.
*   **`hooks/manual/10_gitops_deploy.sh`:** لتشغيل عملية نشر GitOps يدويًا (مستوحى من `kiro-gitops-bridge`).

### د. مجلد `prompts/` (البرامج المعرفية)
*   **`prompts/create_spec.prompt.md`:** برنامج لإنشاء ملفات `specs/` جديدة بدقة (مستوحى من `kiro-workflow-prompts`).
*   **`prompts/refactor_code.prompt.md`:** برنامج لإعادة هيكلة الكود بناءً على مبادئ `steering/`.

### هـ. مجلد `settings/` (الاتصال الخارجي)
*   **`settings/mcp.json`:** إعداد خادم MCP وهمي (Mock MCP) للوصول إلى مصادر المعرفة (مستوحى من `Project-MCP`).

## 3. المكدس التقني المعتمد للقالب

لأغراض التوضيح والواقعية، سيتم اعتماد المكدس التقني التالي كـ "بيئة" يعمل فيها القالب:
*   **الواجهة الأمامية:** Flutter (مع Riverpod)
*   **الواجهة الخلفية:** Go (مع Modular Monolith)
*   **البنية التحتية:** Docker / Kubernetes (GitOps) 
