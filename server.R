# Project 

library(shiny)
library(plyr)
library(forecast)

shinyServer(function(input, output) {
  population <- read.csv("population.csv")
  population_subset <- reactive({
    country_population <-subset(population, Country.Name == input$country)
    # Creating time series.
    country_population_ts <- ts(country_population$Value, start=country_population$Year[1])
    model <- HoltWinters(country_population_ts, gamma=FALSE, alpha=as.numeric(input$alpha), beta=TRUE)
    forecast.HoltWinters(model, h=input$period)
  })
  output$populationPlot <- renderPlot({
    plot.forecast(population_subset(), main=paste('Population Prediction Plot for', input$country), xlab='Year', ylab='Population')
  })
})
