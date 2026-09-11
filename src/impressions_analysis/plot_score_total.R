library(tidyverse)

impressions <- read_csv("data/impressions_clean.csv")

ggplot(impressions, aes(x = score_total)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Distribution of total ranking scores",
    x = "Total ranking score",
    y = "Count"
  ) +
  theme_minimal()

ggsave("figures/score_total.png")