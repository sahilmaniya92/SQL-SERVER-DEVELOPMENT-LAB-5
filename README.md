# SQL Server Development — Simulation 4-5
## Production Quality Inspection Processing System

**Course:** SQL Server Developer  
**Project:** Simulation 4-5 (Lab 4 + Lab 5 — one joined project)  
**Database:** AdventureWorks2022  
**Schema:** ProductionOps  
**Timeline:** 14 Days  

**GitHub Repository:** [SQL-SERVER-DEVELOPMENT-LAB-5](https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5)

---

## Create Project Repo (Repo Owner — Sahil)

Follow these steps once to create the team GitHub repo with the **full project structure** (not just the Lab5 folder).

### Step 1 — Log in to GitHub

```powershell
gh auth login
```

Choose: GitHub.com → HTTPS → Login with a web browser → paste device code.

### Step 2 — Create repo folder locally

Your repo root should match this layout. Run from your project folder:

```powershell
cd "c:\Users\Admin\Downloads\New folder (2)\Lab5"
.\setup_github.ps1
```

Or manually:

```powershell
cd "c:\Users\Admin\Downloads\New folder (2)\Lab5"
git init
git branch -M main
git remote add origin https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5.git
git add .
git commit -m "Initial commit: Simulation 4-5 project structure and team docs"
git push -u origin main
```

If GitHub already has files (e.g. a README):

```powershell
git pull origin main --rebase --allow-unrelated-histories
git push -u origin main
```

### Step 3 — Add teammates

Open: https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5/settings/access

- Click **Add people**
- Enter each teammate's GitHub username
- Role: **Write**
- Add your **instructor** before final submission

### Step 4 — Share clone link with team

```
https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5.git
```

---

## Team Members

| # | Name | Role | Tasks Owned | Total Hrs | Student No. |
|---|------|------|-------------|-----------|-------------|
| 1 | Hassana | Schema & Foundation Lead | L4-T1, L4-T2, L5-T10 | 20 | _TBD_ |
| 2 | Sahashri | Report & Batch Developer | L4-T10, L5-T6 | 12 | _TBD_ |
| 3 | Brain | UDF & Control Flow Developer | L4-T3, L5-T3, L5-T4 | 6 | _TBD_ |
| 4 | Parth | Stored Proc & Error Handling | L4-T5, L5-T5 | 11 | _TBD_ |
| 5 | Josovo | Views & Analytics Developer | L4-T6, L4-T7, L5 support | 6 | _TBD_ |
| 6 | Lien | TVF & Table Developer | L4-T4, L5-T12 | 6 | _TBD_ |
| 7 | Kelvin | Window Reports & Notification | L4-T8, L5-T7, L5-T13 | 6 | _TBD_ |
| 8 | Dhruv | Subquery & Cursor Developer | L4-T9, L5-T11 | 11 | _TBD_ |
| 9 | Sahil | Final Deployment (**LAST**) | L4-T12–14, L5-T14 | 11 | _TBD_ |

> Each task is owned by **one person only**. Sahil owns the **LAST task** (final deploy + submission).  
> Task codes explained in `TEAM_PROJECT_PLAN.md` (Simulation4-5 folder).

---

## Repository Structure (Project Root)

When anyone clones the repo, this is what they get:

```
SQL-SERVER-DEVELOPMENT-LAB-5/
│
├── scripts/
│   ├── setup/                  ← Hassana (L4-T1)
│   ├── tables/                 ← Hassana, Parth, Lien, Kelvin
│   ├── functions/              ← Brain, Lien
│   ├── procedures/             ← Parth
│   ├── views/                  ← Josovo
│   ├── reporting/              ← Josovo, Sahashri, Kelvin, Dhruv
│   ├── controlflow/            ← Brain
│   ├── errorhandling/          ← Parth
│   ├── temporary_objects/      ← Sahashri, Kelvin
│   ├── cursors/                ← Dhruv, Kelvin
│   ├── deployment/             ← Sahil (LAST)
│   └── validation/             ← Sahil (LAST)
│
├── screenshots/                ← GitHub repo folder (see Screenshot Ownership below)
│   ├── Hassana/                ← screenshots #1–3
│   ├── Sahashri/               ← screenshots #4–5
│   ├── Brain/                  ← screenshots #6–8
│   ├── Parth/                  ← screenshots #9–10
│   ├── Josovo/                 ← screenshots #11–12
│   ├── Lien/                   ← screenshots #13–14
│   ├── Kelvin/                 ← screenshots #15–17
│   ├── Dhruv/                  ← screenshots #18–20
│   └── Sahil/                  ← screenshots #21–22 + final compile
│
├── README.md                   ← this file
├── CONTRIBUTING.md             ← who pushes which file
├── TEAM_PROJECT_PLAN.md
├── work_allocated.md
└── TEAM_WORK_ALLOCATION.xlsx
```

---

## Who Pushes Which Script

| Member | Task | Script File | Folder |
|--------|------|-------------|--------|
| **Hassana** | L4-T1 | `initialize_productionops_schema.sql` | `scripts/setup/` |
| | L4-T2 | `inspection_request_registration.sql` | `scripts/tables/` |
| | L5-T10 | `failed_inspection_queue.sql` | `scripts/tables/` |
| **Sahashri** | L4-T10 | `inspection_product_detail_report.sql` | `scripts/reporting/` |
| | L5-T6 | `inspection_batch_processing.sql` | `scripts/temporary_objects/` |
| **Brain** | L4-T3 | `fn_InspectionScoreClass.sql` | `scripts/functions/` |
| | L5-T3 | `inspection_result_classification.sql` | `scripts/controlflow/` |
| | L5-T4 | `monthly_inspection_schedule.sql` | `scripts/controlflow/` |
| **Parth** | L4-T5 | `usp_GetInspectionRequests.sql` | `scripts/procedures/` |
| | L5-T5 | `error_log.sql` | `scripts/tables/` |
| | L5-T5 | `inspection_error_logging.sql` | `scripts/errorhandling/` |
| **Josovo** | L4-T6 | `vProductInspectionSummary.sql` | `scripts/views/` |
| | L4-T6 | `vw_PendingInspections.sql` | `scripts/views/` |
| | L4-T7 | `product_quality_statistics.sql` | `scripts/reporting/` |
| **Lien** | L4-T4 | `fn_GetProductInspectionData.sql` | `scripts/functions/` |
| | L5-T12 | `product_release_review.sql` | `scripts/tables/` |
| **Kelvin** | L4-T8 | `product_ranking_report.sql` | `scripts/reporting/` |
| | L5-T7 | `inspection_category_management.sql` | `scripts/temporary_objects/` |
| | L5-T13 | `notification_log.sql` | `scripts/cursors/` |
| | L5-T13 | `inspection_notification_cursor.sql` | `scripts/cursors/` |
| **Dhruv** | L4-T9 | `products_below_safety_stock_report.sql` | `scripts/reporting/` |
| | L5-T11 | `failed_product_review_cursor.sql` | `scripts/cursors/` |
| **Sahil (LAST)** | L4-T12 | `deploy_lab4.sql` | `scripts/deployment/` |
| | L4-T13 | `validate_lab4_results.sql` | `scripts/validation/` |
| | L5-T14 | `deploy_all.sql` | `scripts/deployment/` |
| | L5-T14 | `validate_lab5_results.sql` | `scripts/validation/` |
| | L5-T14 | README, screenshots, submit | `README.md` · `screenshots/` |

Each folder has an `OWNER.txt` file showing who owns which scripts.

---

## How Team Members Push Their Part

```powershell
git clone https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5.git
cd SQL-SERVER-DEVELOPMENT-LAB-5
git checkout -b feature/yourname-task
```

Add your script in the correct folder, then:

```powershell
git add scripts/your-folder/your-script.sql
git commit -m "L4-T1: add schema script (Hassana)"
git push -u origin feature/yourname-task
```

Open a **Pull Request** on GitHub → Sahil merges to `main`.

### Push order (dependencies)

| Day | Who pushes first |
|-----|------------------|
| 1 | **Hassana** — L4-T1, L4-T2 (blocks everyone) |
| 2 | Brain, Parth, Josovo, Lien — L4-T3–T7 |
| 3 | Kelvin, Dhruv, Sahashri — L4-T8–T10 |
| 4 | **Sahil** — L4-T12–14 mid deploy |
| 6 | Hassana, Sahashri, Lien — L5-T10, T6, T12 |
| 7 | Brain, Parth, Kelvin — L5-T3–T5, T7 |
| 9 | **Dhruv** L5-T11, then **Kelvin** L5-T13 |
| 11–12 | **Sahil** — L5-T14 final deploy + submit |

---

## Project Phases

| Phase | Days | Focus |
|-------|------|-------|
| Phase 1 — Foundation & Reporting | 1–5 | Schema, UDFs, views, reports, mid deploy (Day 4) |
| Phase 2 — Control Flow & Cursors | 6–11 | Temp objects, error handling, cursors |
| Phase 3 — Deploy & Submit | 12–14 | Full deploy, README, screenshots, GitHub submit |

---

## Screenshot Ownership (GitHub Repo)

Each team member captures their own screenshots and pushes them to the **`screenshots/`** folder in the GitHub repo.  
**Sahil** compiles all 22 into the final submission folder before Day 12.

### Team — who uploads what

| # | Name | Screenshot(s) | Task | Upload to |
|---|------|---------------|------|-----------|
| 1 | **Hassana** | Schema validation | L4-T1 | `screenshots/Hassana/` |
| 2 | **Hassana** | InspectionRequests data | L4-T2 | `screenshots/Hassana/` |
| 3 | **Hassana** | FailedInspectionQueue data | L5-T10 | `screenshots/Hassana/` |
| 4 | **Sahashri** | JOIN report output | L4-T10 | `screenshots/Sahashri/` |
| 5 | **Sahashri** | #InspectionBatch temp table | L5-T6 | `screenshots/Sahashri/` |
| 6 | **Brain** | Scalar UDF test | L4-T3 | `screenshots/Brain/` |
| 7 | **Brain** | IF...ELSE classification | L5-T3 | `screenshots/Brain/` |
| 8 | **Brain** | WHILE monthly schedule | L5-T4 | `screenshots/Brain/` |
| 9 | **Parth** | Stored procedure output | L4-T5 | `screenshots/Parth/` |
| 10 | **Parth** | ErrorLog contents | L5-T5 | `screenshots/Parth/` |
| 11 | **Josovo** | vProductInspectionSummary | L4-T6 | `screenshots/Josovo/` |
| 12 | **Josovo** | CTE quality statistics | L4-T7 | `screenshots/Josovo/` |
| 13 | **Lien** | TVF output | L4-T4 | `screenshots/Lien/` |
| 14 | **Lien** | ProductReleaseReview table | L5-T12 | `screenshots/Lien/` |
| 15 | **Kelvin** | Window function ranking | L4-T8 | `screenshots/Kelvin/` |
| 16 | **Kelvin** | @InspectionCategories | L5-T7 | `screenshots/Kelvin/` |
| 17 | **Kelvin** | NotificationLog contents | L5-T13 | `screenshots/Kelvin/` |
| 18 | **Dhruv** | Subquery report | L4-T9 | `screenshots/Dhruv/` |
| 19 | **Dhruv** | Review cursor messages | L5-T11 | `screenshots/Dhruv/` |
| 20 | **Dhruv** | ProductReleaseReview data | L5-T11 | `screenshots/Dhruv/` |
| 21 | **Sahil** | deploy_lab4.sql success | L4-T12 | `screenshots/Sahil/` |
| 22 | **Sahil** | deploy_all.sql success | L5-T14 | `screenshots/Sahil/` |

### Push screenshots to GitHub

Each member pushes only their own folder:

```powershell
git add screenshots/YourName/
git commit -m "Add screenshots (YourName)"
git push
```

**All team members:** Hassana · Sahashri · Brain · Parth · Josovo · Lien · Kelvin · Dhruv · Sahil

---

Run with **SQLCMD Mode** enabled in SSMS:

| Script | When |
|--------|------|
| `scripts/deployment/deploy_lab4.sql` | Day 4 — mid deploy (Phase 1 gate) |
| `scripts/deployment/deploy_all.sql` | Day 11 — full project deploy |
| `scripts/validation/validate_lab4_results.sql` | After mid deploy |
| `scripts/validation/validate_lab5_results.sql` | After full deploy |

---

## Script Rules

- Every script starts with `USE AdventureWorks2022; GO`
- All objects in `ProductionOps` schema — never `dbo`
- Scripts must be re-runnable (`IF NOT EXISTS`, `CREATE OR ALTER`)
- Do **not** edit another member's script file

---

## Data Mapping

See `TEAM_PROJECT_PLAN.md` and `work_allocated.md` (Simulation4-5 folder) for:

- InspectionRequests mapping (L4-T2)
- FailedInspectionQueue scoring (L5-T10)
- ProductReleaseReview decisions (L5-T11 cursor)
- NotificationLog messages (L5-T13 cursor)

---

## Submission Checklist

- [ ] All 25 scripts in correct folders
- [ ] `deploy_lab4.sql` runs green (Day 4)
- [ ] `deploy_all.sql` runs green (Day 11)
- [ ] 22 screenshots in `screenshots/` (each member's folder uploaded)
- [ ] Hassana, Sahashri, Brain, Parth, Josovo, Lien, Kelvin, Dhruv, Sahil — all names in README
- [ ] Data Mapping section in README
- [ ] Instructor added as GitHub collaborator
- [ ] Repository link submitted to professor

---

## Related Docs

| File | Location | Purpose |
|------|----------|---------|
| `TEAM_PROJECT_PLAN.md` | Simulation4-5/ | Full plan + task code glossary |
| `work_allocated.md` | Simulation4-5/ | Day-by-day work allocation |
| `CONTRIBUTING.md` | Lab5/ | Git workflow details |
| `setup_github.ps1` | Lab5/ | One-click push script |

---

*Repository: https://github.com/sahilmaniya92/SQL-SERVER-DEVELOPMENT-LAB-5*
