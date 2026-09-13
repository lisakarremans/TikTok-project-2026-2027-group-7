# libraries
library(tidyverse)

# Download the Data
url <- paste0(
"https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"
)

# This path works for running the make file with 1 graph (as said Thurseday that 1 was enough)
download.file(url,"../../data/raw/watch_events.csv")
watch <- read_csv("../../data/raw/watch_events.csv")

# This path works for saving in R.script
# download.file(url, "data/raw/watch_events.csv")
# watch <- read_csv("data/raw/watch_events.csv")


# DATA CLEANING
# Removing started_at_raw as we also have started_at
watch <- watch %>%
  select(-started_at_raw)

#START OF CREATING GRAPHS
# Count how many times each action happens
action_count <- watch %>%
  count(action)

# Graph 1
# Plot the number of watch events for each action if R. script
action_counts <- ggplot(action_count, aes(x = action, y = n)) +
  geom_col() +
  labs(
  title = "Distribution of how often each action occurs",
  x = "Action",
  y = "Count"
)

# Saves the plot in the map Plots if make
ggsave(
  "Plots/action_counts.png",plot = action_counts,
  width = 7,
  height = 4
)

# Saves the plot in the map Plots if R
# ggsave(
#   "src/Tess_week3_10/Plots/action_counts.png",plot = action_counts,
#   width = 7,
#   height = 4
# )

# Graph 2
# Calculate average watch time for each action
# action_group <- watch %>%
#   group_by(action) %>%
#   summarise(
#     mean_seconds = mean(watch_seconds, na.rm = TRUE)
#   )

# Plot mean watch time for each action
# group_action <- ggplot(action_group, aes(x = action, y = mean_seconds)) +
#   geom_col() +
#   labs(
#     title = "Mean watch time by action",
#     x = "Action",
#     y = "Mean watch time (seconds)"
#   )

# Saves the plot in the map Plots
# ggsave(
#   "src/Tess_week3_10/Plots/mean_watch_seconds.png", plot = group_action,
#    width = 7,
#   height = 4
# )

# Graph 3
# Count watches per day
# time_watch <- watch %>%
#   mutate(date = as.Date(started_at)) %>%
#   count(date)


# Plot the number of watches per day
# time_watches <- ggplot(time_watch, aes(x = date, y = n)) +
#   geom_line() +
#   labs(
#     title = "Number of watches per day",
#     x = "Date",
#     y = "Count"
#   )

# Saves the plot in the map Plots
# ggsave(
#   "src/Tess_week3_10/Plots/number_of_watches_per_day.png", plot = time_watches,
#   width = 7,
#   height = 4
# )

# Graph 4
# Filter on only when it is fully watched, puts the highest count first and then take only the first 15
# session_count <- watch %>%
#   filter(action == "watch_full") %>%
#   count(session_id) %>%
#   arrange(desc(n)) %>%   
#   head(15)               

# Plot the sessions with the 15 most full watches
# session_counts <- ggplot(session_count, aes(x = factor(session_id), y = n)) +
#   geom_col() +
#   labs(
#     title = "Top 15 sessions with the most full watches",
#     x = "Session ID",
#     y = "Number of full watches"
#   )


# Saves the plot in the map Plots
# ggsave(
#   "src/Tess_week3_10/Plots/actions_per_session.png", plot = session_counts,
#   width = 7,
#   height = 4
# )

# Graph 5
# Keep only videos that were watched fully, puts the highest counts first and only take the highest 15
# video_count <- watch %>%
#   filter(action == "watch_full") %>%
#   count(video_id) %>%
#   arrange(desc(n)) %>%   
#   head(10)               

#Plot the videos ID with the most full watches
# video_counts <- ggplot(video_count, aes(x = factor(video_id), y = n)) +
#   geom_col() +
#   labs(
#     title = "Top 15 most watched videos",
#     x = "Video ID",
#     y = "Number of full watches"
#   )

# Saves the plot in the map Plots
# ggsave(
#   "src/Tess_week3_10/Plots/most_watched_videos.png", plot = video_counts,
#   width = 7,
#   height = 4
# )

