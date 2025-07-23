library(targets)
library(medicaldata)
library(dplyr)
library(here)
# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(data_summary) to view the results.

# Define custom functions and other global objects.
# This is where you write source(\"R/functions.R\")
# if you keep your functions in external scripts.
tar_source("functions.R")
# Set target-specific options such as packages:
# tar_option_set(packages = "utils") # nolint

# End this file with a list of target objects.
list(
  tar_target(
    supraclavicular_data, {
      data("supraclavicular", package = "medicaldata")
      supraclavicular
    }
  ),
  tar_target(summary_rest, summarize_median_iqr(supraclavicular_data, "vps_rest")),
  
  tar_target(
    vps_rest_stats,
    summary_stats(supraclavicular_data$vps_rest)
  )
  
  
)
