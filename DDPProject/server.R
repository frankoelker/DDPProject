#
# This is the server logic of a Shiny web application for the
# Coursera Developing Data Products Project.
#

library(shiny)

# Define server logic
shinyServer(function(input, output) {

    regFormula <- reactive({
        as.formula(paste('mpg ~', input$x))
    })
    
    output$summary <- renderPrint({
        if(input$rb == "rm") {
            fit <- lm(regFormula(), data = mtcars)
            b   <- coef(fit)
            summary(fit)
        }
    })
    
    output$regPlot <- renderPlot({
        par(mar = c(4, 4, .1, .1))
        if(input$rb == "p") {
            plot(regFormula(), data = mtcars, pch = 19)
        } else if(input$rb == "rl") {
            par(mar = c(4, 4, 1, 1))
            plot(regFormula(), data = mtcars, pch = 19, col = 'gray')
            fit <- lm(regFormula(), data = mtcars)
            abline(fit, col = 'red', lwd = 2)
        }
    })
})
