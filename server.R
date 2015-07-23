library(shiny)
library(ggplot2)
library(scales)
shinyServer(function(input, output) {
  numTrials<-10000
  
  trials<-reactive({
    t<-rbinom(numTrials,input$countInTrial, input$prob/100)
    data.frame(trials=t, meet_specs=(t>=(input$prob/100*input$countInTrial)))
  })
   
  output$histogramPlot<- renderPlot({
    size<-input$countInTrial
    p<-dbinom(1:size,size,input$prob/100)
    cp<-cumsum(p)
    cpi<-which(cp>0.001)
    ggplot(data=data.frame(x=cpi,y=100*p[cpi]),aes(x=x,y=y))+geom_bar(stat="identity")+ylab("Percentage of trials [%]") + xlab("Detected count in trial")
  })
  
  output$missMoreThanOne <- renderText({
    size<-input$countInTrial
    paste('Probability of missing more than one in this trial: ',round(sum(dbinom(1:(size-2),size,input$prob/100)),2))
  })
})

