# Lab 5 — Production Quality Inspection Processing System

**Course:** SQL Server Developer  
**Database:** AdventureWorks2022  
**Schema:** ProductionOps  
**Timeline:** 7 Days  

Team project implementing T-SQL control flow, error handling, temp objects, and cursors for a production quality inspection workflow.

---

## Team Members

| # | Name | Lab Task(s) | Script Folder(s) |
|---|------|-------------|------------------|
| 1 | Hassana | Task 1, Task 10 | `scripts/setup/`, `scripts/tables/` |
| 2 | Sahashri | Task 2, Task 6 | `scripts/tables/`, `scripts/temporary_objects/` |
| 3 | Brain | Task 3, Task 4 | `scripts/controlflow/` |
| 4 | Parth | Task 5 | `scripts/tables/`, `scripts/errorhandling/` |
| 5 | Josovo | Task 8, Task 9 | `scripts/reporting/` |
| 6 | Lien | Task 12 | `scripts/tables/` |
| 7 | Kelvin | Task 7, Task 13 | `scripts/temporary_objects/`, `scripts/tables/`, `scripts/cursors/` |
| 8 | Dhruv | Task 11 | `scripts/cursors/` |
| 9 | Sahil | Task 14 (**LAST**) | `scripts/deployment/`, `scripts/validation/`, `screenshots/` |

> Replace student numbers in this README before final submission.

---

## Folder Structure

```
Lab5/
├── scripts/
│   ├── setup/                  ← Hassana (Task 1)
│   ├── tables/                 ← Hassana, Sahashri, Parth, Lien, Kelvin
│   ├── controlflow/            ← Brain
│   ├── errorhandling/          ← Parth
│   ├── temporary_objects/      ← Sahashri, Kelvin
│   ├── reporting/              ← Josovo
│   ├── cursors/                ← Dhruv, Kelvin
│   ├── deployment/             ← Sahil (LAST)
│   └── validation/             ← Sahil (LAST)
├── screenshots/                ← Sahil compiles all 15
├── TEAM_PROJECT_PLAN.md
├── TEAM_WORK_ALLOCATION.xlsx
└── README.md
```

---

## How to Push Your Part (Team Members)

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/lab5-production-inspection.git
   cd lab5-production-inspection
   ```
2. Create a branch for your work:
   ```bash
   git checkout -b feature/yourname-task
   ```
3. Add **only your script file(s)** in the correct folder (see table above).
4. Commit and push:
   ```bash
   git add scripts/your-folder/your-script.sql
   git commit -m "Add Task X: your-script.sql (YourName)"
   git push -u origin feature/yourname-task
   ```
5. Open a **Pull Request** on GitHub, or ask Sahil to merge into `main`.

**Rules:**
- Each task is owned by **one person only** — do not edit another member's script.
- Every script must start with `USE AdventureWorks2022; GO`
- All objects go in the `ProductionOps` schema.
- Scripts must be re-runnable (use `IF NOT EXISTS` / `CREATE OR ALTER`).

See `CONTRIBUTING.md` for the full file ownership map.

---

## Deployment (Sahil — Task 14)

Run with **SQLCMD Mode** enabled in SSMS:

```
scripts/deployment/deploy_all.sql
```

Then validate:

```
scripts/validation/validate_lab5_results.sql
```

---

## Data Mapping

See `TEAM_PROJECT_PLAN.md` Section 6 for InspectionRequests, FailedInspectionQueue, and ProductReleaseReview mapping rules.

---

## Submission Checklist

- [ ] All SQL scripts in correct folders
- [ ] README updated with all 9 names + student numbers
- [ ] 15 screenshots in `screenshots/`
- [ ] `deploy_all.sql` runs green
- [ ] Instructor added as GitHub collaborator
- [ ] Repository link submitted to professor
