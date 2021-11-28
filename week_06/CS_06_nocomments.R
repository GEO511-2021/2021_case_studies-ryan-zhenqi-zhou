library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

data(world)  #load 'world' data from spData package
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)

world_re <- world %>%
  filter(continent != "Antarctica")
world_re_1 <- as(world_re,"Spatial")

# plot(tmax_monthly)
# head(tmax_monthly)

gain(tmax_monthly) <- 0.1
tmax_annual <- max(tmax_monthly)
names(tmax_annual) <- "tmax"
tmax_annual_1 <- raster::extract(x = tmax_annual,y = world_re_1, fun = max, na.rm =T, small = T, sp = T)
tmax_annual_2 <- st_as_sf(tmax_annual_1)

ggplot(tmax_annual_2) +
  geom_sf(aes(fill = tmax)) +
  coord_sf(label_graticule = "SW", label_axes = "SW") +
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)") +
  theme(legend.position = 'bottom')

Hottest_continents <- tmax_annual_2 %>%
  select(name_long, continent, tmax) %>%
  group_by(continent) %>%
  st_set_geometry(NULL) %>%
  arrange(desc(tmax)) %>%
  top_n(1,tmax)

















