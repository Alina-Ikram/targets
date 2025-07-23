tar_target(plot_rest, plot(supraclavicular_data, "vps_rest"))

plot <- function(data, variable) {
  data %>%
    group_by(group) %>%
    plot(variable)
}