
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
  output$histogramPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    trials    <- data.frame(x=rbinom(100000,50,input$prob/100))
    qplot(trials$x, weight=1/1000, ylab="Percentage of times found [%]", xlab="Count found", binwidth=0.5,ylim=c(0,100))
  })
  
})
