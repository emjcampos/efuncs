# sherbert colors
sherbert_colors <- c(
  `dark orange`  = "#f66e00",
  `light orange` = "#f99003",
  `yellow`       = "#ffeed0",
  `mint`         = "#94eac6",
  `light green`  = "#66ddaa",
  `green`        = "#28bb94"
)

sherbert_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(sherbert_colors)

  sherbert_colors[cols]
}

sherbert_palettes <- list(
  `main`  = sherbert_cols("dark orange", "light orange", "yellow", "mint", "light green", "green")
)

#' Return function to interpolate an sherbert color palette
#'
#' @param palette Character name of palette in sherbert_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
sherbert_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- sherbert_palettes[[palette]]

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
scale_color_sherbert <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- sherbert_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("sherbert_", palette), palette = pal, ...)
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
scale_fill_sherbert <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- sherbert_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("sherbert_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
