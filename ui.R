#Nick Haener Assignment 8 ui.R file

# Read in data
library(plotly)
library(shiny)
library(scatterD3)

#Create UI
shinyUI(fluidPage( 
  
  #Title the UI
  titlePanel('Iris Data'),
  
  sidebarLayout(
    
    sidebarPanel('interact with the buttons to change the data shown.',
                 
                 #Create the select bar for initial choices
                 selectInput("species", label = h3("Select Species"),
                             choices = list("setosa" = 'setosa', "versicolor" = 'versicolor',
                                            "virginica" = 'virginica'),
                             selected = 'setosa'),
                 
                 #create radio buttons for secondary input and choices
                 radioButtons("parts", label = h3("Select Flower Part"),
                              choices = list("Sepal" = 'Sepal', "Petal" = 'Petal'), 
                              selected = 'Sepal')
                
    ),
    
    mainPanel(scatterD3Output("scatterPlot", height = "700px"))
    
  )
  
))
