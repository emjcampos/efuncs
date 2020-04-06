#' Emilie's ggplot theme
#'
#' @return
#' @export
#'
theme_emilie <- function () {
  theme_minimal(base_size = 12, base_family = "Avenir") %+replace%
    theme(
      panel.background  = element_blank(),
      plot.background = element_rect(fill = "gray96", colour = NA),
      legend.background = element_rect(fill = "transparent", colour = NA),
      legend.key = element_rect(fill = "transparent", colour = NA)
    )
}
