library(tidyverse)

impressions <- read_csv("data/impressions_clean.csv")

ggplot(impressions, aes(x = score_category_match, y = score_total)) +
  geom_point() +
  labs(
    title = "Category match and total ranking score",
    x = "Category match score",
    y = "Total ranking score"
  ) +
  theme_minimal()

ggsave("figures/category_match.png")