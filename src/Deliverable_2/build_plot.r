# Create a plot and save it as png
library(ggplot2)
plot <- ggplot(data = users_clean, aes(x = baseline_login, y = base_videos_watched_mean)) +
  geom_point(color = "blue") +
  labs(
title = "Login frequency vs videos watched",
x = "Login frequency",
y = "Mean videos watched"
  )
dir.create("/src/Deliverable_2/plots", showWarnings = FALSE)
ggsave("plots/plot_1.png", plot = plot, width = 8, height = 6)