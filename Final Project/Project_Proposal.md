Project Proposal
================
Zhenqi Zhou

# Introduction to problem/question

# Problem / Question

The propensity for visiting urban parks is affected by the park’s
attractiveness and travel convenience, where walking provides the most
basic and fair access. Walking routes from residences to parks, in terms
of duration and perception, have received insufficient attention in the
literature. Using the case study of Xuanwu Lake Park in China, I
acquired walking routes from residences to the park through open-source
data scraping in order to depict the pedestrian shed and pedestrian
environment reasonably along these routes.

# Inspiring Examples

## Example 1

![](https://media.springernature.com/lw685/springer-static/image/art%3A10.1186%2Fs12889-016-3631-7/MediaObjects/12889_2016_3631_Fig3_HTML.gif)

A reasonable walking distance is necessary for daily park users. There
are many measurement to define pedestrian shed, such as Euclidean
distance buffer method. This image proposed a line-based network buffer
method that defined areas near the center line of routes as accessible,
which is more accurate, as it is closer to the actual environment
available to pedestrians.

## Example 2

![](https://callisto.ggsrv.com/imgsrv/FastFetch/UBER1/ZI-5TQT-2020-JUL01-IDSI-3086-1)

This two images proposed several factors related to the pedestrian shed
and walking route environment, which I can use.

## Example 3

![](https://www.researchgate.net/publication/338143508/figure/fig1/AS:839634925928449@1577195974041/Scatter-plot-and-box-plot-overlay-for-in-vivo-binding-prediction.png)

This is a scatter plot and box plot overlay for in vivo binding
prediction. This kind of graph is easy to understand and rich with
details. You can see the distribution of the data very clearly.

# Proposed data sources

I collected data from my own previous research projects. I uploaded my
data to Github. Here is the link:
<https://github.com/GEO511-2021/2021_case_studies-ryan-zhenqi-zhou/tree/master/Final%20Project/Final%20Project%20Data%20Set>

1.  Residential building points of interest (Point)
2.  Park entrances (Point)
3.  Residential areas of interest (Polygon), which includes the
    information of population, POI density, green visual ratio and image
    elements.
4.  Walking routes (Line): According to the policy of the 15-Minute
    Community-Life Circle, a 15-min walk to parks is important for
    residents in China, which corresponds to about a 1000-m distance. I
    called the travel navigation function of online map to scrape
    recommended walking routes from residential buildings to the
    entrances of Xuanwu Lake Park, with a 15-min duration as the
    threshold. This data also includes the information of route
    distance, duration, starting, and ending points.

Note that All data type is shapefile.

# Proposed methods

The park’s pedestrian shed was delineated by walking routes presumably
reached within 15 min. By virtue of these walking routes, I developed 10
indices which related to the walking routes to the park. The former
covers three indices of the service capacity: service POIs, service
area, and service population, while the latter covers seven indices of
the pedestrian environment: route distance, pedestrian route directness
(PRD), the number of turns, the number of crossings, POI density along
the route, green visual ratio, and image elements of street view photo
(Table 1).

![](https://raw.githubusercontent.com/GEO511-2021/2021_case_studies-ryan-zhenqi-zhou/master/Final%20Project/Indices1.jpg)
![](https://raw.githubusercontent.com/GEO511-2021/2021_case_studies-ryan-zhenqi-zhou/master/Final%20Project/Indices2.jpg)

R packages used: tidyverse, dplyr, ggplot2, sf, sp.

# Expected results

The goal of this project is to provide a quantitative description of the
walking route to a park using novel distance from home to the park and
pedestrian environment measures. In result, I will create maps using
tmap with each specific index, to find out which routes are walkable.
Moreover, I will create some box plots and scatter plots to see the
distribution of each index.
