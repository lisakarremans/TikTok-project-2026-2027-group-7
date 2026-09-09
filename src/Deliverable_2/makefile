plots/plot_1.png: build_plot.r ../../data/raw/users_clean.csv
	Rscript build_plot.r

../../data/raw/users_clean.csv: clean_data.R ../../data/raw/users.csv
	Rscript clean_data.R

../../data/raw/users.csv: load_data.r
	Rscript load_data.R
