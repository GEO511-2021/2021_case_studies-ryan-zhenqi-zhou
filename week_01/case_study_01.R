# calculates the mean Petal Length in the dataset and plot the distribution of the Petal.Length
petal_Length = iris$Petal.Length

# calculates the mean Petal Length in the dataset
petal_length_mean = mean(petal_Length)

# plot the distribution of the Petal.Length
# Make a Histogram with Basic R
# hist(petal_Length,
#      main = "Histogram for petal_length",
#      xlab = "petal_length",
#      border = "blue",
#      col = "green",
#      xlim = c(1,7),
#      ylim = c(0,1),
#      las = 1, # rotate the labels
#      breaks = c(1, seq(2,7, 1)),
# prob = TRUE) #probability
# lines(density(petal_Length))

# Make a Histogram with ggplot2
library(ggplot2)
# qplot(petal_Length, 
#       geom = "histogram",
#       binwidth = 1,
#       main = "Histogram for petal_length",
#       xlab = "petal_length",
#       col = I("blue"),
#       fill = I("green"),
#       xlim = c(1,7),
#       ylim = c(0,50),
#       alpha = I(.2))

ggplot(data=iris, aes(petal_Length)) +
  geom_histogram(breaks = seq(1,7, by = 0.5),
                 col = "red",
                 alpha = .2) +
  aes(fill = ..count.., ) + # Why can't use these to fuction
  scale_fill_gradient("Count", low = "green", high = "red") +
  labs(title = "Histogram for petal_length", x = "Petal_length", y = "Count") +
  xlim(c(1,7)) +
  ylim(c(0,50))

# ggsave(file = "output.pdf", width = 420, height = 594, units = "mm") # 淇濆瓨
# getwd() 

# Trendline
# ggplot(data=iris, aes(petal_Length)) +
#   geom_histogram(aes(y=..density..),
#                  breaks = seq(1,7, by = 0.5),
#                  col = "red",
#                  fill = "green",
#                  alpha = .2) +
#                aes(fill = ..count.., )) + # Why can't use these to fuction
# scale_fill_gradient("Count", low = "green", high = "red") +
# labs(title = "Histogram for petal_length", x = "Petal_length", y = "Count") +
# geom_density(col = "blue")
# xlim(c(1,7)) +
# ylim(c(0,50))