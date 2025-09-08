###I like colors
###Here are some color palletes for plots
###@color.pallete cinema on instagram is the main source of the movie specific palletes
###

library(here)
# par(mfrow=c(3,3))

####
get.out <- c("#2A372A",
             "gray3",
             "orange4",
             "coral4",
             "goldenrod",
             'gainsboro',
             "steelblue4")

# barplot(rep(1,length(get.out)), col=get.out, main = "Get Out")

####
sorry2botheryou <- c("#00004C",
                     '#590059',
                     "#DFBAEA" ,
                     '#0E5A51',
                     "#26506A",
                     '#DFCAAE',
                     '#590000')

# barplot(rep(1,length(sorry2botheryou)), col=sorry2botheryou, main = "Sorry to Bother You")

####
handmaids <- c('#000028',
               '#4B0629',
               '#F7ABA1',
               '#F7D488',
               '#898E78',
               '#57725D',
               '#2C475C')

# barplot(rep(1,length(handmaids)), col=handmaids, main = "Handmaid's Tale")

####
taxi.driver <- c('black', '#BE3019', '#FFC0CB', '#89CF53', '#008080', '#CECE00')

# barplot(rep(1,length(taxi.driver)), col=taxi.driver, main = "Taxi Driver")

###
rando <- c(
  "darkcyan",
  "#B4B0C6",
  "mediumorchid4",
  "darkolivegreen",
  "deeppink4",
  "#C2C6B0",
  "#3a2716",
  "black",
  "#e09999",
  "#643E3E"
)

# barplot(rep(1,length(rando)), col=rando, main = "Rando")# barplot(rep(1,length(rando)), col=rando, main = "Rando")

###
earthy.forest <- c('#5a8b5d', "#bec991", '#907350', '#5f8971', '#36563e')

# barplot(rep(1,length(earthy.forest)), col=earthy.forest, main = "earthy.forest")

###
earthy.blueyellow <- c('#a0522d', "#90877a", '#c4c237', '#009999', '#00cc99')#'#474542',

# barplot(rep(1,length(earthy.blueyellow)), col=earthy.blueyellow, main = "earthy.blueyellow")

###
bluepurp <- c('#000033', "#104a65", '#f4ba32', '#cccbc1', '#770a35')

#barplot(rep(1,length(bluepurp)), col=bluepurp, main = "bluepurp")

###
itv.pv <-  c(
    "#2E6E6E", # teal
    "#516E8E", # slate blue
    "#8E83A8", # dusty purple
    "#B3843C", # ochre
    "#6F855B", # sage
    "#7E6A5C", # earthy rose-brown
    "#707070", # neutral gray
    "#D2C8B6"  # pale sand
)

earth_cb <- earth_muted_purple <- c(
  "#4B3B31", # soil
  "#7A5E43", # clay
  "#6C7A55", # moss
  "#8D9C7A", # sage
  "#A89E8D", # stone
  "#8B6D88", # heather
  "#A38FA3", # dusty plum
  "#E0DBD1"  # ash
)

earth_teal_ochre <- c(
  "#556B2F", # forest moss
  "#7A8450", # olive leaf
  "#A0A97A", # sagebrush
  "#C2B970", # dry grass
  "#5F7F76", # river teal
  "#7E8C8C", # slate gray
  "#B2B6AA", # cloud stone
  "#E1DCCF"  # pale sand
)


#barplot(rep(1,length(bluepurp)), col=bluepurp, main = "bluepurp")

## As a list
.woodcut_palettes <- list(
  "bluepurp" = bluepurp,
  "earth.blueyellow" = earthy.blueyellow,
  "earthy.forest" = earthy.forest,
  "rando" = rando, 
  "get.out" = get.out, 
  "sorry2botheryou" = sorry2botheryou, 
  "taxi.driver" = taxi.driver, 
  "handmaids" = handmaids, 
  "itv.pv" = itv.pv,
  "earth_cb" = earth_cb, 
  "earth_teal_cb" = earth_teal_ochre
)

save(
  get.out,
  sorry2botheryou,
  handmaids,
  taxi.driver,
  rando,
  earthy.forest,
  earthy.blueyellow,
  bluepurp,
  itv.pv,
  earth_cb, 
  earth_teal_ochre,
  .woodcut_palettes,
  file = here('data', 'color.palletes.rda')
)

