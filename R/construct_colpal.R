# color palette
#' Construct color palette for continuous or discrete data
#'
#' @param cols Earth tones, soft tones, etc.
#' @param type Discrete or continuous
#'
#' @returns Color palette vector
#' @export
#' 
#' @importFrom grDevices colorRampPalette

colpal_proj <- function(cols = c("earth", "soft"),
                        type = c("discrete", "continuous")) {
  cols <- match.arg(cols)
  type <- match.arg(type)
  ct <- paste0(cols, "_", type)
  
  cols <- switch (
    ct,
    earth_discrete = c(
      "#e0c185",
      "#8a9a5b",
      "#c5663e",
      "#7ca8c8",
      "#9d7fbf",
      "#587b59",
      "#e1c65b"
    ),
    earth_continuous = colorRampPalette(c("#587b59", "#c5663e", "#e1c65b")),
    
    soft_discrete = c("#b4b4b4", # neutral gray
                      "#91b3bc", # dusty blue
                      "#bdb6d3", # soft violet
                      "#dfc59d", # pale tan
                      "#f6e7a1"),# bright butter yellow,
    soft_continuous = colorRampPalette(c(
      "#b4b4b4", "#91b3bc", "#bdb6d3", "#dfc59d", "#f6e7a1"
    ))
  )
  return(cols)
}

#' Fetch color palettes
#'
#' @param palette Palette name
#' @param reverse Reverse the order of colors
#'
#' @returns A function that takes an integer n and returns n colors from the specified palette
#' @export 

fetch_pal <- function(palette = c("bluepurp", 
                                  "earthyby",
                                  "forest",
                                  "get.out",
                                  "handmaids", 
                                  "rando", 
                                  "sorry2botheryou", 
                                  "taxi.driver", 
                                  "itv.pv"), reverse = FALSE) {
  
  pal <- match.arg(palette)
  
  cols <- switch(pal, 
                 "bluepurp" = aes::bluepurp,
                 "earthyby" = aes::earthy.blueyellow,
                 "forest" = aes::earthy.forest,
                 "get.out" = aes::get.out,
                 "handmaids" = aes::handmaids,
                 "rando" = aes::rando,
                 "sorry2botheryou" = aes::sorry2botheryou,
                 "taxi.driver" = aes::taxi.driver,
                 "itv.pv" = aes::itv.pv
                 )
  
  if (is.null(cols)) stop("Palette not found. Options are: ",
                          c("bluepurp", 
                            "earthyby",
                            "forest",
                            "get.out",
                            "handmaids", 
                            "rando", 
                            "sorry2botheryou", 
                            "taxi.driver", 
                            "itv.pv"), 
                          collapse = ", ")
  
  if (reverse) cols <- rev(cols)
  function(n) {
    if (n <= length(cols)) cols[seq_len(n)]
    else grDevices::colorRampPalette(cols)(n)
  }
}


#' Discrete color palettes for ggplot2 figures
#'
#' @param palette Palette name
#' @param discrete Boolean for discrete or continuous
#' @param reverse Reverse the order of colors
#' @param na.value Color for NA values
#' @param ... Additional arguments passed to ggplot2 functions
#'
#' @returns Scale functions for ggplot2
#' @export
#' @rdname scale_color_bean

scale_color_bean <- function(palette = "earthyby", discrete = TRUE,
                           reverse = FALSE, na.value = "grey80", ...) {
  
  pal <- fetch_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("colour",
                            palette = pal, na.value = na.value, ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = pal(256),
                                    na.value = na.value, ...)
  }
}

#' Discrete fill palettes for ggplot2 figures
#' 
#' @param palette Palette name
#' @param discrete Boolean for discrete or continuous
#' @param reverse Reverse the order of colors
#' @param na.value Color for NA values
#' @param ... Additional arguments passed to ggplot2 functions
#'
#' @returns Scale functions for ggplot2
#'
#' @export
#' @rdname scale_color_bean

scale_fill_bean <- function(palette = "earthyby", discrete = TRUE,
                          reverse = FALSE, na.value = "grey80", ...) {
  
  pal <- fetch_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("my_", palette),
                            palette = pal, na.value = na.value, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256),
                                  na.value = na.value, ...)
  }
}
