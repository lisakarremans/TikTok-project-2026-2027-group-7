library(tidyverse)

impressions <- read_csv("../data/raw/impressions_clean.csv")

ggplot(impressions, aes(x = score_category_match, y = score_total)) +
  geom_point() +
  labs(
    title = "Category match and total ranking score",
    x = "Category match score",
    y = "Total ranking score"
  ) +
  theme_minimal()

ggsave("impressions_analysis/figures/category_match.png")