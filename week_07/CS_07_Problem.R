# import packages
library(spData)
library(ggplot2)
# load world data
data(world)
# copy the code from case study introduction website
# want to make a figure illustrating the distribution of GDP per capita 
# for all countries within each continent
ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)
# ask for help by run reprex to generate the reproducible example
# and put the content on github
# before run reprex, you need to copy the above code first
# note that after you run reprex, you don't need to copy the content in Viewer again
# the content already on your clipboard
library(reprex)
reprex(venue = "gh")