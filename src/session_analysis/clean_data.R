library(tidyverse)

# read data
sessions <- read.csv("../data/raw/sessions.csv")

# clean data
sessions_clean <- sessions %>%
  filter(!is.na(session_id)) %>%
  distinct() %>%
  select(-matches("name|first_name|last_name", ignore.case = TRUE))

# save output
write_csv(sessions_clean, "../data/raw/sessions_cleaned.csv")
print("done cleaning")