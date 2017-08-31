
library(tmap)
library(tmaptools)
library(viridis)


scot <- read_shape("SG_SIMD_2016.shp", as.sf = TRUE)
highland <- (scot[scot$LAName=="Highland", ])


#replicate plot from previous blog post:

quint <- tm_shape(highland) +
  tm_fill(col = "Quintile",
          palette = viridis(n=5, direction = -1,option = "C"),
          fill.title = "Quintile",
          title = "SIMD 2016 - Highland Council Area by Quintile")

save_tmap(quint,"tmap Highland SIMD Quintile.png")

quint # plot

ttm() #switch between static and interactive - this will use interactive
quint # or use last_map()
# in R Studio you will find leaflet map in your Viewer tab

ttm() # return to plotting


small_mult<- tm_shape(highland) +
  tm_fill(col = c("IncRank","EmpRank","HlthRank","EduRank",
                  "GAccRank","CrimeRank","HouseRank","Rank"),
          palette = viridis(n=5, direction = -1,option = "C"),
          title=c("Income Rank", "Employment Rank","Health Rank","Education Rank",
                  "General Access Rank","Crime Rank", "Housing Rank","Overall Rank"))
small_mult

save_tmap(small_mult,"tmap Highland SIMD All Domains Ranked.png",width=3878, height=2162)
         
