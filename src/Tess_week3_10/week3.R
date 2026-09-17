# Libraries
if (!require("here")) install.packages("here", repos = "https://cloud.r-project.org")
library(tidyverse)
library(here)

# 1. Download data dynamically using here()
url <- paste0(
  "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"
)

raw_data_dir <- here("data", "raw")
raw_data_file <- here("data", "raw", "watch_events.csv")

if (!dir.exists(raw_data_dir)) {
  dir.create(raw_data_dir, recursive = TRUE)
}

if (!file.exists(raw_data_file)) {
  download.file(url, raw_data_file)
}

watch <- read_csv(raw_data_file)

# Ensure output directory exists
plots_dir <- here("src", "Tess_week3_10", "Plots")
if (!dir.exists(plots_dir)) {
  dir.create(plots_dir, recursive = TRUE)
}

# 2. Data Cleaning & Handling NA / Missing Values
watch_clean <- watch %>%
  select(-started_at_raw) %>%
  filter(!is.na(session_id), !is.na(video_id), !is.na(started_at)) %>%
  mutate(
    watch_seconds = replace_na(watch_seconds, 0),
    started_at_ts = as.POSIXct(started_at, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
    started_day = as.Date(started_at_ts),
    action_type = case_when(
      action == "watch_full" ~ "Complete Watch",
      action %in% c("like", "share", "comment") ~ "Active Engagement",
      is.na(action) ~ "Unknown Action",
      TRUE ~ "Browse / Other"
    )
  )

# Graph 1: Action distribution
action_count <- watch_clean %>%
  count(action)

action_counts_plot <- ggplot(action_count, aes(x = action, y = n)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Distribution of how often each action occurs",
    x = "Action",
    y = "Count"
  ) +
  theme_minimal()

ggsave(
  filename = file.path(plots_dir, "action_counts.png"),
  plot = action_counts_plot,
  width = 7,
  height = 4
)

# Graph 2: Mean watch time by action
action_group <- watch_clean %>%
  group_by(action) %>%
  summarise(
    mean_seconds = mean(watch_seconds, na.rm = TRUE)
  )

group_action_plot <- ggplot(action_group, aes(x = action, y = mean_seconds)) +
  geom_col(fill = "darkorange") +
  labs(
    title = "Mean watch time by action",
    x = "Action",
    y = "Mean watch time (seconds)"
  ) +
  theme_minimal()

ggsave(
  filename = file.path(plots_dir, "mean_watch_seconds.png"),
  plot = group_action_plot,
  width = 7,
  height = 4
)

# Graph 3: Number of watches per day
time_watch <- watch_clean %>%
  count(started_day)

time_watches_plot <- ggplot(time_watch, aes(x = started_day, y = n)) +
  geom_line(color = "forestgreen", linewidth = 1) +
  labs(
    title = "Number of watches per day",
    x = "Date",
    y = "Count"
  ) +
  theme_minimal()

ggsave(
  filename = file.path(plots_dir, "number_of_watches_per_day.png"),
  plot = time_watches_plot,
  width = 7,
  height = 4
)

# Graph 4: Top sessions with rank()
session_ranking <- watch_clean %>%
  filter(action == "watch_full") %>%
  count(session_id, name = "full_watches") %>%
  mutate(session_rank = rank(-full_watches, ties.method = "min")) %>%
  arrange(session_rank) %>%
  slice_head(n = 15)

session_counts_plot <- ggplot(session_ranking, aes(x = reorder(factor(session_id), -full_watches), y = full_watches)) +
  geom_col(fill = "purple") +
  labs(
    title = "Top 15 sessions with the most full watches",
    x = "Session ID",
    y = "Number of full watches"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  filename = file.path(plots_dir, "actions_per_session.png"),
  plot = session_counts_plot,
  width = 8,
  height = 4
)

# Graph 5: Top 10 most watched videos
video_count <- watch_clean %>%
  filter(action == "watch_full") %>%
  count(video_id, name = "full_watches") %>%
  arrange(desc(full_watches)) %>%
  slice_head(n = 10)

video_counts_plot <- ggplot(video_count, aes(x = reorder(factor(video_id), -full_watches), y = full_watches)) +
  geom_col(fill = "coral") +
  labs(
    title = "Top 10 most watched videos",
    x = "Video ID",
    y = "Number of full watches"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  filename = file.path(plots_dir, "most_watched_videos.png"),
  plot = video_counts_plot,
  width = 8,
  height = 4
)
