
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
shinyUI(fluidPage(
  headerPanel("Diversity"),
  sidebarPanel(
    radioButtons("CY", "Cross Year:", 
                 choices = c("2012"="2012",
                             "2013"="2013", 
                             "2014"="2014",
                             "2015"="2015"))
  ),
  # Show a summary of the dataset and an HTML table with the 
  # requested number of observations
  mainPanel(
    tabsetPanel(type="tab",
                tabPanel("Project Description", verbatimTextOutput("description")),
                tabPanel("Data", tableOutput("data")),
                tabPanel("Plot", plotOutput("myHist"))
    )
  )
))
