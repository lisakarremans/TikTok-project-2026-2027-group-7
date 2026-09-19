# Watch_events Graphs
## Goal
The goal is to analyze watch event data of Tiktok. Furthermore, also to work more with dplyr, practicing with the right paths, using R.script and creating makefiles.

## Data
- Main file: `watch_events.csv`
- For the data cleaning:
  - Deleted the column `started_at_raw` as it contained redundant information.
  - Filtered out rows with missing IDs or timestamps.
  - Replaced `NA` values in `watch_seconds` with 0.
  - Used week 4 techniques: grouped action types with `case_when()`, converted dates with `as.POSIXct()`, and ranked top sessions using `rank()`.

## Requirements
- R
- Packages: `tidyverse`, `here`
- Make was also used

## Run steps
Thanks to `library(here)`, you no longer need to comment or uncomment lines between Make and R.

# Option 1 with Makefile
1. Open the terminal and navigate to this folder:
   `cd src/Tess_week3_10`
2. Run `make`
3. All plots are automatically created and saved under the `Plots` folder.
4. (Optional) Run `make clean` to remove the generated plots.

# Option 2 with R.script
1. Open and run `week3.R`.
2. The script downloads the data, cleans missing values, and saves all graphs directly into the `Plots` folder.

## Expected output
The graphs saved in the folder `Plots`:
- `action_counts.png`
- `mean_watch_seconds.png`
- `number_of_watches_per_day.png`
- `actions_per_session.png`
- `most_watched_videos.png`