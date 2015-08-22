# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Forecasting selected countries population using the Holt-Winters filtering model."),
  fluidRow(
    column(width = 4, wellPanel(
      selectInput("country",
                  "Select Country",
                  list("Bulgaria", "Lithuania", "Latvia", "Poland", "Mali", "United States")),
      selectInput("alpha",
                  "Alpha",
                  list(0.1, 0.2, 0.5, 0.8, 1)),
      selectInput("period",
                  "Length of the Prediction Period (years)",
                  list(10, 20, 30, 50, 100))
      
    )
    )),
  mainPanel(
    em('Author: Wojciech Gajewski'),
    p('This application forecasts population of the selected countries using the Holt-Winters filtering model.'),
    p('The population data comes from ',
    a('here', href='http://data.okfn.org/data/core/population/r/population.csv')),
    p('More on the Holts-Winters filtering prediction model can be found ',
    a('here.', href='https://stat.ethz.ch/R-manual/R-patched/library/stats/html/HoltWinters.html')),
    p('The application allows to choose the alpha parameter of the fitting, the country in question as well as the number of years to predict.'),
    p('The bands on the prediction plot represent the 80th and 95th confidence interval.'),
    plotOutput("populationPlot")
  )
)
)