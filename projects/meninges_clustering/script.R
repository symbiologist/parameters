library(tidyverse)
library(googledrive)
library(googlesheets4)
options(httr_oob_default=TRUE)

# Copy plots
current_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)

source_params <- '/media/data7/dwu/tbi/analysis/meninges/scrna/output/06_clustering_parameters/parameters.tsv'
source_plots <- '/media/data7/dwu/tbi/analysis/meninges/scrna/output/06_clustering_parameters/plots'
dest <- file.path(current_dir, 'plots')
dir.create(dest, showWarnings = FALSE, recursive = TRUE)

file.copy(from = source_params,
          to = file.path(current_dir, 'parameters.tsv'),
          overwrite = TRUE)

file.copy(from = list.files(source_plots, full.names = TRUE),
          to = dest,
          overwrite = TRUE)

# Upload parameters to Google sheet

#drive_find(pattern = 'Overarching Plan: human neural lncRNA', type = 'spreadsheet')
ss <- drive_get('TBI Manuscript')

### Write to googlesheets
parameters <- read_tsv(file.path(current_dir, 'parameters.tsv'))
write_sheet(parameters, ss = ss, sheet = 'umap')

## Add image to googlesheets
# =image(concatenate("https://raw.githubusercontent.com/symbiologist/parameters/main/projects/meninges_clustering/plots/", A2, ".png"))

