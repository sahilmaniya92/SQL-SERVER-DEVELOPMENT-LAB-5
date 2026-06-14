# Lab 5 — Production Quality Inspection Processing System

**Course:** SQL Server Developer  
**Lab:** Lab 5 — T-SQL Control Flow & Data Structures  
**Database:** AdventureWorks2022  
**Schema:** ProductionOps  
**Timeline:** 7 Days  

**GitHub Repository:** [SQL-SERVER-DEVELOPMENT-LAB-5](https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5)

---

## Team Members

| # | Name | Role | Lab Task(s) | Hours | Student No. |
|---|------|------|-------------|-------|-------------|
| 1 | Hassana | Schema & Failed Queue Developer | Task 1, Task 10 | 14 | _TBD_ |
| 2 | Sahashri | Inspection & Temp Batch Developer | Task 2, Task 6 | 7 | _TBD_ |
| 3 | Brian | Control Flow Developer | Task 3, Task 4 | 4 | _TBD_ |
| 4 | Parth | Error Handling Developer | Task 5 | 7 | N01779255 |
| 5 | Joshua | Reporting & Views Developer | Task 8, Task 9 | 4 | _TBD_ |
| 6 | Lien | Release Review Table Developer | Task 12 | 4 | _TBD_ |
| 7 | Kelvin | Categories & Notification Developer | Task 7, Task 13 | 4 | _TBD_ |
| 8 | Dhruv | Failed Review Cursor Developer | Task 11 | 7 | _TBD_ |
| 9 | Sahil | Deployment & Final Submission (**LAST**) | Task 14 | 7 | _TBD_ |

> Each task is owned by **one person only**. Sahil owns the **LAST task** (Task 14 + final submission).

---

## Repository Structure

```
SQL-SERVER-DEVELOPMENT-LAB-5/
│
├── scripts/
│   ├── setup/                  ← Hassana (Task 1)
│   ├── tables/                 ← Hassana, Sahashri, Parth, Lien, Kelvin
│   ├── controlflow/            ← Brian (Task 3, 4)
│   ├── errorhandling/          ← Parth (Task 5)
│   ├── temporary_objects/      ← Sahashri, Kelvin
│   ├── reporting/              ← Joshua (Task 8, 9)
│   ├── cursors/                ← Dhruv, Kelvin
│   ├── deployment/             ← Sahil (LAST)
│   └── validation/             ← Sahil (LAST)
│
├── screenshots/
│   ├── Hassana/                ← screenshots #1–2
│   ├── Sahashri/               ← screenshots #3–4
│   ├── Brian/                  ← screenshots #5–6
│   ├── Parth/                  ← screenshot #7
│   ├── Joshua/                 ← screenshots #8–9
│   ├── Lien/                   ← screenshot #10
│   ├── Kelvin/                 ← screenshots #11–12
│   ├── Dhruv/                  ← screenshots #13–14
│   └── Sahil/                  ← screenshot #15 + final compile
│
├── README.md
├── CONTRIBUTING.md
├── TEAM_PROJECT_PLAN.md
└── TEAM_WORK_ALLOCATION.xlsx
```

---

## Who Pushes Which Script

| Member | Task | Script File | Folder |
|--------|------|-------------|--------|
| **Hassana** | 1 | `initialize_productionops_schema.sql` | `scripts/setup/` |
| | 10 | `failed_inspection_queue.sql` | `scripts/tables/` |
| **Sahashri** | 2 | `inspection_request_registration.sql` | `scripts/tables/` |
| | 6 | `inspection_batch_processing.sql` | `scripts/temporary_objects/` |
| **Brian** | 3 | `inspection_result_classification.sql` | `scripts/controlflow/` |
| | 4 | `monthly_inspection_schedule.sql` | `scripts/controlflow/` |
| **Parth** | 5 | `error_log.sql` | `scripts/tables/` |
| | 5 | `inspection_error_logging.sql` | `scripts/errorhandling/` |
| **Joshua** | 8 | `product_quality_statistics.sql` | `scripts/reporting/` |
| | 9 | `vProductInspectionSummary.sql` | `scripts/reporting/` |
| **Lien** | 12 | `product_release_review.sql` | `scripts/tables/` |
| **Kelvin** | 7 | `inspection_category_management.sql` | `scripts/temporary_objects/` |
| | 13 | `notification_log.sql` | `scripts/tables/` |
| | 13 | `inspection_notification_cursor.sql` | `scripts/cursors/` |
| **Dhruv** | 11 | `failed_product_review_cursor.sql` | `scripts/cursors/` |
| **Sahil (LAST)** | 14 | `deploy_all.sql` | `scripts/deployment/` |
| | 14 | `validate_lab5_results.sql` | `scripts/validation/` |
| | Final | README, screenshots, submit | `README.md` · `screenshots/` |

---

## Screenshot Ownership (GitHub Repo)

Each member uploads screenshots to their folder. **Sahil** compiles all 15 before submission.

| # | Name | Screenshot | Task | Upload to |
|---|------|------------|------|-----------|
| 1 | **Hassana** | Schema validation | Task 1 | `screenshots/Hassana/` |
| 2 | **Hassana** | FailedInspectionQueue data | Task 10 | `screenshots/Hassana/` |
| 3 | **Sahashri** | InspectionRequests data | Task 2 | `screenshots/Sahashri/` |
| 4 | **Sahashri** | #InspectionBatch output | Task 6 | `screenshots/Sahashri/` |
| 5 | **Brian** | IF/ELSE classification | Task 3 | `screenshots/Brian/` |
| 6 | **Brian** | WHILE schedule | Task 4 | `screenshots/Brian/` |
| 7 | **Parth** | ErrorLog contents | Task 5 | `screenshots/Parth/` |
| 8 | **Joshua** | Derived table statistics | Task 8 | `screenshots/Joshua/` |
| 9 | **Joshua** | View output | Task 9 | `screenshots/Joshua/` |
| 10 | **Lien** | ProductReleaseReview table | Task 12 | `screenshots/Lien/` |
| 11 | **Kelvin** | @InspectionCategories | Task 7 | `screenshots/Kelvin/` |
| 12 | **Kelvin** | NotificationLog contents | Task 13 | `screenshots/Kelvin/` |
| 13 | **Dhruv** | Review cursor execution | Task 11 | `screenshots/Dhruv/` |
| 14 | **Dhruv** | ProductReleaseReview after cursor | Task 11 | `screenshots/Dhruv/` |
| 15 | **Sahil** | deploy_all.sql success | Task 14 | `screenshots/Sahil/` |

**Team:** Hassana · Sahashri · Brian · Parth · Joshua · Lien · Kelvin · Dhruv · Sahil

```powershell
git add screenshots/YourName/
git commit -m "Add screenshots (YourName)"
git push
```

---

## Clone & Push (Team Members)

```powershell
git clone https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5.git
cd SQL-SERVER-DEVELOPMENT-LAB-5
git checkout -b feature/yourname-task
git add scripts/your-folder/your-script.sql
git commit -m "Task 1: add schema script (Hassana)"
git push -u origin feature/yourname-task
```

Open a **Pull Request** → Sahil merges to `main`.

### Push order

| Day | Who pushes first |
|-----|------------------|
| 1 | **Hassana** — Task 1 (blocks everyone) |
| 1–2 | Sahashri, Brian, Parth, Joshua, Lien, Kelvin — Tasks 2–12 |
| 4 | **Dhruv** — Task 11, then **Kelvin** — Task 13 |
| 6–7 | **Sahil** — Task 14 deploy + submit (**LAST**) |

---

## Deployment (Sahil — Task 14)

Run with **SQLCMD Mode** in SSMS:

```
scripts/deployment/deploy_all.sql
scripts/validation/validate_lab5_results.sql
```

---

## Script Rules

- Every script starts with `USE AdventureWorks2022; GO`
- All objects in `ProductionOps` schema
- Scripts must be re-runnable (`IF NOT EXISTS`, `CREATE OR ALTER`)
- Do not edit another member's script

---

## Add Collaborators (Repo Owner)

https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5/settings/access

---

## Submission Checklist

- [ ] All Lab 5 scripts in correct folders
- [ ] `deploy_all.sql` runs green
- [ ] 15 screenshots in `screenshots/`
- [ ] README with all 9 names + student numbers + Data Mapping
- [ ] Instructor added as GitHub collaborator
- [ ] Repository link submitted to professor

---

*Repository: https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5*
