# SQL Exploratory Analysis — Wildlife Biodiversity Database

> 15 SQL missions across four levels of difficulty, working on a real-world SQLite database of global wildlife observations sourced from the GBIF biodiversity portal — run via Python and displayed as pandas DataFrames.

---

## Problem

Raw data sitting in a database is only useful if you can ask questions of it. This project puts that skill to work in a realistic scenario: the fictional **Global Institute of Life (GIL)**, a biodiversity monitoring centre that tracks species observations across dozens of regions worldwide. The goal is to answer progressively harder analytical questions using pure SQL — from basic filtering to multi-table JOIN aggregations.

## Dataset

- **Source:** [GBIF – Global Biodiversity Information Facility](https://www.gbif.org/occurrence) (sample)
- **Database:** SQLite (`data/database.db`), built from `src/sql/create.sql` + `src/sql/insert.sql`
- **Tables:**

| Table | Description |
|---|---|
| `regions` | 40+ geographic regions (Australia, Argentina, Uganda, Canada, Norway, and more) |
| `species` | Species records with scientific name, common name, genus, family, order |
| `observations` | Individual sightings: species, region, observer, date, coordinates, count |
| `climate` | Climate data per region: avg temperature, precipitation |

## Missions (15 total)

### Level 1 — Basic Exploration (SELECT, LIMIT, DISTINCT, WHERE)
1. First 10 recorded observations
2. Distinct `region_id` values in the dataset
3. Count of distinct species observed
4. Observations for `region_id = 2`
5. Observations recorded on a specific date

### Level 2 — Aggregation & Ordering (GROUP BY, COUNT, ORDER BY, HAVING)
6. Region with the most observations
7. Top 5 most frequently observed species
8. Species with fewer than 5 records (rare sightings)
9. Most active observers by record count

### Level 3 — Cross-Table Relationships (JOIN)
10. Observation records joined with region names
11. Observation records joined with species scientific names
12. Most observed species per region (two-table GROUP BY + ORDER BY)

### Level 4 — Data Manipulation (INSERT, UPDATE, DELETE — optional)
13. Insert a test observation record
14. Correct a scientific name with a typo (`Panthera oncca` → `Panthera onca`)
15. Delete a specific observation by ID

## How It Works

Queries are written in `src/sql/queries.sql`. Running `python src/app.py` executes every query and prints the results as formatted pandas DataFrames in the terminal.

```bash
git clone https://github.com/matthewkane-ml/SQL_MTK.git
cd SQL_MTK
pip install -r requirements.txt
python src/app.py
```

The solution to all 15 missions is in `src/solution.sql`.

## Tech Stack

`Python` · `SQLite` · `SQLAlchemy` · `pandas`

## What I'd Do Next

- Visualize query results with Matplotlib — e.g., a map of observation density by region using latitude/longitude coordinates
- Add indexes on `observations(species_id)` and `observations(region_id)` to understand how indexing accelerates GROUP BY queries on large tables
- Migrate from SQLite to PostgreSQL and practise window functions (`RANK()`, `ROW_NUMBER()`, `LAG()`) for time-series trend analysis

---

**Author:** Matthew Kane — [LinkedIn](https://www.linkedin.com/in/thomas-k-392094410/) · [GitHub portfolio](https://github.com/matthewkane-ml)
