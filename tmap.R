library(sf)
library(tmap)
library(dplyr)
library(stringr)
library(viridis)



scot <- st_read("SG_SIMD_2016.shp")
colnames(scot) <- colnames(scot) %>% str_to_lower()
highland <- filter(scot,laname == "Highland")


#replicate plot from previous blog post:

quint <- tm_shape(highland) +
          tm_fill(col = "quintile",
          #breaks = seq(0,5, by=1),
          palette = viridis(n=5, direction = -1,option = "C"),
          fill.title = "Quintile",
          title = "SIMD 2016 - Highland Council Area by Quintile")

#save_tmap(quint,"tmap Highland SIMD Quintile.png")

quint # plot

ttm() #switch between static and interactive - this will use interactive
quint # or use last_map()
# in R Studio you will find leaflet map in your Viewer tab
