# API Contract Specification Template

## 1. Overview
*   **Service Name:** [اسم الخدمة التي توفر واجهة برمجة التطبيقات (API)]
*   **Consumer Service(s):** [أسماء الخدمات التي ستستخدم واجهة برمجة التطبيقات هذه]
*   **Contract Version:** 1.0

## 2. Endpoint Definition

| Method | Path | Description | Authentication |
| :--- | :--- | :--- | :--- |
| [GET/POST/PUT/DELETE] | [/api/v1/resource] | [وصف موجز للوظيفة] | [JWT/API Key/None] |

## 3. Request Body (لـ POST/PUT)

*   **Content Type:** application/json
*   **Schema:**
    ```json
    {
      "field_name": "data_type", // مثال: "user_id": "UUID"
      "required": "true/false",
      "description": "..."
    }
    ```

## 4. Response Body (لـ 200 OK)

*   **Content Type:** application/json
*   **Schema:**
    ```json
    {
      "status": "string", // مثال: "success"
      "data": {
        // ... (هيكل البيانات المرتجعة)
      }
    }
    ```

## 5. Error Responses (لـ 4xx/5xx)

| Status Code | Error Code | Description |
| :--- | :--- | :--- |
| 400 | [BAD_REQUEST] | [وصف سبب الخطأ] |
| 401 | [UNAUTHORIZED] | [وصف سبب الخطأ] |

## 6. Security & Validation
*   **Input Validation:** [تحديد قواعد التحقق من صحة المدخلات (مثل: الحد الأقصى للطول، النطاق)]
*   **Rate Limiting:** [تحديد حدود المعدل (مثل: 100 طلب/دقيقة)]
*   **OWASP Compliance:** [تحديد كيف يلتزم هذا العقد بـ OWASP Top 10]
