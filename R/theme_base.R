# custom base plot theme
#' Base plotting theme
#'
#' @param font_family Font type
#' @param font_size General font size
#' @param base_color General color of titles and labels
#' @param axis_line_color Color of axis lines
#' @param panel_border_color Color of panels
#' @param panel_fill Color filling the panels
#' @param facet_strip_fill Color of the panel facet labels
#' @param legend_key_height Height of the legend with plot
#'
#'
#' @importFrom ggplot2 theme element_text element_rect element_line unit margin element_blank
#' @returns Themed ggplot
#' @export
#' 

theme_base  <- function(
  font_family = "Helvetica Neue",
  font_size = 24,
  base_color = "#3f3f3f",
  axis_line_color = "black",
  panel_border_color = "black",
  panel_fill = "white",
  facet_strip_fill = "white",
  legend_key_height = unit(3, "cm")
) {
  theme(
    text = element_text(family = font_family, size = font_size, color = base_color),
    title = element_text(family = font_family, size = font_size, color = base_color),
    
    panel.background = element_rect(fill = panel_fill, color = panel_border_color),
    panel.border = element_rect(color = panel_border_color, fill = NA, linewidth = 1.5),
    
    panel.grid = element_blank(),
    
    axis.line = element_line(color = axis_line_color, linewidth = 0.9),
    axis.ticks = element_line(color = axis_line_color),
    axis.text = element_text(color = axis_line_color),
    axis.title = element_text(color = axis_line_color, margin = margin(t = 10, r = 10)),
    
    strip.background = element_rect(fill = facet_strip_fill),
    strip.text.x = element_text(
      hjust = 0.5,
      color = axis_line_color,
      size = font_size,
      face = "bold"
    ),
    
    panel.spacing = unit(1, "lines"),
    
    legend.background = element_blank(),
    legend.key = element_blank(),
    legend.justification = "center",
    legend.key.height = unit(legend_key_height, "cm"),
    legend.key.width = unit(1.2, "cm"),
    plot.title = element_text(face = "bold")
  )
}
