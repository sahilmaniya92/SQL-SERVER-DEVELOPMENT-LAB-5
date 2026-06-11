# Lab 5 – Equal Task Assignment Summary

  
**Workload:** Everyone gets **11 Story Points** each. Hours vary by task complexity (see table below).  
**Sahil** owns the **LAST task** (Task 14 + Final Submission).

---

## Task Ownership (14 Lab Tasks)

| Member | Lab Task(s) | What You Build | Story Pts | Hours |
|--------|-------------|----------------|-----------|-------|
| **Hassana** | Task 1, Task 10 | Schema + FailedInspectionQueue | 11 | 14 |
| **Sahashri** | Task 2, Task 6 | InspectionRequests + #InspectionBatch | 11 | 7 |
| **Brain** | Task 3, Task 4 | IF/ELSE + WHILE scripts | 11 | 4 |
| **Parth** | Task 5 | ErrorLog table + TRY...CATCH script | 11 | 7 |
| **Josovo** | Task 8, Task 9 | Derived table query + View | 11 | 4 |
| **Lien** | Task 12 | ProductReleaseReview table | 11 | 4 |
| **Kelvin** | Task 7, Task 13 | Table variables + Notification cursor | 11 | 4 |
| **Dhruv** | Task 11 | Failed product review cursor | 11 | 7 |
| **Sahil (LAST)** | Task 14 + Final Submission | deploy_all, validate, README, screenshots, QA | 11 | 7 |
| **TEAM TOTAL** | | | **99** | **58** |

---

## Scripts Per Member

| Member | Script Files |
|--------|-------------|
| Hassana | `initialize_productionops_schema.sql`, `failed_inspection_queue.sql` |
| Sahashri | `inspection_request_registration.sql`, `inspection_batch_processing.sql` |
| Brain | `inspection_result_classification.sql`, `monthly_inspection_schedule.sql` |
| Parth | `error_log.sql`, `inspection_error_logging.sql` |
| Josovo | `product_quality_statistics.sql`, `vProductInspectionSummary.sql` |
| Lien | `product_release_review.sql` |
| Kelvin | `inspection_category_management.sql`, `notification_log.sql`, `inspection_notification_cursor.sql` |
| Dhruv | `failed_product_review_cursor.sql` |
| **Sahil (LAST)** | `deploy_all.sql`, `validate_lab5_results.sql`, `README.md`, Data Mapping, 15 Screenshots, QA |

---

## Hours Breakdown

| Member | Hours | Notes |
|--------|-------|-------|
| Hassana | 14 | Largest workload — schema foundation + failed queue data |
| Sahashri | 7 | Two scripts: table + temp batch |
| Brain | 4 | Control flow scripts (lighter complexity) |
| Parth | 7 | ErrorLog table + TRY...CATCH logging |
| Josovo | 4 | Derived table + view |
| Lien | 4 | Single table DDL |
| Kelvin | 4 | Table variable + notification cursor |
| Dhruv | 7 | Review cursor processing |
| Sahil (LAST) | 7 | Deployment, validation, docs, submission |

---

## Dependency Order

```
Hassana (Task 1) ──► Everyone starts after schema
Hassana (Task 10) ──► Dhruv (Task 11)
Lien (Task 12) ──► Dhruv (Task 11)
Dhruv (Task 11) ──► Kelvin (Task 13)
ALL Tasks 1–13 ──► Sahil (Task 14 LAST)
```

---

## 7-Day Schedule

| Day | Who | Focus |
|-----|-----|-------|
| Day 1 | Hassana, Sahashri, Lien | Task 1, 2, 12 |
| Day 2 | Hassana, Sahashri, Brain, Parth, Josovo, Kelvin | Tasks 10, 6, 3, 4, 5, 8, 9, 7 |
| Day 3 | All (except Sahil) | Test own scripts in SSMS |
| Day 4 | Dhruv, Kelvin | Tasks 11, 13 (cursors) |
| Day 5 | All | Push all scripts to GitHub |
| Day 6–7 | **Sahil (LAST)** | deploy_all, validate, README, screenshots, submit |

---

*See `TEAM_WORK_ALLOCATION.xlsx` for full details across all 7 sheets.*
