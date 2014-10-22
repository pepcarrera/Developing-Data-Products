library(shiny)

shinyUI(fluidPage(
        titlePanel("Predict Miles Per Gallon"),
        h4('This application will use your inputs below to predict your cars miles per gallon.  This is based on the mtcars dataset and we use the 4 variables below as the predictors'),
        sidebarLayout(
        sidebarPanel( 
                selectInput('cyl', 'Select Number of Cylinders', unique(mtcars$cyl), selected=4),
                numericInput('hp', 'Enter Horse Power (1 through 500)', 1, min = 1, max = 500, step = 1),
                numericInput('wt', 'Enter Weight (devide the weight in lbs of your car by 1000)', 1, min = 0.1, max = 10, step = 0.01),
                selectInput('am', 'Automatic Transmission (0) or Manual Transmission (1)', c(0,1), selected=0)
        
        ),      
        mainPanel(
                h3('Results of prediction'),
                textOutput('prediction'),
                h4('The above number predicts the MPG of your car based on your input')
        ))
))