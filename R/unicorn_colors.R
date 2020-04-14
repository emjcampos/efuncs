# unicorn colors
unicorn_colors <- c(
  `blue`      = "#219bc3",
  `lightblue` = "#b2d3e1",
  `pink`      = "#f2cfda",
  `darkpink`  = "#c66aab",
  `purple`    = "#68417f"
)

#' Title
#'
#' @param ... extra arguments to choose colors
#'
#' @export
unicorn_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(unicorn_colors)

  unicorn_colors[cols]
}

unicorn_palettes <- list(
  `main`  = unicorn_cols("blue", "lightblue", "pink", "darkpink", "purple"),
  `light`  = unicorn_cols("lightblue", "pink")
)

#' Return function to interpolate an unicorn color palette
#'
#' @param palette Character name of palette in unicorn_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @importFrom grDevices colorRampPalette
#' @export
unicorn_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- unicorn_palettes[[palette]]

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
#' @export
scale_color_unicorn <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- unicorn_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("unicorn_", palette), palette = pal, ...)
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
#' @export
scale_fill_unicorn <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- unicorn_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("unicorn_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
