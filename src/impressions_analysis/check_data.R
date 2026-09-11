library(tidyverse)

impressions <- read_csv("data/impressions.csv")

# Check duplicate rows
sum(duplicated(impressions))

# Check duplicate impression IDs
sum(duplicated(impressions$impression_id))

# Check missing values
colSums(is.na(impressions))