library(tidyverse)

impressions <- read_csv("data/impressions_clean.csv")

ggplot(impressions, aes(x = source_bucket)) +
  geom_bar() +
  labs(
    title = "Mix of feed sources",
    x = "Feed source",
    y = "Count"
  ) +
  theme_minimal()

ggsave("figures/source_mix.png")