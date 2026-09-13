# libraries
library(tidyverse)

# Download the Data
url <- paste0(
"https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"
)

# This path works for running the make file with 1 graph (as said Thurseday that 1 was enough)
# download.file(url,"../../data/raw/watch_events.csv")
# watch <- read_csv("../../data/raw/watch_events.csv")

# This path works for saving in R.script
download.file(url, "data/raw/watch_events.csv")
watch <- read_csv("data/raw/watch_events.csv")


# DATA CLEANING
# Removing started_at_raw as we also have started_at
watch <- watch %>%
  select(-started_at_raw)

#START OF CREATING GRAPHS
# Count how many times each action happens
action_count <- watch %>%
  count(action)

# Graph 1
# Plot the number of watch events for each action 
action_counts <- ggplot(action_count, aes(x = action, y = n)) +
  geom_col() +
  labs(
  title = "Distribution of how often each action occurs",
  x = "Action",
  y = "Count"
)

# Saves the plot in the map Plots
ggsave(
  "src/Tess_week3_10/Plots/action_counts.png",plot = action_counts,
  width = 7,
  height = 4
)

# Graph 2
# Calculate average watch time for each action
action_group <- watch %>%
  group_by(action) %>%
  summarise(
    mean_seconds = mean(watch_seconds, na.rm = TRUE)
  )

# Plot mean watch time for each action
group_action <- ggplot(action_group, aes(x = action, y = mean_seconds)) +
  geom_col() +
  labs(
    title = "Mean watch time by action",
    x = "Action",
    y = "Mean watch time (seconds)"
  )

# Saves the plot in the map Plots
ggsave(
  "src/Tess_week3_10/Plots/mean_watch_seconds.png", plot = group_action,
   width = 7,
  height = 4
)

# Graph 3
# Count watches per day
time_watch <- watch %>%
  mutate(date = as.Date(started_at)) %>%
  count(date)


# Plot the number of watches per day
time_watches <- ggplot(time_watch, aes(x = date, y = n)) +
  geom_line() +
  labs(
    title = "Number of watches per day",
    x = "Date",
    y = "Count"
  )

# Saves the plot in the map Plots
ggsave(
  "src/Tess_week3_10/Plots/number_of_watches_per_day.png", plot = time_watches,
  width = 7,
  height = 4
)

# Graph 4
# Count watches per session
session_count <- watch %>%
  count(session_id)

# Plot the distribution of the number of watches per session
session_counts <- ggplot(session_count, aes(x = n)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Distribution of watches per session",
    x = "Number of watches",
    y = "Count"
  )

# Saves the plot in the map Plots
ggsave(
  "src/Tess_week3_10/Plots/watches_per_session.png",
  plot = session_counts,
  width = 7,
  height = 4
)

# Graph 5
# Count how many times each video occurs
video_count <- watch %>%
  count(video_id)

# Plot the distribution of watches per video
video_counts <- ggplot(video_count, aes(x = n)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Distribution of watches per video",
    x = "Number of watches",
    y = "Count"
  )

# Saves the plot in the map Plots
ggsave(
  "src/Tess_week3_10/Plots/watches_per_video.png", plot = video_counts,
  width = 7,
  height = 4
)
