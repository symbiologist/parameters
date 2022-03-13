# Copy plots
current_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)

source_plots <- '/media/data7/dwu/tbi/analysis/meninges/scrna/output/08_markers/plots/'
dest <- file.path(current_dir, 'plots')
dir.create(dest, showWarnings = FALSE, recursive = TRUE)

file.copy(from = list.files(source_plots, full.names = TRUE),
          to = dest,
          overwrite = TRUE)

## Add image to googlesheets
# =image(concatenate("https://raw.githubusercontent.com/symbiologist/parameters/main/projects/meninges_clustering/plots/", A2, ".png"))

