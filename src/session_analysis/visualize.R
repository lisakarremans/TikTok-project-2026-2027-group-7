library(tidyverse)

# make sure output folder exists
if (!dir.exists("../../output")) {
  dir.create("../../output", recursive = TRUE)
}

# read cleaned dataset
sessions <- read_csv("../../data/sessions_cleaned.csv")

# plot 1: distribution of session duration (in minutes)
p1 <- ggplot(sessions, aes(x = session_duration_sec / 60)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(
    title = "Distribution of TikTok Session Duration",
    subtitle = "Calculated in minutes per user session",
    x = "Session duration (minutes)",
    y = "Number of sessions"
  ) +
  theme_minimal()

ggsave("../../output/plot_1_duration_dist.png", plot = p1, width = 7, height = 4)

# plot 2: relationship between duration and videos viewed
p2 <- ggplot(sessions, aes(x = session_duration_sec / 60, y = videos_viewed)) +
  geom_point(color = "darkorange", alpha = 0.5) +
  geom_smooth(method = "lm", color = "navy", se = FALSE) +
  labs(
    title = "Session Duration vs Videos Viewed",
    subtitle = "Linear relationship between duration and content consumption",
    x = "Session duration (minutes)",
    y = "Videos viewed"
  ) +
  theme_minimal()

ggsave("../../output/plot_2_duration_vs_videos.png", plot = p2, width = 7, height = 4)

# plot 3: group comparison by user engagement
sessions_grouped <- sessions %>%
  mutate(engagement_level = case_when(
    videos_viewed < 10 ~ "Low (<10)",
    videos_viewed <= 30 ~ "Medium (10-30)",
    TRUE ~ "High (>30)"
  )) %>%
  group_by(engagement_level) %>%
  summarise(avg_duration_min = mean(session_duration_sec / 60, na.rm = TRUE))

p3 <- ggplot(sessions_grouped, aes(x = engagement_level, y = avg_duration_min, fill = engagement_level)) +
  geom_col(show.legend = FALSE) +
  scale_fill_brewer(palette = "Blues") +
  labs(
    title = "Average Session Duration by Engagement Level",
    subtitle = "Comparing session length across different user tiers",
    x = "Engagement level",
    y = "Average duration (minutes)"
  ) +
  theme_minimal()

ggsave("../../output/plot_3_engagement_groups.png", plot = p3, width = 7, height = 4)

print("visualizations completed and saved to output folder")