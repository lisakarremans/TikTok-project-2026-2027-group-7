data_url <- paste0("https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/video_view.csv")
download.file(data_url, "video_view.csv", mode = "wb")
list.files()
