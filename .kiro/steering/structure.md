'''# التوجيه الهيكلي والمعماري (Architectural and Structural Steering)

## المبدأ الأساسي: الفصل الواضح للمسؤوليات (Clear Separation of Concerns)
يجب أن يتم تنظيم المشروع بطريقة تعكس الفصل الواضح للمسؤوليات المعمارية، مما يضمن قابلية الصيانة والتوسع.

## 1. تنظيم المستوى الجذري (Root Level Organization)

يجب أن يتبع هيكل المشروع نمط الخدمات المصغرة (Microservices) أو المكونات المنفصلة (Decoupled Components) لضمان قابلية التوسع والصيانة.

### أ. اختيار نمط المستودع (Repository Pattern)

يجب أن يلتزم المشروع بأحد الأنماط التالية، ويجب توثيق الاختيار في `specs/design.md`:

| النمط | الوصف | التوجيه |
| :--- | :--- | :--- |
| **Monorepo** | جميع الخدمات والمكونات في مستودع واحد. | **موصى به للمشاريع الصغيرة والمتوسطة** لتبسيط إدارة التبعيات والـ CI/CD. |
| **Polyrepo** | كل خدمة أو مكون في مستودع منفصل. | **موصى به للمشاريع الكبيرة جدًا** التي تتطلب استقلالية نشر عالية. |

| المجلد | الوصف | التوجيه المعماري |
| :--- | :--- | :--- |
| `client/` | تطبيق الواجهة الأمامية (Frontend Application) (Flutter). | يجب أن يتبع نمط MVVM أو Component-Based Architecture. |
| `server/` | تطبيق الواجهة الخلفية (Backend Application) (Go Microservices). | يجب أن يتبع نمط Layered Architecture أو Clean Architecture. |
| `docs/` | وثائق المشروع العامة (باستثناء وثائق Kiro الخاصة). | يجب أن تكون الوثائق محدثة وتتبع معيار Markdown. |
| `scripts/` | نصوص الأتمتة (Automation Scripts) (مثل: النشر، الإعداد). | يجب أن تكون النصوص قابلة للتنفيذ وموثقة. |
| `iac/` | البنية التحتية ككود (Infrastructure as Code) (Terraform). | يجب أن تكون منفصلة لكل خدمة (Client/Server). |
| `.kiro/` | ملفات توجيه Kiro (Steering, Specs, Hooks, Prompts). | **يجب عدم تعديل هذا المجلد إلا لغرض المعايرة الاستراتيجية.** |

## 2. المبادئ المعمارية الرئيسية (Key Architectural Principles)

### ج. المرونة الهندسية (Architectural Resilience)

*   **المبدأ:** يجب تصميم جميع الخدمات لتحمل الفشل (Design for Failure) بدلاً من تجنبه، بما يتماشى مع مبادئ هندسة الفوضى (Chaos Engineering) وركيزة الموثوقية في AWS Well-Architected Framework.
*   **التوجيه:** يجب على وكيل Kiro فرض استخدام أنماط المرونة التالية عند توليد الكود:
    1.  **Circuit Breaker:** يجب تطبيق نمط قاطع الدائرة على جميع المكالمات الخارجية (Outbound Calls) لمنع فشل خدمة واحدة من التسبب في فشل متتالي (Cascading Failure).
    2.  **Retry with Backoff:** يجب تطبيق آلية إعادة المحاولة مع التراجع الأسي (Exponential Backoff) للمكالمات التي يحتمل أن تنجح بعد فترة قصيرة.
    3.  **Bulkhead:** يجب عزل الموارد (مثل مجموعات الخيوط أو الاتصالات) لكل خدمة تابعة لمنع استهلاك الموارد من قبل خدمة واحدة من التأثير على الخدمات الأخرى.
    4.  **Timeouts:** يجب تحديد مهلات (Timeouts) صارمة لجميع المكالمات بين الخدمات لضمان عدم تعليق الموارد إلى أجل غير مسمى.

## 4. الاتصال الموجه بالرسائل (Message-Driven Communication)

### أ. الاتصال الموجه بالرسائل (Message-Driven Communication)

*   **المبدأ:** يجب أن يتم الاتصال بين الخدمات (Client/Server) عبر واجهات برمجة تطبيقات (APIs) واضحة أو بروتوكولات موجهة بالرسائل (مثل WebSocket).
*   **التوجيه:** يجب أن تتبع أسماء الرسائل والـ Endpoints اتفاقية **kebab-case** لضمان الاتساق.

### ب. البنية التحتية ككود (Infrastructure as Code - IaC)

*   **المبدأ:** يجب أن تكون البنية التحتية لكل خدمة (Client/Server) محددة بالكامل في مجلد `iac/` الخاص بها.
*   **التوجيه:** يجب أن يتم استخدام أدوات IaC المعتمدة (مثل Terraform أو CloudFormation) لضمان قابلية التكرار.

## 5. اتفاقيات التسمية (Naming Conventions)

| العنصر | الاتفاقية | مثال |
| :--- | :--- | :--- |
| **أسماء الملفات والمجلدات** | **kebab-case** (باستثناء أسماء المكونات والملفات التنفيذية). | `user-profile.ts`، `data-access-layer/` |
| **المكونات (Components)** | **PascalCase** | `UserProfileComponent` |
| **المتغيرات والدوال** | **camelCase** | `getUserData()`، `isLoggedIn` |
| **رسائل الالتزام (Commits)** | **Conventional Commits** | `feat: add user authentication`، `fix: resolve login bug` |

## 6. متطلبات الهيكلة الإلزامية (Mandatory Structural Requirements)

*   **IaC لكل خدمة:** يجب أن يكون لكل خدمة (Microservice) ملفات IaC خاصة بها في مجلد `iac/` لضمان الاستقلالية.
*   **فصل الاختبارات:** يجب أن تكون ملفات الاختبارات مفصولة عن كود المصدر (مثل `client/test/` و `server/service-auth/test/`).
*   **التوثيق المولد:** يجب أن يتم توليد التوثيق (مثل وثائق API) تلقائيًا وتخزينه في مجلد `docs/`.
'''
