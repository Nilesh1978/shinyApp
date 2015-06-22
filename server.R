
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com

diversity<- read.csv("project.csv", stringsAsFactors = FALSE)
diversity$CrossYear<- as.factor(diversity$CrossYear)
library(dplyr)

shinyServer(
  function(input, output) {
    output$description<- renderText({"In this project we are plotting disribution of similarities by year. We created an dynamic dataset named dat. This data set is then used dynamically to create histograms by the input variable which is the year
      chosen by the user.  This app allows you to look at histograms in the plot tab and head of the data set in the data tab"})
    output$myHist<- renderPlot({
      dat<- diversity %>%
        filter(CrossYear %in% input$CY)
      hist(dat$Similarity, xlab='Similarity', col='lightblue',main='Histogram')
    })
    output$data<- renderTable({
      dat<- diversity %>%
        filter(CrossYear %in% input$CY)
      head(dat)
    })
    
  }
)