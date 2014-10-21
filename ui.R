library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Predict Miles Per Gallon"),
        sidebarPanel(
                numericInput('cyl', 'Enter Number of Cylinders', 4, min = 4, max = 20, step = 1),
                numericInput('hp', 'Enter Horse Power', 1, min = 1, max = 500, step = 1),
                numericInput('wt', 'Enter Weight (lb/1000)', 1, min = 0.1, max = 10, step = 0.1),
                numericInput('am', 'Automatic (0) or Manual (1)', 0, min = 0, max = 1, step = 1)
        
        ),      
        mainPanel(
                h3('Results of prediction'),
                textOutput('prediction')
        )
))