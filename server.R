library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- reactive(function() {
    
    if (input$x=="norm" ) { dx <- rnorm(input$sampleSize) }
    if (input$x=="constant" ) { dx <- rep(1,input$sampleSize) }
    if (input$x=="flat" ) { dx <- runif(input$sampleSize,0,1) }
    
    

    if (input$y=="norm" ) { dy <- rnorm(input$sampleSize) }
    if (input$y=="constant" ) { dy <- rep(1,input$sampleSize) }
    if (input$y=="flat" ) { dy <- runif(input$sampleSize,0,1) }
    
    data.frame(x = dx, y = dy)
  })
  
  output$plot <- reactivePlot(function() {
    
    p <- ggplot(dataset(), aes(x=x,y=y)) + geom_point()
    
    
    print(p)
    
  }, height=700)
  
    
})
