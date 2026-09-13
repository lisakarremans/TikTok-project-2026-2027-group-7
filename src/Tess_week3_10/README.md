# Watch_events Graphs
## Goal
The goal is to analyze watch event data of Tiktok. Furthermore, also to work more with dplyr, practicing with the right paths, using R.script and creating makefiles.

## Data
- Main file: watch_events.csv
- For the data cleaning, only the column 'started_at_raw' is deleted as it contained information that was already stored in 'started_at'.

## Requirements
- R
- Packages: tidyverse
- Make was also used
## Run steps
# Option 1 with Makefile
1. Keep the paths for the Make file uncommented and make sure the path for R script is commented.
2. Leave every code to make a graph commented except the first graph. Specifically uncomment the code lines of how to make the graph and only uncomment the graph save specifically for the mark file
3. The makefile only creates graph 1 (as this was sufficient according to class)
4. Open the terminal and make sure that you are in the right folder with running  cd src/Tess_week3_10
5. After that, run 'make -n', to check if you are in the right folder, if it said week3.R then you are in the right folder
6. Run 'make'
7. After that the graph is now saved under Plots

# Option 2 with R.script
1. Keep the path for the R script uncommented, and make sure the path for make is commented.
2. Uncomment all code lines for all the graphs, including the code preparing the data for the graph, the code that creates the graph and the code to save the graph
3. Note that you keep the code for saving the graph specifically for make file commented, and ensures that the saving for the R.script is uncommented. Note that this only holds for the first graph.
4. Run 'week3.R'.
5. The script downloads the data, does a little bit of data cleaning and creates the graphs that are saved under the folder plots.

## Expected output
# Option 1 with the make fil
- The graph: `action_counts.png` in the folder Plots

# Option 2 with R.script
- The graphs: 
- `action_counts.png`
- `mean_watch_seconds.png`
- `number_of_watches_per_day.png`
- `actions_per_session.png`
- `most_watched_videos.png`
