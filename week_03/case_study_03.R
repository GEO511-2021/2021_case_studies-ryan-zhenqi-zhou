 library(gapminder)
 library(ggplot2)
 library(dplyr)
 
 gapminder_new <- gapminder %>% 
   filter(country != "Kuwait") 
 
 ggplot(gapminder_new, aes(lifeExp, gdpPercap, size = pop/100000, color = continent)) +
   geom_point() +
   scale_y_continuous(trans = "sqrt") +
   facet_wrap(~year, nrow = 1) +
   labs(x = "Life Expectancy",y = "GDP per capita",
        title = "Wealth and life expectancy through time") +
   theme_bw()
   
gapminder_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))
     
ggplot(gapminder, aes(year, gpdPercap, size = pop/100000, color = continent)) +
  geom_line() +
  geom_point() +
  geom_line(gapminder_continent) +
  geom_point(gapminder_continent) +
  facet_wrap(~continent, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  theme_bw()
     
   
   
   
   
   
   
   
   
   
   
   
   
   
   