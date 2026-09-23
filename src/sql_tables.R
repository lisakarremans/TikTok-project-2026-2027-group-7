library(DBI)
library(RSQLite)
library(tidyverse)

con <- dbConnect(SQLite(), dbname = "data/raw/tiktok_students.sqlite")
interactions <- dbGetQuery(con, "SELECT * FROM interactions") %>% tibble()
dbDisconnect(con)
print(interactions)

con <- dbConnect(SQLite(), dbname = "data/raw/tiktok_students.sqlite")
videos <- dbGetQuery(con, "SELECT
  video_id,
  video_length_sec,
  COUNT(*) AS videos_amount
FROM videos
GROUP BY creator_id
ORDER BY videos_amount DESC;") %>% tibble()
dbDisconnect(con)
print(videos)
