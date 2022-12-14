# Script name
# Author
# Date


# NB: Create these section breaks by pressing: ctrl+shift+r
# Libraries ---------------------------------------------------------------

library(tidyverse)
library(ggpubr)
library(palmerpenguins)


# Data --------------------------------------------------------------------

# Load the dataset into the local environment
penguins <- penguins

# SST NOAA data
sst_NOAA <- read_csv("course_material/data/sst_NOAA1.csv")

# Or from Excel
sst_NOAA <- read_csv2("course_material/data/sst_NOAA1.csv")

# Or for anything
sst_NOAA <- read_delim("course_material/data/sst_NOAA1.csv", delim = "\t")


# Analyses ----------------------------------------------------------------

# Look at parts of the data frame
sst_NOAA
head(sst_NOAA)
tail(sst_NOAA, 2)

# Quick summaries
glimpse(sst_NOAA)
summary(sst_NOAA)

# Example -----------------------------------------------------------------

# Discrete viridis colour palette
ggplot(data = penguins,
       aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(colour = as.factor(year))) +
  scale_colour_viridis_d(option = "A")

# Compare species
ggplot(data = penguins, aes(x = species, y = bill_length_mm)) +
  geom_boxplot(aes(fill = species), show.legend = F) +
  stat_compare_means(method = "anova")


# Exercise 1 --------------------------------------------------------------

# Create your own continuous and discrete colour palettes
# Create and combine two figures, each using a different palette


# Exercise 2 --------------------------------------------------------------

# Create two versions of the same figure and combine
# Use a viridis colour palette against a default palette in a way 
# that allows features in the data to be more pronounced


# Exercise 3 --------------------------------------------------------------

# Plot and combine t-test and ANOVA stats using sst_NOAA
# See this site for more info on plotting stats:
# http://www.sthda.com/english/articles/24-ggpubr-publication-ready-plots/76-add-p-values-and-significance-levels-to-ggplots/


# BONUS -------------------------------------------------------------------

# Create a correlogram between the two northern hemisphere sites in sst_NOAA

