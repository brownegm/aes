#' Palettes provided in woodcut package
#' @description List woodcut palettes (and optionally preview)
#' @param names Optional character vector of palette names to return.
#'              If NULL (default), returns all.
#' @param plot If TRUE, draw swatches (default: interactive())
#' @returns Color palette options either as a tibble or list (default) and a plot of the colors (optional)
#' @importFrom tibble tibble
#' @import ggplot2
#' 
#' @export
#' 
woodcut_palettes <- function(names = NULL,
                             plot = interactive()) {
  
  pals_all <- .woodcut_palettes
  # Validate names
  if (is.null(names)) {
    pals <- pals_all
  } else {
    missing <- setdiff(names, names(pals_all))
    if (length(missing) > 0) {
      stop("Palette not found: ", paste(missing, collapse = ", "))
    }
    pals <- pals_all[names]
  }
  
  # Optional preview
  if (isTRUE(plot)) {
    palette = rep(names(pals_all), lengths(pals_all))
    i       = unlist(lapply(pals_all, seq_along))
    col     = unlist(pals_all)
    
    df <- data.frame(
    palette, 
    i, 
    col
    )
    
    print(
      ggplot2::ggplot(df, ggplot2::aes(i, 1, fill = col)) +
        ggplot2::geom_tile() +
        ggplot2::scale_fill_identity() +
        ggplot2::facet_wrap(~ palette, scales = "free_x") +
        ggplot2::theme_void() +
        ggplot2::theme(strip.text = ggplot2::element_text(face = "bold"))
    )
  }
  
  pals
}

