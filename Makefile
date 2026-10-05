all: summary_output/TikTok_video_view_summary.pdf

summary_output/TikTok_video_view_summary.pdf: TikTok_video_view_summary.qmd
	quarto render TikTok_video_view_summary.qmd --to pdf --output-dir summary_output