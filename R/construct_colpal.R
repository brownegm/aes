

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


#' Color scale (Continuous or Discrete) for project
#'
#' @param cols Earth tones, soft tones, etc.
#' @param type Continuous or discrete
#' @param n How many colors to return (only for continuous)
#'
#' @returns Color scale function for ggplot2
#' @export
#' 
#' @importFrom ggplot2 scale_color_manual scale_color_gradientn

scale_color_project <- function(cols = c("earth", "soft"),
                        type = c("discrete", "continuous"), n = NULL) {
  cols <- match.arg(cols)
  type <- match.arg(type)
  ct <- paste0(cols, "_", type)
  
  colpal <- colpal_proj(cols, type)
  
  if (type == "discrete") {
    return(scale_color_manual(values = colpal))
  } else {
    return(scale_color_gradientn(colors = colpal))
  }
}
