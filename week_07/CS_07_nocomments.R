library(spData)
library(ggplot2)
library(tidyverse)
library(reprex)
library(sf)
library(styler)
data(world)


ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)

reprex(venue = "gh")

ggplot(world,aes(x=gdpPercap, color = continent, fill = continent))+
  geom_density(alpha=0.5,color=F) +
  theme(legend.position = "bottom")
