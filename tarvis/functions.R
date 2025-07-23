summarize_median_iqr <- function(data, variable) {
  data %>%
    group_by(group) %>%
    summarize(
      median = median(.data[[variable]], na.rm = TRUE),
      IQR = IQR(.data[[variable]], na.rm = TRUE),
      .groups = "drop"
    )
}

summary_stats <- function(x) {
  if (!is.numeric(x)) stop("Input must be numeric")
  
  stats <- list(
    mean = mean(x, na.rm = TRUE),
    sd = sd(x, na.rm = TRUE),
    range = range(x, na.rm = TRUE)
  )
  
  return(stats)
}