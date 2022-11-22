# Script name
# Author
# Date


# Libraries ---------------------------------------------------------------

library(tidyverse)

# The two packages require for 'marmap' to work
library(rgdal)
library(raster)
library(ggOceanMaps)

# Data --------------------------------------------------------------------

# ???


# Example -----------------------------------------------------------------

# The basic map
ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(-90, -70), ylim = c(20, 40))


# Exercise 1 --------------------------------------------------------------

# Choose a coastal region somewhere within 30°N/S of the equator
# Download bathymetry data and plot them


basemap(limits = c(-160, -80, 65, 90), rotate = TRUE, bathymetry = TRUE)


# Exercise 2 --------------------------------------------------------------

# Chose a different region and get bathymetry
# Plot and combine the two figures

map_global_fix %>% 
  filter(lon > 9, lon < 28, lat > 76, lat < 81) %>% 
  ggplot(aes(x = lon, y = lat)) +
  geom_polygon(aes(group = group)) +
  # Filtering the OISST_2022 data directly in geom_tile()
  geom_tile(data = filter(OISST_2022,
                          lon > 9, lon < 28, lat > 76, lat < 81), 
            aes(fill = temp)) +
  coord_map(projection = "ortho", orientation = c(90, 0, 0))

# Map 1
map_1 <- basemap(limits = 60)
map_2 <- basemap(limits = c(-160, -80, 60, 85), rotate = TRUE)

ggdraw() +
  draw_plot(map_1) +
  draw_plot(map_2, x = 0.05, y = 0.65, width = 0.3, height = 0.3)

# Create dataframe to add points
df_points <- data.frame(lon = c(10, 12),
                        lat = c(34, 36),
                        point_colour = c("red", "blue"))


# Exercise 3 --------------------------------------------------------------

# Change the themes and minutia of the previous two plots and combine them


# BONUS -------------------------------------------------------------------

# Overlay data layers on a Google map image

