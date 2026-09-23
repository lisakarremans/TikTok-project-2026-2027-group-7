data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/users.csv"

download.file(data_url, "../data/raw/users.csv", mode = "wb")
list.files()

data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/impressions.csv"

download.file(data_url, "../data/raw/impressions.csv", mode = "wb")
list.files()

data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/sessions.csv"

download.file(data_url, "../data/raw/sessions.csv", mode = "wb")
list.files()

data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/watch_events.csv"

download.file(data_url, "../data/raw/watch_events.csv", mode = "wb")
list.files()