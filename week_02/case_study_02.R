# Load data from a comma-separated-values formatted text file hosted on a website
library(tidyverse) # import the tidyverse library
dataurl = "https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt" 

temp_ori = read_table(dataurl)
head(temp_ori) # The R just slect 9 columns based on the first line

temp = read_table(dataurl,
                  skip=3, #skip the first 3 line which has column names
                  na = "999.90", # tell R that 999.90 means missing in this data set
                  col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                                "APR","MAY","JUN","JUL",  
                                "AUG","SEP","OCT","NOV",  
                                "DEC","DJF","MAM","JJA",  
                                "SON","metANN"))
# renaming is necessary because they used dashes ("-")
# in the column names and R doesn't like that.
# rm(list = ls())
head(temp)
View(temp)

# some time I would get this error: Error in open.connection(con, "rb") : HTTP error 404.don't know why, maybe the network or maybe visit too many times.
# download data from the webside, and use R to read it in the folder
# setwd("C:/Users/ryanz/Desktop/210912-GEO511/03 My grandfather says summers are getting hotter/")
# temp_csv = read.csv("station.csv",
#                     na = "999.90")
# colnames(temp_csv) = c("YEAR","JAN","FEB","MAR", # define column names 
#                        "APR","MAY","JUN","JUL",  
#                        "AUG","SEP","OCT","NOV",  
#                        "DEC","DJF","MAM","JJA",  
#                        "SON","metANN")

# # Graph the annual mean temperature in June, July and August (JJA) using ggplot
# ggplot(temp, aes(YEAR, JJA)) +
#   geom_line() +
# # Add a smooth line with geom_smooth()
#   geom_smooth(method = "loess", formula = "y ~ x", color = "red", alpha = 0.4) +
# # Add informative axis labels using xlab() and ylab() including units
# # Add a graph title with ggtitle()
#   labs(x = "Year",y = "Lean Summer Temperatures(C)",
#        title = "Mean Summer Temperatures in Buffalo, NY",
#        subtitle = "Summer includes June, July, and Auguest\nData from the Globel Historical Climate Network\nRed line is a LOESS smooth") +
# # Add theme
# # Use a built-in theme, a black and white one.
#   theme_bw() +
#   # theme_classic()
#   # theme_dark()
#   # theme_light()
#   theme(plot.title = element_text(size = 20),
#         plot.subtitle = element_text(size = 12),
#         axis.title.x = element_text(size = 15),
#         axis.title.y = element_text(size = 15),
#         axis.text.x = element_text(size = 12, color = "black"),
#         axis.text.y = element_text(size = 12, color = "black"),
#         axis.ticks.x = element_line(color = "black", size = 1),
#         axis.ticks.y = element_line(color = "black", size = 1))

# Warning messages:
#   1: Removed 6 rows containing non-finite values (stat_smooth). 
# 2: Removed 1 row(s) containing missing values (geom_path).
# update graph: The line has broken, some value is missing, we omit it.
temp_JJA <- temp %>% #What the function does is to pass the left hand side of the operator to the first argument of the right hand side of the operator
  select(YEAR , JJA)
temp_JJA <- temp_JJA %>% na.omit()

ggplot(temp_JJA, aes(YEAR, JJA)) +
  geom_line() +
  geom_smooth(method = "loess", formula = "y ~ x", color = "red", alpha = 0.4) +
  labs(x = "Year",y = "Lean Summer Temperatures(C)",
       title = "Mean Summer Temperatures in Buffalo, NY",
       subtitle = "Summer includes June, July, and Auguest\nData from the Globel Historical Climate Network\nRed line is a LOESS smooth") +
  theme_bw() +
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        axis.text.x = element_text(size = 12, color = "black"),
        axis.text.y = element_text(size = 12, color = "black"),
        axis.ticks.x = element_line(color = "black", size = 1),
        axis.ticks.y = element_line(color = "black", size = 1))

# Save a graphic to a png file using png() and dev.off() OR ggsave
ggsave(filename = "My grandfather says summers are getting hotter.png",
       plot = last_plot(),
       path = "C:/Users/ryanz/Desktop/210912-GEO511/03 My grandfather says summers are getting hotter/",
       dpi = 300,
       scale = 2
)
# the Summer Temperatures in Buffalo is increase, Grandpa is right.