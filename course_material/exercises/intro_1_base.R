# Introduction

# Now that you've had some time to look at the data and work through the exercise in Excel, let's see how to do it in R. First we will want to load some packages.

library(tidyverse)
library(lubridate)

# With those packages loaded, R now knows the functions we will need to use to calculate the monthly climatologies for our three time series. We will also be able to make some pretty figures.

# Using excel may allow one to make small changes quickly, but rapidly becomes laborious when any sophistication is required. The few lines of code below make all of the calculations we need in order to produce the results we are after.

# Load data
SACTN_data <- read_csv("data/SACTN_day_1.csv")

# Load data
SACTN_data <- read_csv("../data/SACTN_day_1.csv")

# Create monthly climatologies
SACTN_monthly <- SACTN_data %>% 
  mutate(month = month(date, label = T)) %>% 
  group_by(site, month) %>% 
  summarise(temp = mean(temp, na.rm = T))


# And that is all there is to it. Load the data and use four short lines of code. But let's quickly make those bonus line plots while we're at it:
  

ggplot(data = SACTN_monthly, aes(x = month, y = temp)) +
  geom_point(aes(colour = site)) +
  geom_line(aes(colour = site, group = site)) +
  labs(x = "", y = "Temperature (°C)")


# And if we want three different panels we just add one line of code:
  

ggplot(data = SACTN_monthly, aes(x = month, y = temp)) +
  geom_point(aes(colour = site)) +
  geom_line(aes(colour = site, group = site)) +
  labs(x = "", y = "Temperature (°C)") +
  facet_wrap(~site, ncol = 1) # Create panels

