library(tidyverse)

impressions <- read_csv("../data/raw/impressions_clean.csv")

ggplot(impressions, aes(x = score_total)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Distribution of total ranking scores",
    x = "Total ranking score",
    y = "Count"
  ) +
  theme_minimal()

ggsave("impressions_analysis/figures/score_total.png")