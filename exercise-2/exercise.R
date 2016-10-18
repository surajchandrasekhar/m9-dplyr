# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
install.packages("dplyr")
library(fueleconomy)
library(dplyr)

# You should have have access to the `vehicles` data.frame
View(vehicles)
cars <- vehicles

# Create a data.frame of vehicles from 1997
cars.1997 <- filter(cars, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame

unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city

cars.v2 <- filter(cars, drive == "2-Wheel Drive", cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?

cars.v3 <- filter(cars.v2, hwy == min(hwy))
cars.v3.id <- select(cars.v3, id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

most.efficient <- function(my.make, my.year) {
  most.eff <- filter(cars, make == my.make, year == my.year)
  answer <- filter(most.eff, hwy == max(hwy))
  return(answer)
}

# What was the most efficient honda model of 1995?
most.efficient("Honda", 1995)

