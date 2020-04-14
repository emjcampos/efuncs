#' ggplot theme
#'
#' @export
#' @import ggplot2
#'
theme_emilie_dark_void <- function(base_size = 11, base_family = "Montserrat") {
  theme_void(
    base_size = base_size,
    base_family = base_family
  ) %+replace%
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.background = element_rect(fill = "#1c1c1c"),
      plot.title = element_text(
        size = 19,
        face = 'bold',
        hjust = 0,
        vjust = 3,
        color = "light grey"
      ),
      plot.margin = margin(.8, 1, .5, 1, unit = "cm"),
      plot.subtitle = element_text(
        hjust = 0,
        vjust = 2,
        color = "light grey"
      ),
      plot.caption = element_markdown(
        hjust = .7,
        size = 8,
        color = "light grey"
      ),
      plot.tag.position = c(.95, .7),
      plot.tag = element_markdown(
        size = 10,
        color = "light grey"
      ),
      strip.text = element_text(
        color = "#FFFFFF",
        face = "bold",
        size = 11
      ),
      strip.background = element_rect(size = 8),
      legend.title = element_blank(),
      legend.text = element_text(
        hjust = 0,
        vjust = 0,
        color = "light grey"
      ),
      legend.position = "right",
      complete = FALSE,
      validate = TRUE
    )
}
