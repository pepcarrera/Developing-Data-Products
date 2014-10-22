library(shiny)
# Load mtcars data
data(mtcars)
mtcars$am <- factor(mtcars$am)
mtcars$cyl <- factor(mtcars$cyl)

# Create model predicting mpg based on cylinder, horse power, weight, and transmission type (am)
modelFit <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)

# Define server logic required to plot various variables against mpg
shinyServer(
        function(input, output) {
        dataInput <- reactive({
                df <- data.frame(cyl=input$cyl, hp=input$hp, wt=input$wt, am=input$am)
                return(list(df=df))
                })
                
                
                #Render prediction to the screen
                output$prediction <- renderPrint({
                        newdata <- dataInput()$df
                        newdata$am <- factor(newdata$am)
                        newdata$cyl <- factor(newdata$cyl)
                        predict(modelFit,newdata=newdata)
                        })

                }
        )