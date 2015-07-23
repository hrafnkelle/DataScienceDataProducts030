library(shiny)

shinyUI(fluidPage(
  
  headerPanel("Understanding Metal detector specifications"),
  p('A salesman tells you that according to specifications his metal detector will only miss one or less out of 50 test pieces with metal. The salesman was trying to make a 98% probability of detection understandable to the customer. But is claim is only true "on the average".'),
  p('Naturally the customer wants to validate this claim with a trial: Run a number of pieces know to have metal and see how many are detected.'),
  tags$ul(tags$li(strong('How many pieces should be run through the detector?')),
          tags$li(strong('How many should the salesman say it detects based on the detection probability?'))),
  mainPanel(
    h2('Explore the distribution of trial outcomes'),    
    textOutput("missMoreThanOne"),
    plotOutput("histogramPlot"),
    p('The plot above shows different trial outcomes and how often they would occur if the trial was repeated many many times. ')
  ),
  sidebarPanel(
    p('Adjust the detection probability to explore its effect on possible trial outcomes.'),
    sliderInput("prob",
                "Probability of metal detection:",
                min = 95,
                max = 100,
                value = 98,
                step=0.1),
    p('Adjust the count of pieces used in each trial to explore the effect on possible trial outcomes.'),
    sliderInput("countInTrial",
                "Size of trial:",
                min = 50,
                max = 1000,
                value = 50,
                step=50)
  )
))
