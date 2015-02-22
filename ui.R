library(shiny)
library(ggplot2)

dataset <- c("norm","constant","flat")

shinyUI(pageWithSidebar(
  
  headerPanel("2D Distributions"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=100, max=10000,
                value=min(100, 10000), step=100, round=0),
    
    selectInput('x', 'X', dataset),
    selectInput('y', 'Y', dataset)
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot")),
      tabPanel("Documentation", includeMarkdown("about.md"))
    )
  )
  
  
))