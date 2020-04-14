# disney colors
disney_colors <- c(
  `yellow`      = "#fbbe4f",
  `lightgreen` = "#76d0c0",
  `green`      = "#1ab28a",
  `purple`  = "#746bab",
  `blue`    = "#4a62d8"
)

disney_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(disney_colors)

  disney_colors[cols]
}

disney_palettes <- list(
  `main`  = disney_cols("yellow", "lightgreen", "green", "purple", "blue")
)

#' Return function to interpolate an disney color palette
#'
#' @param palette Character name of palette in disney_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
disney_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- disney_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' Color scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_disney <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- disney_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("disney_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_disney <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- disney_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("disney_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
