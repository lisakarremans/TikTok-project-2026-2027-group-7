# Load the data
users_clean <- read.csv("../../data/raw/users_clean.csv")

# Library ggplot2
library(ggplot2)

# Create plot 1
# Make plot_1
plot_1 <- ggplot(data = users_clean, aes(x = baseline_login, y = base_videos_watched_mean)) +
  geom_point(color = "blue") +
  labs(
    title = "Login frequency vs videos watched",
    x = "Login frequency",
    y = "Mean videos watched"
  )
# Create folder to save the plots
dir.create("plots", showWarnings = FALSE)
# Save plot 1 as png
ggsave("plots/plot_1.png", plot = plot_1, width = 8, height = 6)

# Create plot 2
# Put all content categories in one dataframe
df <- data.frame(
  category = c(
    "Comedy", "Dance", "BeautyFashion", "Food",
    "FitnessSports", "Gaming", "DIYHome", "Travel",
    "Education", "Pets"
  ),
  score = c(
    mean(users_clean$pref_Comedy),
    mean(users_clean$pref_Dance),
    mean(users_clean$pref_BeautyFashion),
    mean(users_clean$pref_Food),
    mean(users_clean$pref_FitnessSports),
    mean(users_clean$pref_Gaming),
    mean(users_clean$pref_DIYHome),
    mean(users_clean$pref_Travel),
    mean(users_clean$pref_Education),
    mean(users_clean$pref_Pets)
  )
)
# Make plot_2
plot_2 <- ggplot(df, aes(x = category, y = score)) +
  geom_col(fill = "purple") +
  labs(
    title = "Preference score across 10 content categories",
    x = "Content category",
    y = "Preference score"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# Save plot 2 as png
ggsave("plots/plot_2.png", plot = plot_2, width = 7, height = 4)

# Create plot 3
# Make plot_3
plot_3 <- ggplot(users_clean, aes(x = satiation_decay)) +
  geom_density(fill = "orange", alpha = 0.6) +
  labs(
    title = "Density of satiation decay",
    x = "Satiation decay",
    y = "Density"
  )
# Save plot 3 as png
ggsave("plots/plot_3.png", plot = plot_3, width = 10, height = 8)

# Create plot 4
# Make plot_4
plot_4 <- ggplot(users_clean, aes(x = need_interaction)) +
  geom_histogram(bins = 30, fill = "green", color = "white") +
  labs(
    title = "Distribution of need for interaction",
    x = "Need for interaction",
    y = "Count"
  )
# Save plot 4 as png
ggsave("plots/plot_4.png", plot = plot_4, width = 15, height = 10)

