all: ../data/raw/video_view.csv users_analysis/plots/plot_1.png impressions_analysis/figures/source_mix.png impressions_analysis/figures/score_total.png impressions_analysis/figures/category_match.png impressions_analysis/figures/creator_match.png impressions_analysis/figures/satiation_penalty.png session_analysis/output/plot_1_duration_dist.png session_analysis/output/plot_2_duration_vs_videos.png session_analysis/output/plot_3_engagement_groups.png watch_events_analysis/Plots/action_counts.png

../data/raw/video_view.csv: download_video_view.R
	Rscript download_video_view.R
	
../data/raw/users.csv: users_analysis/load_data.r
	Rscript users_analysis/load_data.R

../data/raw/users_clean.csv: users_analysis/clean_data.R ../data/raw/users.csv
	Rscript users_analysis/clean_data.R

users_analysis/plots/plot_1.png: users_analysis/build_plot.r ../data/raw/users_clean.csv
	Rscript users_analysis/build_plot.r

../data/raw/impressions.csv:
	Rscript impressions_analysis/download_data.R

../data/raw/impressions_clean.csv: impressions_analysis/clean_data.R ../data/raw/impressions.csv
	Rscript impressions_analysis/clean_data.R

impressions_analysis/figures/source_mix.png: impressions_analysis/plot_source_mix.R ../data/raw/impressions_clean.csv
	Rscript impressions_analysis/plot_source_mix.R

impressions_analysis/figures/score_total.png: impressions_analysis/plot_score_total.R ../data/raw/impressions_clean.csv
	Rscript impressions_analysis/plot_score_total.R

impressions_analysis/figures/category_match.png: impressions_analysis/plot_category_match.R ../data/raw/impressions_clean.csv
	Rscript impressions_analysis/plot_category_match.R

impressions_analysis/figures/creator_match.png: impressions_analysis/plot_creator_match.R ../data/raw/impressions_clean.csv
	Rscript impressions_analysis/plot_creator_match.R

impressions_analysis/figures/satiation_penalty.png: impressions_analysis/plot_satiation_penalty.R ../data/raw/impressions_clean.csv
	Rscript impressions_analysis/plot_satiation_penalty.R

../data/raw/sessions_cleaned.csv: session_analysis/download_and_clean.R
	Rscript session_analysis/download_and_clean.R

session_analysis/output/plot_1_duration_dist.png: session_analysis/visualize.R ../data/raw/sessions_cleaned.csv
	Rscript session_analysis/visualize.R

session_analysis/output/plot_2_duration_vs_videos.png: session_analysis/visualize.R ../data/raw/sessions_cleaned.csv
	Rscript session_analysis/visualize.R

session_analysis/output/plot_3_engagement_groups.png: session_analysis/visualize.R ../data/raw/sessions_cleaned.csv
	Rscript session_analysis/visualize.R

watch_events_analysis/Plots/action_counts.png: watch_events_analysis/week3.R
	Rscript watch_events_analysis/week3.R

clean:
	rm -rf watch_events_analysis/Plots/*.png