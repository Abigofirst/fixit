# FixIt Egypt — Operations Flow

> Describes the internal "service request → completion → review" workflow shown in the two
> Arabic swimlane diagrams in this folder. These define how FixIt runs a job operationally
> (the human/admin process behind the website).

## Diagram files

- `operations-flow-v1-13steps.jpeg` — earlier version, 3 swimlanes (Marketing / Operations / Technician), ~13 steps.
- `operations-flow-v2-18steps.jpeg` — **latest / more detailed** version, 4 swimlanes, ~18 steps. Use this as the reference.

> Diagram title (Arabic): "سير عمل طلب صيانة من بداية التواصل حتى التقييم" — *"Workflow of a maintenance request from first contact to review."*

## Swimlanes (responsibilities)

| Lane | Arabic | Role |
|------|--------|------|
| Marketing | التسويق | Attract customers via ads, social media, pages |
| Customer Service | خدمة العملاء | First contact, capture requirements, hand off |
| Operations | إدارة التشغيل | Scheduling, coordination, confirmations, reporting |
| Technicians | الفنيون | On-site inspection, the actual repair work |

## Process (v2, 18 steps)

1. **Marketing** runs social-media ads.
2. **Marketing** links all pages/channels to one messaging inbox.
3. **Customer Service** receives the customer via messages.
4. **Customer Service** captures customer requirements; presents inspection price + service price.
5. **Customer Service** hands the customer off to Operations.
6. **Operations** sets a suitable date and coordinates with the customer.
7. **Operations** confirms the appointment by phone before the visit.
8. **Technician** performs the inspection; identifies the faults and the cost.
9. **Technician** prepares the inspection report + cost estimate.
10. **Operations** receives the inspection report from the technician and reviews it.
11. **Operations** sends the customer the repair details + total cost (without the technician dealing on price directly).
12. Operations manager confirms by replying to the customer → **Technician** carries out the repair work.
13. **Technician** prepares the completion report, hands it to the customer, and gets sign-off.
14. **Technician** sends a photo of the report to Operations; Operations receives the final report photo.
15. **Customer decision** (موافق / غير موافق — approve / decline):
    - **Decline →** request is cancelled (end).
    - **Approve →** proceed.
16. **Operations** follows up on the customer review on the page.
17. **Operations** contacts the customer to measure satisfaction and rate the technician.
18. **Customer** leaves a rating of the service and technician on the page → **End of process.**

## Notes

- Heavy emphasis on **FixIt controlling the customer↔price relationship** — the technician never negotiates price directly with the customer (mirrors the brief: "final price confirmed through FixIt").
- Pricing/report flows always pass through Operations.
- The flow ends in a **review/rating** step, feeding the social-proof system in the brief.
