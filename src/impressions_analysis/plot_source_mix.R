library(tidyverse)

if (!dir.exists("impressions_analysis/figures")) {
  dir.create("impressions_analysis/figures", recursive = TRUE)
}

impressions <- read_csv("../data/raw/impressions_clean.csv")

ggplot(impressions, aes(x = source_bucket)) +
  geom_bar() +
  labs(
    title = "Mix of feed sources",
    x = "Feed source",
    y = "Count"
  ) +
  theme_minimal()

ggsave("impressions_analysis/figures/source_mix.png")