# libraries
library(tidyverse)

# Download the Data
url <- paste0(
"https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"
)
#download.file(url,"../../data/raw/watch_events.csv")
#watch <- read_csv("../../data/raw/watch_events.csv")
download.file(url, "data/raw/watch_events.csv")
watch <- read_csv("data/raw/watch_events.csv")

# Count the number of watch events for each action
action_counts <- watch %>%
  count(action)

# Plot the number of watch events for each action
ggplot(action_counts, aes(x = action, y = n)) +
  geom_col() +
  labs(
    title = "Number of watch events by action",
    x = "Action",
    y = "Number of watch events"
  )

# Save the plot
ggsave(
  "src/Tess_week3_10/Plots/action_counts.png",
  width = 7,
  height = 4
)





# Calculates mean average watch second for each action
action_grouped <- watch %>%
  group_by(action) %>%
  summarise(
    watch_seconds_per_action = mean(watch_seconds, na.rm = TRUE)
  )

# Plots the amount of watch seconds for each action
grouped_action <- ggplot(action_grouped, aes(x = action, y = watch_seconds_per_action)) +
  geom_col() +
  labs(
    title = "Mean watch time per seconds by action",
    x = "Action",
    y = "Mean watch seconds"
  )

# Saves the plot in the map Plots
ggsave(
  "Plots/action_watch_seconds.png", plot = grouped_action
)

daily_watch <- watch %>%
  mutate(date = as.Date(started_at)) %>%
  count(date)

# Plot the number of watch events over time
ggplot(daily_watch, aes(x = date, y = n)) +
  geom_line() +
  labs(
    title = "Watch events over time",
    x = "Date",
    y = "Number of watch events"
  )

# Save the plot
ggsave(
  "src/Tess_week3_10/Plots/watch_events_over_time.png",
  width = 7,
  height = 4
)

# Plot the distribution of watch seconds
ggplot(watch, aes(x = watch_seconds)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Distribution of watch seconds",
    x = "Watch seconds",
    y = "Count"
  )

# Save the plot
ggsave(
  "src/Tess_week3_10/Plots/watch_seconds_distribution.png",
  width = 7,
  height = 4
)