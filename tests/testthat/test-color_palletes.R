test_that("color palletes function", {
  library(ggplot2)
  library(woodcut)
  
  airquality |> 
    ggplot2::ggplot(ggplot2::aes(x = Ozone, y = Temp, color = Day)) +
    ggplot2::geom_point(size = 3) +
    woodcut::scale_color_woodcut(discrete = FALSE) +
    woodcut::theme_woodcut()
  
  airquality |> 
    ggplot2::ggplot(ggplot2::aes(x = Ozone, y = Temp, fill = Day)) +
    ggplot2::geom_point(shape = 21, size = 3) +
    woodcut::scale_fill_woodcut(palette = "sorry2botheryou", discrete = FALSE) +
    woodcut::theme_woodcut()

})
