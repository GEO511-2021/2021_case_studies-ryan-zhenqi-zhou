# import packages
library(spData)
library(ggplot2)
# load world data
data(world)
# Solution
# In this figure, we don't need y argument, and we need to change color argument
# to fill argument
# and then add the theme to put the legend position to the bottom
ggplot(world,aes(x=gdpPercap, fill = continent))+
  geom_density(alpha=0.5,color=F) +
  theme(legend.position = "bottom")

library(reprex)
reprex(venue = "gh")