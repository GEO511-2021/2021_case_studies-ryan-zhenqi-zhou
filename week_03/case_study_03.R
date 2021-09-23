 library(gapminder)
 library(ggplot2)
 library(dplyr)
 
# Plot 1
gapminder_new <- gapminder %>% 
   filter(country != "Kuwait") 
 
ggplot(gapminder_new, aes(lifeExp, gdpPercap, size = pop/100000, color = continent)) +
   geom_point() +
   scale_y_continuous(trans = "sqrt") + # more clearly show the data in the lower left corner
   facet_wrap(~year, nrow = 1) +
   labs(x = "Life Expectancy",y = "GDP per capita",
        title = "Wealth and life expectancy through time",
        size = "Population (100k)",
        color = "Continent") + # how to change one of the legend.title
   theme_bw() +
   theme(plot.title = element_text(size = 30, hjust = -0.1, face = "plain"))

# Save
ggsave(filename = "Wealth and life expectancy through time1.png",
       plot = last_plot(),
       path = "C:/Users/ryanz/Desktop/210912-GEO511/04 Git test/2021_case_studies-ryan-zhenqi-zhou/week_03/",
       dpi = 300,
       width = 15
)
   
# Plot 2
gapminder_continent <- gapminder_new %>%
   group_by(continent, year) %>%
   summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), # weighted.mean
            pop = sum(as.numeric(pop)))

ggplot(gapminder_new, aes(year, gdpPercap)) +
   geom_line(aes(group = country, color = continent),size = 0.7) +
   geom_point(aes(size = pop/100000, color = continent)) +
   geom_line(data = gapminder_continent, aes(year, gdpPercapweighted), color = "black", size = 1) +
   geom_point(data = gapminder_continent, aes(year, gdpPercapweighted, size = pop/100000), color = "black") +
   facet_wrap(~continent, nrow = 1) +
   labs(x = "Year",y = "GDP per capita",
        title = "Wealth and life expectancy through time",
        size = "Population (100k)",
        color = "Continent") + # how to change one of the legend.title
   theme_bw() +
   theme(plot.title = element_text(size = 30, hjust = -0.05, face = "plain"))

# Save
ggsave(filename = "Wealth and life expectancy through time2.png",
       plot = last_plot(),
       path = "C:/Users/ryanz/Desktop/210912-GEO511/04 Git test/2021_case_studies-ryan-zhenqi-zhou/week_03/",
       dpi = 300,
       width = 15
)
     
   
   


