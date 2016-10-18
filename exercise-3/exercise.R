# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)
cars<- vehicles

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acura.2015 <- filter(cars, make=="Acura", year==2015)
acura.2015.max <- filter(acura.2015,hwy == max(hwy))
acura.2015.max.model <- select(acura.2015.max, model)
acura.2015.max

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
acura.2015.nest<-select(filter(filter(cars, make=="Acura",year==2015), hwy==max(hwy)), model) 

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
acura.2015.chain <- filter(cars, make=='Acura', year==2015) %>% filter(hwy == max(hwy)) %>% select(model)

acura.2015.max.model
acura.2015.nest
acura.2015.chain
### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
