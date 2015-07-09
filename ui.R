
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Demistifying Metal detector specs"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("prob",
                "Probability of success:",
                min = 50,
                max = 100,
                value = 98,
                step=0.25)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("histogramPlot")
  )
))
