# Download the data
data_url <- paste0("https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/users.csv")
download.file(data_url, "data/raw/users.csv", mode = "wb")
list.files()
