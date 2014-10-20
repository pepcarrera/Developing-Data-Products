library(shiny)
# Load mtcars data
data(mtcars)
mtcars$am <- factor(mtcars$am)
mtcars$cyl <- factor(mtcars$cyl)

# Create model predicting mpg based on cylinder, horse power, weight, and transmission type (am)
modelFit <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)

# New data placeholder
cyl <- 4
hp <- 40
wt <- 2
am <- 1
newdata <- data.frame(cyl, hp, wt, am)
newdata$am <- factor(newdata$am)
newdata$cyl <- factor(newdata$cyl)

# Predict the mpg
predict(modelFit,newdata=newdata)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
        
})