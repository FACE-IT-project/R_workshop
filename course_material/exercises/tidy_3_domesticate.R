# Script name
# Author
# Date


# Libraries ---------------------------------------------------------------

library(tidyverse)
library(cowplot)

# Data --------------------------------------------------------------------

# SST data
sst_NOAA <- read_csv("course_material/data/sst_NOAA.csv")


# Example -----------------------------------------------------------------

# Whatever we can imagine!
prop_15 <- sst_NOAA %>%  
  mutate(year = year(t)) %>% 
  group_by(site, year) %>%
  summarise(count = n(), 
            count_15 = sum(temp > 15)) %>% 
  mutate(prop_15 = count_15/count) %>% 
  arrange(prop_15)

# Bar plots
ggplot(data = prop_15, aes(x = year, y = prop_15)) +
  geom_bar(stat = "identity")
# OR
ggplot(data = prop_15, aes(x = year, y = prop_15)) +
  geom_col()


# Exercise 1 --------------------------------------------------------------

# Filter two sites and summarise six different statistics


# Exercise 2 --------------------------------------------------------------

# Find the maximum temperature and SD per year per site
# Plot this as a bar plot with error bars
# Inset a map of each site over each bar plot
sst_stats <- sst_NOAA %>% 
  mutate(year = year(t),
         month = month(t, label = T)) %>% 
  filter(site == "WA") %>% 
  group_by(site, month) %>% 
  summarise(max_temp = max(temp, na.rm = T),
            sd_temp = sd(temp, na.rm = T),
            .groups = "drop")

plot_WA <- ggplot(data = sst_stats, aes(x = month, y = max_temp)) +
  geom_line(aes(group = site))
plot_WA

map_WA <- ggplot() +
  borders() +
  coord_quickmap(expand = F,
                 xlim = c(110, 130),
                 ylim = c(-35, -10))
map_WA

ggplot() +
  cowplot::draw_plot(plot_WA) +
  cowplot::draw_plot(map_WA, x = 0.4, y = 0.5, width = 0.5)


# Exercise 3 --------------------------------------------------------------

# From scratch, re-write the full analysis for exercise 1 'The new age'
# Inset maps for each at the end of each line on the Y axis


# BONUS -------------------------------------------------------------------

# Create a faceted heatmap showing the monthly climatologies per site

