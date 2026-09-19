all: output/plot_1_duration_dist.png output/plot_2_duration_vs_videos.png output/plot_3_engagement_groups.png

../../data/raw/sessions_cleaned.csv: download_and_clean.R
	Rscript download_and_clean.R

output/plot_1_duration_dist.png output/plot_2_duration_vs_videos.png output/plot_3_engagement_groups.png: visualize.R ../../data/raw/sessions_cleaned.csv
	Rscript visualize.R
