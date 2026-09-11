library(tidyverse)

impressions <- read_csv("data/impressions_clean.csv")

ggplot(impressions, aes(x = score_creator_match, y = score_total)) +
  geom_point() +
  labs(
    title = "Creator match and total ranking score",
    x = "Creator match score",
    y = "Total ranking score"
  ) +
  theme_minimal()

ggsave("figures/creator_match.png")