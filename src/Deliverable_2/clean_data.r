# Clean the dataset
library(dplyr)
library(tidyverse)
users <- read.csv("data/raw/users.csv")
users_clean <- users %>%
  select(-user_name, -user_handle)