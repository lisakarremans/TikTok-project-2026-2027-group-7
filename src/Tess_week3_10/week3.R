# libraries
library(tidyverse)

# Download the Data
url <- paste0(
"https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"
)
download.file(url,"data/raw/watch_events.csv")
watch <- read_csv("data/raw/watch_events.csv")

# Calculates mean average watch second for each action
action_grouped <- watch %>%
  group_by(action) %>%
  summarise(
    watch_seconds_per_action = mean(watch_seconds, na.rm = TRUE)
  )

# Plots the amount of watch seconds for each action
ggplot(action_grouped, aes(x = action, y = watch_seconds_per_action)) +
  geom_col() +
  labs(
    title = "Mean watch time per seconds by action",
    x = "Action",
    y = "Mean watch seconds"
  )

# Saves the plot in the map Plots
ggsave(
  "src/Tess_week3_10/Plots/action_watch_seconds.png"
)


