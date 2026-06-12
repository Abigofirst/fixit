# FixIt Egypt — Website Deliverables (2 Phases)

> Markdown transcription of "website-deliverables-2-phases.pdf" (original kept alongside).
> Defines exactly what gets built in the MVP (Phase 1) and the marketplace expansion (Phase 2).

---

# PHASE 1 — MVP (Operations-First)

**Goal:** launch quickly, generate bookings, validate demand, build the technician network, and manage operations manually.

**Success criteria:**
- Customers can request services online.
- Customers can browse technician profiles.
- Customers can request a preferred technician.
- FixIt maintains full control of assignment.
- All leads and bookings are captured.
- Admin can manage bookings and technicians.

## 1. Website Structure

**Homepage** — hero section · service categories · Why Choose FixIt · How It Works · Reviews & Testimonials · Service Areas · WhatsApp CTA · Contact section · Footer.

**Service Category Pages** — initial: Plumbing, Electrical, AC Maintenance, Cleaning Services, Furniture Assembly (more later).
Each page includes: service description · pricing range · FAQ · related technicians · booking CTA.

**About Us Page** — Mission · Vision · Core Principles · Company Story.

**Contact Page** — contact form · WhatsApp · phone number · service areas.

**FAQ Page** — pricing · guarantees · booking process · service areas.

## 2. Technician Directory

**Directory page** displays: photo, name, specialty, rating, experience, service area. Filters: category, area.

**Technician profile pages** include: profile photo · bio · years of experience · areas served · services offered · reviews · number of completed jobs · "Request Technician" CTA.

## 3. Hybrid Booking System

**Service request flow — customer can:**
- **Option 1:** book through a service category (e.g. Electrical → Request Service).
- **Option 2:** view a technician profile (e.g. Ahmed Hassan → Request Ahmed).

**Booking form fields** — required: Full Name, Phone, Area, Service Category, Job Description, Preferred Date, Preferred Time. Optional: Photo Upload. Pre-filled: Preferred Technician.

**Assignment logic:** customer can request a technician; FixIt retains final assignment authority.
- If requested technician available → assigned.
- If unavailable → admin assigns an equivalent technician; customer notified via WhatsApp.
- **Acceptance criteria:** system records both *requested* and *assigned* technician, both visible in the dashboard.

## 4. Booking Management Dashboard

- **Admin login.**
- **Booking management** — views: New, Assigned, In Progress, Completed, Cancelled. Actions: assign technician, edit booking, update status.
- **Customer management** — admin view keeps internal records on returning customers (no customer accounts yet; system checks for similar info): customer records, booking history.
- **Technician management** — add technician; edit profile/availability; deactivate technician.

## 5. Reviews & Social Proof

- Customer reviews (star rating + written review).
- Testimonials section on homepage.
- Verified-technician badge (admin-controlled).

## 6. WhatsApp Integration

After booking or clicking the WhatsApp CTA / "more information", the customer is redirected to WhatsApp. Admin receives a booking notification + customer information.

## 7. Technical Deliverables

- **Mobile responsive:** desktop, tablet, mobile.
- **SEO setup:** meta titles, meta descriptions, sitemap, robots.txt.
- **Analytics:** Google Analytics, Google Search Console.

## 8. Ownership Deliverables

Developer must transfer: domain ownership · hosting ownership · website ownership · admin credentials · analytics credentials.
**Documentation:** video walkthrough covering adding technicians, editing services, managing bookings.

---

# PHASE 2 — Marketplace Expansion

**Goal:** reduce manual work, increase automation, improve retention, and create scalable marketplace infrastructure.

**Success criteria:**
- Customers can manage bookings.
- Technicians can manage jobs.
- Matching becomes semi-automated.
- Payments and commissions become trackable.

## 1. Customer Accounts

Customer login + dashboard: booking history · saved addresses · favorite technicians · rebook services.

## 2. Technician Portal

Technician login + dashboard: upcoming jobs · job history · earnings · availability.
**Technician actions:** accept booking · reject booking · update status · upload job photos.

## 3. Automated Matching Engine

Matching based on: category · area · availability · rating · job history.
**Hybrid logic maintained:** if a customer requests Ahmed → system checks availability → if unavailable, suggest alternatives.

## 4. Internal Messaging

Customer ↔ technician chat (platform-controlled communication).

## 5. Online Payments

Support: credit cards · debit cards · Instapay · wallets.
**Payment tracking:** job value · commission · technician payout.

## 6. Commission Engine

Automatic calculation of: gross job value · FixIt commission · technician payout.

## 7. Loyalty & Referrals

Referral program · customer rewards · discount credits.

## 8. Service History

Customer can view: previous jobs · invoices · photos · technicians used.

## 9. Reporting & Analytics

Admin dashboard analytics — track: bookings · revenue · repeat customers · customer acquisition · technician performance · service-category performance.
