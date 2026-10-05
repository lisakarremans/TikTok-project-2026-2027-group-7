all: summary.pdf

data/raw/video_view.csv: src/download_video_view.R
	cd src && Rscript download_video_view.R

data/raw/users.csv data/raw/impressions.csv data/raw/sessions.csv data/raw/watch_events.csv: src/download_data.R
	cd src && Rscript download_data.R

data/raw/users_clean.csv: src/users_analysis/clean_data.R data/raw/users.csv
	cd src && Rscript users_analysis/clean_data.R

src/users_analysis/plots/plot_1.png: src/users_analysis/build_plot.r data/raw/users_clean.csv
	cd src && Rscript users_analysis/build_plot.r

data/raw/impressions_clean.csv: src/impressions_analysis/clean_data.R data/raw/impressions.csv
	cd src && Rscript impressions_analysis/clean_data.R

src/impressions_analysis/figures/source_mix.png: src/impressions_analysis/plot_source_mix.R data/raw/impressions_clean.csv
	cd src && Rscript impressions_analysis/plot_source_mix.R

src/impressions_analysis/figures/score_total.png: src/impressions_analysis/plot_score_total.R data/raw/impressions_clean.csv
	cd src && Rscript impressions_analysis/plot_score_total.R

src/impressions_analysis/figures/category_match.png: src/impressions_analysis/plot_category_match.R data/raw/impressions_clean.csv
	cd src && Rscript impressions_analysis/plot_category_match.R

src/impressions_analysis/figures/creator_match.png: src/impressions_analysis/plot_creator_match.R data/raw/impressions_clean.csv
	cd src && Rscript impressions_analysis/plot_creator_match.R

src/impressions_analysis/figures/satiation_penalty.png: src/impressions_analysis/plot_satiation_penalty.R data/raw/impressions_clean.csv
	cd src && Rscript impressions_analysis/plot_satiation_penalty.R

data/raw/sessions_cleaned.csv: src/session_analysis/clean_data.R data/raw/sessions.csv
	cd src && Rscript session_analysis/clean_data.R

src/session_analysis/output/plot_1_duration_dist.png: src/session_analysis/visualize.R data/raw/sessions_cleaned.csv
	cd src && Rscript session_analysis/visualize.R

src/session_analysis/output/plot_2_duration_vs_videos.png: src/session_analysis/visualize.R data/raw/sessions_cleaned.csv
	cd src && Rscript session_analysis/visualize.R

src/session_analysis/output/plot_3_engagement_groups.png: src/session_analysis/visualize.R data/raw/sessions_cleaned.csv
	cd src && Rscript session_analysis/visualize.R

src/watch_events_analysis/Plots/action_counts.png: src/watch_events_analysis/clean_data_build_plots.R data/raw/watch_events.csv
	cd src && Rscript watch_events_analysis/clean_data_build_plots.R

src/regression_analysis/output/regression_plot.png: src/regression_analysis/regression_analysis.R data/raw/impressions_clean.csv
	Rscript src/regression_analysis/regression_analysis.R

summary.pdf: summary.qmd data/raw/video_view.csv \
	data/raw/impressions_clean.csv \
	src/users_analysis/plots/plot_1.png \
	src/impressions_analysis/figures/source_mix.png \
	src/impressions_analysis/figures/score_total.png \
	src/impressions_analysis/figures/category_match.png \
	src/impressions_analysis/figures/creator_match.png \
	src/impressions_analysis/figures/satiation_penalty.png \
	src/session_analysis/output/plot_1_duration_dist.png \
	src/session_analysis/output/plot_2_duration_vs_videos.png \
	src/session_analysis/output/plot_3_engagement_groups.png \
	src/watch_events_analysis/Plots/action_counts.png \
	src/regression_analysis/output/regression_plot.png
	quarto render summary.qmd --to pdf