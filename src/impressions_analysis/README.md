# Impressions Analysis

## Goal

Analyze the TikTok feed impressions data by inspecting feed sources, ranking scores, duplicates, and malformed impressions.

## Requirements

- R
- Packages: tidyverse
- Make installed

## Run instructions

Run the analysis from the `src/impressions_analysis` folder.

1. Run `make -n` to preview the commands.
2. Run `make` to download the data, clean the cleaned data and create the plots.

## Output

The analysis creates five plots in the `figures` folder:

- `source_mix.png`
- `score_total.png`
- `category_match.png`
- `creator_match.png`
- `satiation_penalty.png`