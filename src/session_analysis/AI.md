# AI Logbook

Tool used: Gemini and Tilburg.AI (consisting of ChatGPT and Claude)

Project setup and paths
I used Gemini to double-check relative file paths (../../data and ../../output) so the script outputs ends up in the right project folders. When terminal errors popped up about files not being found, I checked the current working directory in the terminal and ran the scripts from src/session_analysis.

Visualizations and groupings
To make the scatterplot and bar chart more insightful, I asked Gemini for ideas on how to split user sessions into engagement tiers using case_when(). At first the initial thresholds didn't work well because the dataset caps at 30 videos, so the high category stayed empty. I changed the cutoffs to 8 and 18 videos to get three balanced groups, and added factor levels to fix the plot order from Low to High instead of alphabetical.

Makefile
I asked for the basic makefile structure to connect download_and_clean.R and visualize.R. I ran into a syntax error with tabs in the makefile, removed the accidental tab on the first line, and tested the build with make -n.

README
I used Gemini for a quick check on what a concise pipeline README should contain, and wrote the final summary to describe the scripts and outputs.