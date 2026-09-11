all: figures/source_mix.png figures/score_total.png figures/category_match.png figures/creator_match.png figures/satiation_penalty.png

data/impressions.csv:
	Rscript download_data.R

data/impressions_clean.csv: clean_data.R data/impressions.csv
	Rscript clean_data.R

figures/source_mix.png: plot_source_mix.R data/impressions_clean.csv
	Rscript plot_source_mix.R

figures/score_total.png: plot_score_total.R data/impressions_clean.csv
	Rscript plot_score_total.R

figures/category_match.png: plot_category_match.R data/impressions_clean.csv
	Rscript plot_category_match.R

figures/creator_match.png: plot_creator_match.R data/impressions_clean.csv
	Rscript plot_creator_match.R

figures/satiation_penalty.png: plot_satiation_penalty.R data/impressions_clean.csv
	Rscript plot_satiation_penalty.R