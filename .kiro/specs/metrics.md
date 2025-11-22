# مقاييس النجاح والتحسين المستمر للقالب النموذجي الاستراتيجي لـ Kiro

سيتم استخدام إطاري DORA و SPACE لقياس مدى فعالية القالب في تحسين عملية التطوير.

## 1. مقاييس DORA (DevOps Research and Assessment)

تهدف هذه المقاييس إلى قياس أداء تسليم البرمجيات:

| المقياس | الهدف من القالب | المكونات المساهمة |
| :--- | :--- | :--- |
| **Lead Time for Changes** | تقليل الوقت اللازم من الـ Commit إلى النشر. | `hooks/manual/gitops_deploy.sh` (أتمتة النشر). |
| **Deployment Frequency** | زيادة عدد عمليات النشر الآمنة. | `hooks/on-commit/security_scan.sh` (زيادة الثقة في النشر). |
| **Change Failure Rate** | تقليل نسبة التغييرات التي تؤدي إلى فشل في الإنتاج. | `steering/99_security.md` و `steering/tech_stack.md` (فرض الجودة). |
| **Time to Restore Service** | تقليل الوقت اللازم لاستعادة الخدمة بعد الفشل. | `specs/design.md` (الهيكل المعياري يسهل تحديد المشكلة). |

## 2. مقاييس SPACE (Satisfaction, Performance, Activity, Communication, Efficiency)

تهدف هذه المقاييس إلى قياس إنتاجية المطور ورفاهيته:

| المقياس | الهدف من القالب | المكونات المساهمة |
| :--- | :--- | :--- |
| **Satisfaction and Well-being** | تقليل الإحباط الناتج عن المهام المتكررة والأخطاء. | `hooks/on-save/update_docs.sh` (أتمتة المهام المملة). |
| **Performance** | تحسين جودة الكود والمخرجات. | `steering/00_philosophy.md` و `prompts/refactor_code.prompt.md` (فرض الجودة). |
| **Activity** | زيادة جودة التوثيق والمواصفات. | `prompts/create_spec.prompt.md` (فرض التوثيق الموحد). |
| **Communication and Collaboration** | توحيد لغة التخطيط والتصميم. | `specs/requirements.md` و `specs/design.md` (لغة مشتركة بين الفريق). |

## 3. آلية القياس

سيتم تضمين ملف `hooks/manual/measure_dora.sh` الذي يستخدم بيانات Git و Jira (افتراضيًا) لإنشاء تقرير أولي لهذه المقاييس، مما يوضح للمطور كيف يمكن للقالب أن يساعد في قياس أدائه.
