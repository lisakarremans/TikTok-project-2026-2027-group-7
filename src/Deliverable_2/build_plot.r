# Load the data
users_clean <- read.csv("../../data/raw/users_clean.csv")

# Create plot 1
library(ggplot2)
plot_1 <- ggplot(data = users_clean, aes(x = baseline_login, y = base_videos_watched_mean)) +
  geom_point(color = "blue") +
  labs(
    title = "Login frequency vs videos watched",
    x = "Login frequency",
    y = "Mean videos watched"
  )

# Create folder to save the plots
dir.create("plots", showWarnings = FALSE)

# Save plot 1
ggsave("plots/plot_1.png", plot = plot_1, width = 8, height = 6)
