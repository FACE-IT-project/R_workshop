# Script name
# Author
# Date


# Libraries ---------------------------------------------------------------

library(tidyverse)
library(lubridate)


# Data --------------------------------------------------------------------

# The mangled data
load("course_material/data/OISST_mangled.RData")

# The tidy data
sst_NOAA <- read_csv("course_material/data/sst_NOAA.csv")

# Look at all of the datasets in available R
data(package = .packages(all.available = TRUE))

## Access data
MASS::crabs

# Specifically...
crabs <- MASS::crabs

# Example -----------------------------------------------------------------

# The first few rows of an untidy dataframe
head(OISST3)

# Pivot wide by date
  # NB: This is very untidy
OISST1_wide <- OISST1 %>% 
  pivot_wider(values_from = temp, names_from = t)

sst_NOAA %>% 
  filter(site == "Med" | site == "WA") %>%
  group_by(site) %>% 
  summarise(mean_temp = mean(temp, na.rm = TRUE), 
            sd_temp = sd(temp, na.rm = TRUE)) %>% 
  ungroup()

sst_NOAA %>% 
  filter(site == "Med" &
         temp > 10 & temp < 15)

# Load the SACTN Day 1 data
read_csv("course_material/data/sst_NOAA.csv") %>%
  # Then create a month abbreviation column
  mutate(month = month(t, label = TRUE, abbr = FALSE)) %>% 
  # Then group by sites and months
  group_by(site, month) %>% 
  # Lastly calculate the mean
  summarise(mean_temp = mean(temp, na.rm = TRUE), 
            # and the SD
            sd_temp = sd(temp, na.rm = TRUE)) %>% 
  # Begin ggplot
  ggplot(aes(x = month, y = mean_temp, group = site)) + 
  # Create a ribbon
  geom_ribbon(aes(ymin = mean_temp - sd_temp, ymax = mean_temp + sd_temp), 
              fill = "black", alpha = 0.4) + 
  # Create dots
  geom_point(aes(colour = site)) + 
  # Create lines
  geom_line(aes(colour = site, group = site)) + 
  # Change labels
  scale_x_discrete(expand = c(0, 0)) +
  labs(x = "Month", y = "Temperature (°C)", colour = "Site") 

# Temps above 15°C per year site
sst_NOAA_15 <- sst_NOAA %>%  
  group_by(year(t), site) %>%
  summarise(count = n(), 
            count_15 = sum(temp > 15),
            prop_15 = count_15/count) %>% 
  # mutate(prop_15 = count_15/count) %>% 
  arrange(prop_15)

# Exercise 1 --------------------------------------------------------------

# Combine OISST4a and OISST4b into a new object


# Exercise 2 --------------------------------------------------------------

# Ensure that the date formatting is correct on your new object


# Exercise 3 --------------------------------------------------------------

# Split the date column on `sst_NOAA` and re-unite them


# BONUS -------------------------------------------------------------------

# Plot the temperatures of two time series against each other as a scatterplot
# Meaning temperature from time series 1 are the X axis, and time series 2 on the Y axis
# Hint: This requires pivoting the temperatures wide into columns

