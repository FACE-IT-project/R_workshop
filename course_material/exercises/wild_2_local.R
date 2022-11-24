# Script name
# Author
# Date


# Libraries ---------------------------------------------------------------

# ???
library(tidyverse)
library(tidync)

# Data --------------------------------------------------------------------

# ???


# Example -----------------------------------------------------------------

# Load sst data
sst_NOAA_recent <- tidync("course_material/data/oisst-avhrr-v02r01.20221121_preliminary.nc") %>% 
  # Use this to convert to a tibble (i.e. fancy data.frame)
  hyper_tibble()

# Plot
ggplot(sst_NOAA_recent, aes(x = lon, y = lat)) +
  geom_tile(aes(fill = anom)) +
  borders(fill = "grey70", colour = NA) +
  # geom_tile(data = na.omit(sst_NOAA_recent), fill = "lightskyblue") +
  scale_fill_gradient2(low = "blue", high = "red") +
  coord_quickmap(expand = FALSE)

# Exercise 1 --------------------------------------------------------------

# Load a raster data file and extract the pixels that match three species presence datasets
# Plot the value range from the raster data as boxplots with ANOVA statistics


# Exercise 2 --------------------------------------------------------------

# Download a NetCDF file with multiple dates
# Extract three bounding boxes from all dates
# Calculate the grouped mean per date per bounding box
# Inset each time series over a map of that bounding box
  # showing the day with the highest value being plotted


# Exercise 3 --------------------------------------------------------------

# Write a script that performs a full workflow with one click:
  # Load libraries
  # Download data
  # Manipulate into tidy data
  # Perform analyses
  # Create and save publication quality plot


# BONUS -------------------------------------------------------------------

# Smile and enjoy life :)

