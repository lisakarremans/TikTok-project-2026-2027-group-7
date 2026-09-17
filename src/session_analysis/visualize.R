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

# prepare groups with ordered factor
tier_order <- c("Low engagement", "Medium engagement", "High engagement")

sessions_plot <- sessions %>%
  mutate(
    engagement_tier = case_when(
      videos_viewed < 8 ~ "Low engagement",
      videos_viewed <= 18 ~ "Medium engagement",
      TRUE ~ "High engagement"
    ),
    engagement_tier = factor(engagement_tier, levels = tier_order)
  )

# plot 2: duration vs videos viewed with ordered tiers
p2 <- ggplot(sessions_plot, aes(x = session_duration_sec / 60, y = videos_viewed, color = engagement_tier)) +
  geom_point(alpha = 0.6, size = 1.8) +
  scale_color_discrete(breaks = tier_order) +
  labs(
    title = "Session Duration vs Videos Viewed",
    subtitle = "User engagement tiers across session length",
    x = "Session duration (minutes)",
    y = "Videos viewed",
    color = "Engagement"
  ) +
  theme_minimal()

ggsave("../../output/plot_2_duration_vs_videos.png", plot = p2, width = 7, height = 4)

# plot 3: group comparison by user engagement
sessions_grouped <- sessions_plot %>%
  group_by(engagement_tier) %>%
  summarise(avg_duration_min = mean(session_duration_sec / 60, na.rm = TRUE)) %>%
  mutate(engagement_tier = factor(engagement_tier, levels = tier_order))

p3 <- ggplot(sessions_grouped, aes(x = engagement_tier, y = avg_duration_min, fill = engagement_tier)) +
  geom_col(show.legend = FALSE) +
  scale_x_discrete(limits = tier_order) +
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