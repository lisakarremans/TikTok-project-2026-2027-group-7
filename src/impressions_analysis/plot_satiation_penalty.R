library(tidyverse)

impressions <- read_csv("data/impressions_clean.csv")

ggplot(impressions, aes(x = score_satiation_penalty)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Distribution of satiation penalty",
    x = "Satiation penalty",
    y = "Count"
  ) +
  theme_minimal()

ggsave("figures/satiation_penalty.png")