test_that("color palletes function", {
  library(ggplot2)
  
  airquality |> 
    ggplot2::ggplot(aes(x = Ozone, y = Temp, color = Day)) +
    geom_point(size = 3) +
    aes::scale_color_bean(discrete = FALSE) +
    aes::theme_base()
  
  airquality |> 
    ggplot2::ggplot(aes(x = Ozone, y = Temp, fill = Day)) +
    geom_point(shape = 21, size = 3) +
    aes::scale_fill_bean(palette = "sorry2botheryou", discrete = FALSE) +
    aes::theme_base()

})
