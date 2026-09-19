library(tidyverse)

# make sure data directory exists
if (!dir.exists("../../data")) {
  dir.create("../../data", recursive = TRUE)
}

# download sessions data
url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/sessions.csv"
raw_path <- "../../data/sessions.csv"

if (!file.exists(raw_path)) {
  download.file(url, destfile = raw_path, mode = "wb")
}

# read data
sessions <- read_csv(raw_path)

# clean data
sessions_clean <- sessions %>%
  filter(!is.na(session_id)) %>%
  distinct() %>%
  select(-matches("name|first_name|last_name", ignore.case = TRUE))

# save output
write_csv(sessions_clean, "../../data/sessions_cleaned.csv")
print("done cleaning")