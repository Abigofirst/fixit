# FixIt Egypt — Website & Platform Brief

> Markdown transcription of "website-brief.pdf" (kept alongside this file as the original source).
> This is the master requirements document for the FixIt Egypt platform.

## 1. Business Model & Platform Type

**Business model:** FixIt Egypt is a service marketplace connecting customers with verified home-service professionals. Commission-based — a percentage of each completed booking.

**Revenue streams:**
- Commission per completed job (15–20%)
- Future subscription plans for professionals
- Emergency / same-day service fees
- Potential future B2B / property-management partnerships

**Platform type:** Two-sided marketplace (customer side + service-provider/technician side).
- **Initial launch:** Website + WhatsApp-first operations
- **Future:** Mobile app (iOS/Android)

## 2. Target Audience & ICPs

**Primary customer ICP — "Busy Cairo Professional"**
- Age 25–55; Maadi, New Cairo, Zayed, Heliopolis, Zamalek
- Upper-middle to upper income; working professionals, families, expats
- Digitally comfortable; values convenience, reliability, speed

**Customer pain points:** unreliable technicians, unclear pricing, delays/no-shows, difficulty finding trusted workers, lack of accountability.

**Buying drivers:** fast response, professional communication, trust & reviews, transparent pricing, convenience.

**Provider ICP — typical technician:** independent skilled worker (plumbing, electrical, AC, cleaning, etc.), works freelance/referrals, wants steady customer flow.
**Provider motivations:** more consistent jobs, increased income, higher-paying customers, reduced customer-acquisition effort.

## 3. Service Categories & Structure

**Initial launch categories:** Plumbing · Electrical · Painting · AC Maintenance & Repair · Cleaning Services · & More (custom requests by reaching out).

**Future categories:** Furniture Assembly · Appliance Repair · Carpentry · Moving Services · Smart Home Installation · & more.

**Each category page should include:** service title, description, pricing "starts from", technician profiles, booking CTA.

## 4. Customer Booking Journey

1. **Visits website** — browses & selects a category.
2. **Describes job** — issue description, photos (if possible), location, preferred time/date, contact info.
3. **Sees available professionals** — list with photo, price-from, reviews, completed-jobs count, availability, specialization.
4. **Selects professional.**
5. **Creates a profile** — name, picture, address, preferred payment method.
6. **Booking confirmation (two-step):** initial confirmation email → 30-minute window for technician to accept → second email with final date/time confirmation.
7. **Inspection & final pricing** — technician inspects; final price confirmed through FixIt.
8. **Service completion** — job done; customer confirms on website; shows on both profiles ("jobs completed" / "successful fixes ordered").
9. **Review & retention** — customer leaves rating/review (earns a free inspection on next order); encouraged toward repeat usage.

## 5. Provider / Professional Journey

**Onboarding:** application form · service-category selection · experience details · verification process · ID/criminal-record/document upload · optional references/reviews.

**Workflow:** receive booking → accept/reject within 30 min → visit customer → inspect issue → submit pricing to platform/admin* → complete service → receive payment.
> *Technicians who fail to provide pricing or funds to the platform are blacklisted regardless of circumstance, pending investigation.

## 6. Matching Logic

**Factors:** service category, geographic proximity, availability, technician rating, performance history, job complexity.
- **Initial (MVP):** manual/admin-assisted matching.
- **Future:** automated smart matching.

## 7. Pricing & Payments

**Pricing model:** starting price shown upfront → estimated range after description + pictures → final price after inspection.

**Payment methods (MVP):** Cash · Instapay · Vodafone Cash · *Online card payments? (to discuss — clarity on implementation needed)*.
**Future:** online card payments, wallet integration.

**Platform commission:** 15–20% per completed job.

## 8. Location & Availability

- **Initial service area:** Maadi.
- **Availability:** same-day bookings (upon availability), scheduled bookings, emergency requests (extra fee).
- **Future expansion:** all Greater Cairo → major Egyptian cities.

## 9. Admin Dashboard Requirements

- **Customer management:** booking management, customer profiles, job history.
- **Technician management:** profiles, ratings, availability, performance tracking.
- **Operations:** assign bookings manually, track booking status, revenue tracking, commission tracking.
- **Analytics:** number of bookings, revenue, repeat customers, technician performance, category performance.

## 10. Reviews, Ratings, Trust & Social Proof

**Trust features:** verified-technician badge, customer reviews, star ratings, before/after photos, testimonials.
**Review system:** 1–5 star rating, written feedback, post-service review prompts, pictures (before AND after — both required).

## 11. Customer Support & Communication

**Channels:** WhatsApp, phone support, website inquiry forms.
**Notifications:** booking confirmation, technician arrival updates, service completion.
**Support features:** complaint submission, live support (future), FAQ/help center.

## 12. Cancellations, Refunds & Disputes

- **Customer:** free cancellation before technician dispatch; 100 EGP fee after dispatch.
- **Technician:** performance penalties for repeated cancellations.
- **Disputes:** handled internally by FixIt Egypt support/admin team.

## 13. Subscriptions & Repeat Bookings (Future)

- Subscription: home-maintenance plans, priority support, discounted services.
- Repeat booking: saved addresses, rebook previous technicians, booking history.

## 14. Promotions & Loyalty

- **Initial:** first-service discounts, referral discounts.
- **Loyalty:** referral rewards, repeat-customer discounts/rewards, seasonal campaigns.

## 15. Technical Requirements

**Website:** mobile-first responsive, fast loading, SEO optimized, **Arabic + English**, WhatsApp integration.
**Future scalability — architecture must support:** mobile app integration, automated matching, payment-gateway integration, CRM functionality.

## 16. Marketplace Compliance & Legal

**Requirements:** Terms & Conditions, Privacy Policy, service agreements, technician agreements, liability disclaimers.
**Compliance goals:** customer data protection, transparent pricing, marketplace operational policies.

## 17. Content & Branding

- **Positioning:** "Go-to online marketplace for all things home services."
- **Personality:** Professional · Trustworthy · Fast · Friendly · Modern.
- **Design direction:** clean modern UI, simple navigation, high-trust visuals, strong CTA buttons, mobile-first UX.
- **Key messaging:** fast response · verified technicians · transparent pricing · reliable service.

## 18. Launch Scope & MVP

**Objective:** validate demand and operational workflows before scaling.

**MVP features:** homepage · service pages · booking/request form · technician profile pages · admin dashboard · WhatsApp integration · review system · manual technician assignment.

**MVP exclusions (later phases):** automated matching · full mobile apps · subscription engine · AI/chatbot features · advanced payment systems.

## Final Notes

The initial version is intentionally **operations-first, not tech-first**. The website should prioritize **trust, simplicity, fast booking conversion, and operational efficiency**. The MVP goal is a scalable, trustworthy customer-acquisition and service-management platform that can evolve into a larger marketplace ecosystem.

**Everything must be available in both English and Arabic, across all aspects of the website.**
