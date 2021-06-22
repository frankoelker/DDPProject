#
# This is the user-interface definition of a Shiny web application for the
# Coursera Developing Data Products Project.
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Build a regression model"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            selectInput('x', 'Build a regression model of mpg against:',
                        choices = names(mtcars)[-1]),
            radioButtons('rb', "Choose one:", 
                         choices = c("Plot the data" = "p",
                        "Plot with regression line" = "rl", 
                        "regression model" = "rm"))
        ),

        # Show the generated plots
        mainPanel(
            verbatimTextOutput("summary"),
            plotOutput("regPlot")
        )
    )
))
