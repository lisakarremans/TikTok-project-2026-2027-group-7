library(tidyverse)

impressions <- read.csv("../data/raw/impressions.csv")

impressions_clean <- impressions %>%
  distinct(impression_id, .keep_all = TRUE)

write_csv(impressions_clean, "../data/raw/impressions_clean.csv")