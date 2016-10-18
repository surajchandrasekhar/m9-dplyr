# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package

library(fueleconomy)

# You should have have access to the `vehicles` data.frame
cars <- vehicles
View(cars)

# Create a data.frame of vehicles from 1997
cars.1997 <- cars[cars$year==1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city

cars.2whl <- cars[cars$drive == '2-Wheel Drive' & cars$cty == 20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.mpg <- cars.2whl[cars.2whl$hwy == min(cars.2whl$hwy),]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year

most.efficient = function(my.make, my.year) {
  most.eff = cars[cars$make == my.make & cars$year == my.year,]  
  answer <- most.eff[most.eff$hwy == max(most.eff$hwy),]
  return(answer)
}

# What was the most efficient honda model of 1995?
honda.2015 <- most.efficient('Honda', 1995)
honda.2015
