# TikTok Project 2026-2027 - Group 7

## Goal

This project analyzes TikTok platform data from several perspectives:

- Impressions
- Sessions
- Users
- Watch events
- Regression analysis

The project uses both CSV files and an SQLite database. Where the required tables are available in the SQLite database, the database is used as the data source. For analyses based on tables that are not included in the database, the required CSV files are still downloaded.

The complete workflow is automated through one central `Makefile` located in the root of the repository.

## Project structure

TikTok-project-2026-2027-group-7/

-- data/
 -- raw/
-- src/
   -- impressions_analysis/
   -- regression_analysis/
   -- session_analysis/
   -- users_analysis/
   -- watch_events_analysis/
   -- download_data.R
   -- download_sqlite.R
   -- download_video_view.R
   -- sql_tables.R

-- summary_output/
 -- TikTok_video_view_summary.pdf

-- Makefile
-- TikTok_video_view_summary.qmd
-- .gitignore
-- AI.md
-- README.md


## Requirements

To run the complete project, the following software is required:

- R
- Make
- Quarto
- TinyTeX

Required R packages include:

- tidyverse
- dplyr
- ggplot2
- here
- DBI
- RSQLite

## Data

The project uses several TikTok datasets, including:

- video view data
- users
- impressions
- sessions
- watch events

The SQLite database is downloaded through `src/download_sqlite.R`.

The database is used for analyses where the required tables are available. Some datasets are not included in the SQLite database, so the remaining data is still downloaded as CSV files.

The script `src/sql_tables.R` is used to work with and query the SQLite database.

## How to run

Open a terminal in the root folder of the repository and run:

make


The root `Makefile` starts the final workflow and renders the Quarto report.

The Makefile connects the final Quarto report to the generated PDF, allowing the complete workflow to be started with a single `make` command.

## Analyses

### Impressions analysis

Analyzes TikTok impression data, including feed sources and ranking-related scores.

### Session analysis

Analyzes session duration, video views and engagement levels.

### Users analysis

Analyzes user characteristics, behavioural traits and content preferences.

### Watch events analysis

Analyzes watch-event behaviour, including actions, watch time and viewing patterns.

### Regression analysis

The regression analysis investigates the relationship between ranking variables and `feed_rank`.

The first regression model investigates the relationship between `score_satiation_penalty` and `feed_rank`.

The extended model also includes:

- `score_category_match`
- `score_creator_match`

The regression results and visualizations are included in the final report.

## Final report

The final report is generated from:

TikTok_video_view_summary.qmd

Running:

make

creates the final PDF at:

summary_output/TikTok_video_view_summary.pdf


The report combines the data inspection, summary analyses, regression analysis and conclusions into one reproducible output.

## Reproducibility

The complete project can be reproduced from the root of the repository with one command:

make

Running `make` renders the final Quarto document, which performs the required data import, analyses and regression analysis and generates the final PDF.