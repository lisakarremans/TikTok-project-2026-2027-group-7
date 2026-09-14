# Clean the dataset
library(dplyr)
library(tidyverse)
users <- read.csv("../../data/raw/users.csv")
users_clean <- users %>%
  select(-user_name, -user_handle)
write.csv(users_clean, "../../data/raw/users_clean.csv", row.names = FALSE)