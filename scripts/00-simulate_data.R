#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
set.seed(42)

# Parameters for the true data generating process
mean <- 1
std_dev <- 1
sample_size <- 1000

# Simulate data from a normal distribution
data <- rnorm(n = sample_size, mean = mean, sd = std_dev)

# Introduce the instrument memory issue
# Overwrite the last 100 observations with copies of the first 100
data[(sample_size - 99):sample_size] <- data[1:100]

# Print simulated data
print(data)

# Write simulated data to a CSV file
write.csv(data, file = "inputs/data/simulated_data.csv")



