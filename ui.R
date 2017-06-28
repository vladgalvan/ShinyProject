library(shiny)
shinyUI(fluidPage(
      titlePanel('Violent Crime Rates vs Population in the US'),
      sidebarLayout(
            sidebarPanel(
                  selectInput('ycol', 'Select a type of Crime to visualize its relation to urban population', names(USArrests)[c(1,2,4)],
                              selected=names(USArrests)[[1]]),
                  h1(""),
                  h5("head of dataset"),      
            tableOutput('table')      
            ),
            mainPanel(
                  h5("The chart shows amount of crimes (in arrests per 100,000 residents) vs the percent of the population living in urban areas in each of the 50 US states in 1973."),
                  h5("Source: 'USArrests' dataset from R"),
                  plotOutput("plot1"),
                  h5("The relation between population and each type of crime can be evaluated with the P value"),
                  h4("P Value of Regression Model"),
                  textOutput("pred1"),
                  textOutput("pred2"),
                  textOutput("pred3")
                  
            )
      )
))