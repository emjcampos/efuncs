#' ggplot theme
#'
#' @export
#' @import ggplot2
#'
theme_emilie <- function() {
  extrafont::loadfonts(device = "pdf", quiet = TRUE)

  ggthemes::theme_foundation(
    base_size = 12,
    base_family = "Arial Narrow"
  ) +
    theme(
      rect = element_rect(fill = "#F0F0F0",
                          linetype = 0,
                          colour = NA),
      text = element_text(color = "grey 25"),
      panel.grid = element_blank(),
      plot.title = element_text(size = 18,
                                face = "bold",
                                hjust = 0),
      plot.subtitle = element_text(size = 14),
      plot.caption = element_text(family = "sans",
                                  face = "italic",
                                  size = 8,
                                  color = "grey65"),
      plot.margin = unit(c(1, 1, 1, 1), "lines"),
      strip.text = element_text(size = 11),
      strip.background = element_rect(),
      axis.ticks = element_blank(),
      axis.title = element_text(size = 11, color = "grey50"),
      axis.text = element_text(size = 8),
      legend.background = element_rect(),
      legend.position = "top",
      legend.direction = "horizontal",
      legend.box = "vertical"
    )
}
