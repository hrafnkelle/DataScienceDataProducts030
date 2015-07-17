library(shiny)

shinyUI(fluidPage(
  
  headerPanel("Demistifying Metal detector specifications"),
  p('A salesman tells you that his metal detector specifications will only miss one or less out of 50 test pieces with metal. The salesman was trying to make a 98% probability of detection understandable to the customer. Naturally the customer wants to validate this claim.'),
  p(strong('Is a trial with 50 pieces a good way to test a metal detector performance, assuming all have a metal contaminant?')),
  p('This page allows you to explore what the underlying probability of detection needs to be so that the salesmans claim is valid.'),
  mainPanel(
    h2('How often was the the claim of the salesman true?'),    
    p('Simulating the trial 10000 times and counting how often the claim was true is a simple way to check how good the claim is.'),
    textOutput("successratio"),
    plotOutput("histogramPlot"),
    p('The plot above shows the percentage of 50 piece trials that reject 50 pieces, 49 pieces, 48 pieces ...'),
    p('The blue columns show the trials when the statement of the salesman was correct, the red when he was wrong')
  ),
  sidebarPanel(
    p('Adjust the detection probability to explore its effect on possible trial outcomes.'),
    sliderInput("prob",
                "Probability of metal detection:",
                min = 95,
                max = 100,
                value = 98,
                step=0.1),
    p('Each column in the plot above shows the percentage of trials with the same number of succesful outcomes.'),
    p('We simulate 10000 trials with 50 pieces for you too see what can happen.')
  )
))
