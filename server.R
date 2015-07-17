
library(shiny)
library(ggplot2)
library(scales)
shinyServer(function(input, output) {
  numTrials<-10000
  numPiecesPerTrial<-50
  
  trials<-reactive({
    t<-rbinom(numTrials,numPiecesPerTrial, input$prob/100)
    data.frame(trials=t, meet_specs=(t>=(numPiecesPerTrial-1)))
  })
   
  output$histogramPlot <- renderPlot({
    ggplot(data=trials(),
           aes(x=trials,fill=meet_specs))+
      geom_bar(aes(y = (..count..)/sum(..count..)), binwidth = 0.5,origin=-0.5)+
      ylab("Ratio of trials [%]") + 
      xlab("Count of rejects in trial") + 
      scale_fill_discrete("Claim about trial was valid")+
      scale_y_continuous(labels=percent) + 
      scale_x_continuous(limits = c(numPiecesPerTrial-10, numPiecesPerTrial+1), breaks=seq(numPiecesPerTrial-10, numPiecesPerTrial))
  })
  
  output$successratio <- renderText({
    t<-trials()
    sprintf('The salesman was right %.2f %% of the time.', 100*sum(t$meet_specs)/numTrials)
  })
  
})
