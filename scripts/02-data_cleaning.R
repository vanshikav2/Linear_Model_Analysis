#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
# Simulated data after introducing instrument memory issue
# (You can replace this with your actual simulated data)
# Read simulated data from the CSV file
simulated_data <- read.csv("inputs/data/simulated_data.csv", header = FALSE)


# Extract the first column as a vector
data <- as.numeric(simulated_data[[2]])

# Function to clean the dataset
clean_data <- function(data) {
  # Copy the data to avoid modifying the original dataset
  cleaned_data <- data
  
  # Change half of the negative values to positive
  negative_indices <- which(cleaned_data < 0)
  num_to_change <- length(negative_indices) / 2
  sampled_indices <- sample(negative_indices, num_to_change)
  cleaned_data[sampled_indices] <- abs(cleaned_data[sampled_indices])
  
  # Change decimal places between 1 and 1.1
  decimal_indices <- which(cleaned_data >= 1 & cleaned_data <= 1.1)
  cleaned_data[decimal_indices] <- cleaned_data[decimal_indices] / 10
  
  return(cleaned_data)
}

# Clean the data
cleaned_data <- clean_data(data)

# Print cleaned data
print(cleaned_data)
#### Save data ####
# Write cleaned data to a CSV file
write.csv(cleaned_data, file = "outputs/data/analysis_data.csv", row.names = FALSE)
