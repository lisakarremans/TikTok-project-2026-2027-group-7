# TikTok Project 2026-2027 - Group 7

## Goal

This project analyzes TikTok platform data from four perspectives:

- Impressions
- Sessions
- Users
- Watch events

Each analysis is stored in its own folder under `src`. The complete workflow is automated through one central Makefile located in the `src` folder.

## Project structure

TikTok-project-2026-2027-group-7/
├── data/
│   └── raw/
│
├── src/
│   ├── impressions_analysis/
│   ├── session_analysis/
│   ├── users_analysis/
│   ├── watch_events_analysis/
│   ├── summary_files/
│   ├── makefile
│   ├── summary.html
│   └── summary.qmd
│
├── .gitignore
├── AI.md
└── README.md


## Requirements

- R
- Make
- Required R packages:
  - tidyverse
  - dplyr
  - ggplot2
  - here

## How to run

Open a terminal in the root folder of the repository and run:

cd src
make


The Makefile downloads the required data to `data/raw`, runs the cleaning and analysis scripts, and generates the plots.

## Analyses

### Impressions analysis
Analyzes feed sources, ranking scores, duplicate impressions and malformed impressions.

### Session analysis
Analyzes session duration, video views and engagement levels.

### Users analysis
Analyzes user characteristics, behavioural traits and content preferences.

### Watch events analysis
Analyzes watch-event behaviour, including actions, watch time and viewing patterns.

## Output

The generated plots are saved in the output folders of the corresponding analyses.

## Reproducibility

The complete project can be reproduced by running `make` from the `src` folder.