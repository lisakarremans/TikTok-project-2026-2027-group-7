library(tidyverse)
library(here)

impressions <- read_csv(
  here("data", "raw", "impressions_clean.csv")
)
model1 <- lm(
  feed_rank ~ score_satiation_penalty,
  data = impressions
)

summary(model1)

model2 <- lm(
  feed_rank ~ score_satiation_penalty + score_category_match + score_creator_match,
  data = impressions
)

summary(model2)

ggplot(
  impressions,
  aes(x = score_satiation_penalty, y = feed_rank)
) +
  geom_point(alpha = 0.2) +
  labs(
    title = "Satiation penalty and feed rank",
    x = "Satiation penalty",
    y = "Feed rank"
  ) +
  theme_minimal()

dir.create(
  here("src", "regression_analysis", "output"),
  showWarnings = FALSE
)

ggsave(
  here("src", "regression_analysis", "output", "regression_plot.png"),
  width = 7,
  height = 4
)