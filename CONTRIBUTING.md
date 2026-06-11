# Contributing — Lab 5 Team Workflow

## Who Pushes What

Only edit files assigned to you. Do **not** modify another member's scripts.

| Member | Task(s) | File(s) to Push | Folder |
|--------|---------|-----------------|--------|
| **Hassana** | 1, 10 | `initialize_productionops_schema.sql` | `scripts/setup/` |
| | | `failed_inspection_queue.sql` | `scripts/tables/` |
| **Sahashri** | 2, 6 | `inspection_request_registration.sql` | `scripts/tables/` |
| | | `inspection_batch_processing.sql` | `scripts/temporary_objects/` |
| **Brain** | 3, 4 | `inspection_result_classification.sql` | `scripts/controlflow/` |
| | | `monthly_inspection_schedule.sql` | `scripts/controlflow/` |
| **Parth** | 5 | `error_log.sql` | `scripts/tables/` |
| | | `inspection_error_logging.sql` | `scripts/errorhandling/` |
| **Josovo** | 8, 9 | `product_quality_statistics.sql` | `scripts/reporting/` |
| | | `vProductInspectionSummary.sql` | `scripts/reporting/` |
| **Lien** | 12 | `product_release_review.sql` | `scripts/tables/` |
| **Kelvin** | 7, 13 | `inspection_category_management.sql` | `scripts/temporary_objects/` |
| | | `notification_log.sql` | `scripts/tables/` |
| | | `inspection_notification_cursor.sql` | `scripts/cursors/` |
| **Dhruv** | 11 | `failed_product_review_cursor.sql` | `scripts/cursors/` |
| **Sahil (LAST)** | 14 | `deploy_all.sql` | `scripts/deployment/` |
| | | `validate_lab5_results.sql` | `scripts/validation/` |
| | | All screenshots | `screenshots/` |
| | | Final README updates | `README.md` |

---

## Git Workflow

### Option A — Pull Request (Recommended)

```bash
git checkout main
git pull
git checkout -b feature/hassana-task1
# ... add your files ...
git add scripts/setup/initialize_productionops_schema.sql
git commit -m "Task 1: add ProductionOps schema (Hassana)"
git push -u origin feature/hassana-task1
```

Open a PR on GitHub → Sahil or team lead reviews → merge to `main`.

### Option B — Direct push to main (Small team)

Only if your instructor allows it. Each member pushes their own files:

```bash
git pull
git add scripts/your-folder/your-file.sql
git commit -m "Task X: description (YourName)"
git push
```

---

## Dependency Order — When to Push

| Day | Who Pushes First |
|-----|------------------|
| Day 1 | **Hassana** — Task 1 (schema) must be merged before anyone else starts |
| Day 2 | Sahashri, Brain, Parth, Josovo, Lien, Kelvin |
| Day 4 | **Dhruv** — Task 11 (after Hassana Task 10 + Lien Task 12) |
| Day 4 | **Kelvin** — Task 13 (after Dhruv Task 11) |
| Day 6 | **Sahil** — Task 14 deploy + validation (after ALL other tasks merged) |

---

## Commit Message Format

```
Task <number>: <short description> (<Your Name>)
```

Examples:
- `Task 1: add ProductionOps schema (Hassana)`
- `Task 11: add failed product review cursor (Dhruv)`
- `Task 14: add deploy_all.sql (Sahil)`

---

## Adding Collaborators (Repo Owner)

Repo owner runs once after creating the GitHub repo:

```bash
gh repo edit YOUR_USERNAME/lab5-production-inspection --add-collaborator TEAMMATE_GITHUB_USERNAME
```

Or: GitHub → Repo → **Settings** → **Collaborators** → **Add people**

Also add your **instructor** as collaborator before submission.
