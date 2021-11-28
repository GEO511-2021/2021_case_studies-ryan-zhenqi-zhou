library(tidyverse)
library(nycflights13)

view(airports)
head(planes)
view(flights)
head(airlines)

flights2 <- flights %>% 
  select(distance, dest) %>%
  left_join(airports, by = c('dest' = 'faa')) %>%
  arrange(desc(distance))

farthest_airport <- flights2 %>%
  select(name) %>%
  slice(1) %>%
  as.character()
  
  


