library(spData)
library(ggplot2)
library(reprex)

data(world)


ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)

reprex(venue = "gh")


ggplot(world,aes(x=gdpPercap, color = continent, fill = continent))+
  geom_density(alpha=0.5,color=F) +
  theme(legend.position = "bottom")

# 我就写在issue里面就行
# 注释多一点
# 遇到的问题，然后我怎么解决了，其实就一个问题，就是他已经already复制在里面了
# issue和解决方式都写在里面