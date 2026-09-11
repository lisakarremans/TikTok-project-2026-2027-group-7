dir.create("data", showWarnings = FALSE)

data_url <- "https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/project/coaching_2_data/impressions.csv"

if (!file.exists("data/impressions.csv")) {
  download.file(data_url, "data/impressions.csv")
}
