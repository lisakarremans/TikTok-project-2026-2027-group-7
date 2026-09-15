library(tidyverse)

if (!dir.exists("../../data")) {
  dir.create("../../data", recursive = TRUE)
}

data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/sessions.csv"
raw_path <- "../../data/sessions.csv"

if (!file.exists(raw_path)) { 
  download.file(data_url, destfile = raw_path, mode = "wb")
}

sessions <- read_csv(raw_path)

sessions_clean <- sessions %>%
  drop_na() %>%
  distinct() %>%
  select(-matches("name|first_name|last_name", ignore.case = TRUE))

clean_path <- "../../data/sessions_cleaned.csv"
write_csv(sessions_clean, clean_path)

print("Data download en cleaning voltooid!")