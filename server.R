#Assignment 8 server.R file

# Read in data
library(plotly)
library(shiny)
library(dplyr)
library(scatterD3)

#Initialize server
function(input, output){
  
  create_plot <- eventReactive(input$render, {
  #local variables to make things easier
  length <- paste0(input$part, '.Length')
  width <- paste0(input$part, '.Width')
    
  #Filter and select needed data
  data <- filter(iris, iris$Species == input$species) %>%
        select(input$part) 
  
  #Make interactive Plot
  scatterPlot <- renderscatterD3({
          scatterD3(
                 x = width, 
                 y = length, 
                 type_var = 'point',
                 xlab = width,
                 ylab = length,
                 colors = species,
                 size_var = x)
    })
  
  #push output
  output$reactivePlot({scatterPlot()})
  })
}  
  
