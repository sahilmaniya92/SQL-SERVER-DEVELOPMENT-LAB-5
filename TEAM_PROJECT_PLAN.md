# Lab 5 – Team Project Plan
## T-SQL Control Flow & Data Structures: Production Quality Inspection Processing System

**Course:** SQL Server Developer  
**Lab Number:** Lab 5  
**Delivery Type:** Group Activity (Whole Class)  
**Timeline:** 7 Days  
**Database:** AdventureWorks2022  
**Schema:** ProductionOps  

---

## 1. Team Members

| # | Name | Primary Role | Lab Task(s) | Story Pts | Hours | Student Number |
|---|------|--------------|-------------|-----------|-------|----------------|
| 1 | Hassana | Schema & Failed Queue Developer | Task 1, Task 10 | 11 | 14 | _TBD_ |
| 2 | Sahashri | Inspection & Temp Batch Developer | Task 2, Task 6 | 11 | 7 | _TBD_ |
| 3 | Brain | Control Flow Developer | Task 3, Task 4 | 11 | 4 | _TBD_ |
| 4 | Parth | Error Handling Developer | Task 5 | 11 | 7 | _TBD_ |
| 5 | Josovo | Reporting & Views Developer | Task 8, Task 9 | 11 | 4 | _TBD_ |
| 6 | Lien | Release Review Table Developer | Task 12 | 11 | 4 | _TBD_ |
| 7 | Kelvin | Categories & Notification Developer | Task 7, Task 13 | 11 | 4 | _TBD_ |
| 8 | Dhruv | Failed Review Cursor Developer | Task 11 | 11 | 7 | _TBD_ |
| 9 | Sahil | Deployment & Final Submission (LAST) | Task 14 + Final Submission | 11 | 7 | _TBD_ |
| | **TEAM TOTAL** | | | **99** | **58** | |

> **Action Required:** Replace `_TBD_` with actual student numbers before submission.

---

## 2. Project Overview

This lab implements a **Production Quality Inspection Processing System** inside AdventureWorks2022. Each team member owns **unique lab task(s)** — no task is shared between members. Sahil owns the **LAST task** (Task 14 + Final Submission) after all other tasks are complete.

All custom objects must reside in the **ProductionOps** schema and scripts must be **re-runnable**.

---

## 3. Work Dependency Map

```
Hassana (Task 1 - Schema)
    └── ALL team members (requires schema first)

Hassana (Task 10 - Failed Queue) + Lien (Task 12 - Release Review Table)
    └── Dhruv (Task 11 - Review Cursor)

Dhruv (Task 11)
    └── Kelvin (Task 13 - Notification Cursor)

ALL Tasks 1–13
    └── Sahil (Task 14 - Deploy + Final Submission)  ← LAST
```

### Dependency Rules

| Task | Owner | Blocked Until |
|------|-------|---------------|
| Task 1 | Hassana | None — starts Day 1 |
| Tasks 2–12 | All others | Task 1 (schema) complete |
| Task 11 | Dhruv | Task 10 + Task 12 complete |
| Task 13 | Kelvin | Task 11 complete |
| Task 14 | Sahil (LAST) | ALL Tasks 1–13 complete |

---

## 4. Detailed Work Allocation

### 4.1 Hassana – Schema & Failed Queue Developer (14 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 1 | `initialize_productionops_schema.sql` | `scripts/setup/` |
| Task 10 | `failed_inspection_queue.sql` | `scripts/tables/` |

**Story Points:** 11 | **Hours:** 14

**Responsibilities:**
- Create `ProductionOps` schema with existence check
- Build `FailedInspectionQueue` with 10+ records (scores below 70)
- Capture screenshots: schema validation + failed queue data

**Depends On:** Nothing (starts Day 1)  
**Blocks:** Entire team

---

### 4.2 Sahashri – Inspection & Temp Batch Developer (7 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 2 | `inspection_request_registration.sql` | `scripts/tables/` |
| Task 6 | `inspection_batch_processing.sql` | `scripts/temporary_objects/` |

**Story Points:** 11 | **Hours:** 7

**Responsibilities:**
- Create `InspectionRequests` table with 10+ inserts
- Build `#InspectionBatch` temp table script
- Capture screenshots: InspectionRequests + temp batch output

**Depends On:** Hassana (Task 1)  
**Blocks:** None

---

### 4.3 Brain – Control Flow Developer (4 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 3 | `inspection_result_classification.sql` | `scripts/controlflow/` |
| Task 4 | `monthly_inspection_schedule.sql` | `scripts/controlflow/` |

**Story Points:** 11 | **Hours:** 4

**Responsibilities:**
- IF...ELSE classification (test scores: 95, 78, 45)
- WHILE loop generating 12-month schedule
- Capture screenshots: IF/ELSE results + WHILE output

**Depends On:** Hassana (Task 1)  
**Blocks:** None

---

### 4.4 Parth – Error Handling Developer (7 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 5 | `error_log.sql` | `scripts/tables/` |
| Task 5 | `inspection_error_logging.sql` | `scripts/errorhandling/` |

**Story Points:** 11 | **Hours:** 7

**Responsibilities:**
- Create `ErrorLog` table
- TRY...CATCH with intentional error + log insert
- Capture screenshot: ErrorLog contents

**Depends On:** Hassana (Task 1)  
**Blocks:** None

---

### 4.5 Josovo – Reporting & Views Developer (4 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 8 | `product_quality_statistics.sql` | `scripts/reporting/` |
| Task 9 | `vProductInspectionSummary.sql` | `scripts/reporting/` |

**Story Points:** 11 | **Hours:** 4

**Responsibilities:**
- Derived table statistics per subcategory
- Create `ProductionOps.vProductInspectionSummary` view
- Capture screenshots: derived stats + view TOP 20

**Depends On:** Hassana (Task 1)  
**Blocks:** None

---

### 4.6 Lien – Release Review Table Developer (4 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 12 | `product_release_review.sql` | `scripts/tables/` |

**Story Points:** 11 | **Hours:** 4

**Responsibilities:**
- Create `ProductReleaseReview` table (populated later by Dhruv's cursor)
- Capture screenshot: table structure

**Depends On:** Hassana (Task 1)  
**Blocks:** Dhruv (Task 11)

---

### 4.7 Kelvin – Categories & Notification Developer (4 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 7 | `inspection_category_management.sql` | `scripts/temporary_objects/` |
| Task 13 | `notification_log.sql` | `scripts/tables/` |
| Task 13 | `inspection_notification_cursor.sql` | `scripts/cursors/` |

**Story Points:** 11 | **Hours:** 4

**Responsibilities:**
- Table variable `@InspectionCategories` with 4 categories
- NotificationLog table + notification cursor
- Capture screenshots: categories output + NotificationLog

**Depends On:** Hassana (Task 1), Dhruv (Task 11)  
**Blocks:** Sahil (Task 14)

---

### 4.8 Dhruv – Failed Review Cursor Developer (7 Hours)

| Lab Task | Script | Path |
|----------|--------|------|
| Task 11 | `failed_product_review_cursor.sql` | `scripts/cursors/` |

**Story Points:** 11 | **Hours:** 7

**Responsibilities:**
- Process all `Pending` records in FailedInspectionQueue
- Insert decisions into ProductReleaseReview
- Must include CLOSE and DEALLOCATE
- Capture screenshots: cursor messages + ProductReleaseReview after processing

**Depends On:** Hassana (Task 10), Lien (Task 12)  
**Blocks:** Kelvin (Task 13)

---

### 4.9 Sahil – Deployment & Final Submission (LAST) (7 Hours)

| Lab Task | Deliverable | Path |
|----------|-------------|------|
| Task 14 | `deploy_all.sql` | `scripts/deployment/` |
| Task 14 | `validate_lab5_results.sql` | `scripts/validation/` |
| Final | `README.md` + Data Mapping | `Lab5/` |
| Final | 15 Screenshots + QA Review | `screenshots/` |

**Story Points:** 11 | **Hours:** 7

**Responsibilities:**
- Build SQLCMD `deploy_all.sql` with all scripts in order
- Build validation script
- Write README with group names, Data Mapping section
- Compile all 15 screenshots from team
- QA review + submit GitHub link to professor

**Depends On:** ALL Tasks 1–13 complete  
**Blocks:** Final submission

---

## 5. Seven-Day Sprint Schedule

| Day | Phase | Active Members | Milestone |
|-----|-------|----------------|-----------|
| **Day 1** | Foundation | Hassana, Sahashri, Lien | Task 1, 2, 12 done |
| **Day 2** | Development | Hassana, Sahashri, Brain, Parth, Josovo, Kelvin | Tasks 10, 6, 3, 4, 5, 8, 9, 7 done |
| **Day 3** | Testing | All (except Sahil) | All scripts tested in SSMS |
| **Day 4** | Cursors | Dhruv, Kelvin | Tasks 11, 13 done |
| **Day 5** | Handoff | All | All scripts pushed to GitHub |
| **Day 6** | Final Task | **Sahil (LAST)** | deploy_all + validate + README |
| **Day 7** | Submission | **Sahil (LAST)** | Screenshots, QA, submit link |

---

## 6. Data Mapping Reference

### InspectionRequests (Sahashri – Task 2)

| Target Column | Source / Rule |
|---------------|---------------|
| ProductID | `Production.Product.ProductID` |
| InspectionType | ListPrice > 2000 → Performance; SafetyStockLevel < 500 → Safety; MakeFlag = 1 → Assembly; else Final Release |
| Status | SafetyStockLevel < 500 → Pending; ListPrice > 1000 → Scheduled; else Completed |

### FailedInspectionQueue (Hassana – Task 10)

| Condition | InspectionScore |
|-----------|-----------------|
| ListPrice > 2000 AND SafetyStockLevel < 500 | 45 |
| ListPrice > 1000 AND SafetyStockLevel < 800 | 55 |
| SafetyStockLevel < 300 | 60 |
| Otherwise | 65 |

*Only insert where score < 70.*

### ProductReleaseReview (Dhruv – Task 11 via Cursor)

| Score | ReviewDecision |
|-------|----------------|
| Below 50 | Reject |
| 50–69 | Rework Required |

---

## 7. Story Point & Hours Summary

| Member | Lab Task(s) | Story Points | Est. Hours | % of Hours |
|--------|-------------|--------------|------------|------------|
| Hassana | Task 1, Task 10 | 11 | 14 | 24% |
| Sahashri | Task 2, Task 6 | 11 | 7 | 12% |
| Brain | Task 3, Task 4 | 11 | 4 | 7% |
| Parth | Task 5 | 11 | 7 | 12% |
| Josovo | Task 8, Task 9 | 11 | 4 | 7% |
| Lien | Task 12 | 11 | 4 | 7% |
| Kelvin | Task 7, Task 13 | 11 | 4 | 7% |
| Dhruv | Task 11 | 11 | 7 | 12% |
| Sahil (LAST) | Task 14 + Final Submission | 11 | 7 | 12% |
| **TOTAL** | **14 Lab Tasks** | **99** | **58** | **100%** |

---

## 8. Screenshot Assignment

| # | Screenshot | Owner |
|---|------------|-------|
| 1 | Schema validation | Hassana |
| 2 | FailedInspectionQueue data | Hassana |
| 3 | InspectionRequests data | Sahashri |
| 4 | #InspectionBatch output | Sahashri |
| 5 | IF/ELSE classification | Brain |
| 6 | WHILE schedule | Brain |
| 7 | ErrorLog contents | Parth |
| 8 | Derived table statistics | Josovo |
| 9 | View output | Josovo |
| 10 | ProductReleaseReview table | Lien |
| 11 | @InspectionCategories | Kelvin |
| 12 | NotificationLog contents | Kelvin |
| 13 | Review cursor execution | Dhruv |
| 14 | ProductReleaseReview after cursor | Dhruv |
| 15 | deploy_all.sql success | Sahil |

Sahil compiles all 15 into `screenshots/` folder for submission.

---

## 9. Submission Checklist

- [ ] All SQL scripts in correct folder structure
- [ ] `README.md` with group names, student numbers, Data Mapping section
- [ ] 15 screenshots in `screenshots/` folder
- [ ] `deploy_all.sql` executes successfully with SQLCMD Mode
- [ ] All scripts re-runnable without modification
- [ ] Instructor added as GitHub collaborator
- [ ] GitHub repository link submitted to professor

---

*Document aligned with `TEAM_WORK_ALLOCATION.xlsx`. Replace TBD student numbers before submission.*
