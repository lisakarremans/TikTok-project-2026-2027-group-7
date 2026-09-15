# Session Analysis

This folder contains the code to download, clean, and analyze session data from TikTok.

## Files
- download_and_clean.R: Downloads the raw sessions dataset and removes rows with missing IDs.
- visualize.R: Creates 3 plots exploring session duration, video views, and engagement tiers.
- makefile: Automates running the scripts in the right order.

## Outputs
- data/sessions_cleaned.csv
- output/plot_1_duration_dist.png
- output/plot_2_duration_vs_videos.png
- output/plot_3_engagement_groups.png

## How to run
Make sure your terminal is in this folder (`src/session_analysis`), then run:
`make`

