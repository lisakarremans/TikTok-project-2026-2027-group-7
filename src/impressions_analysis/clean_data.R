library(tidyverse)

impressions <- read_csv("data/impressions.csv")

impressions_clean <- impressions %>%
  distinct(impression_id, .keep_all = TRUE)

write_csv(impressions_clean, "data/impressions_clean.csv")