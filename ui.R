library(shiny)
shinyUI(fluidPage(
      titlePanel('Violent Crime Rates vs Urban Population in the US'),
      sidebarLayout(
            sidebarPanel(
                  selectInput('ycol', 'Select a type of Crime to visualize its relation to percentage of urban population', names(USArrests)[c(1,2,4)],
                              selected=names(USArrests)[[1]]),
                  h1(""),
                  h5("head of dataset"),      
            tableOutput('table')      
            ),
            mainPanel(
                  h5("The chart shows amount of crimes (in arrests per 100,000 residents) vs the percent of the population living in urban areas in each of the 50 US states in 1973."),
                  h5("Source: 'USArrests' dataset from R."),
                  h5("A linear regression model is calculated for each type of crime and shown below."),
                  plotOutput("plot1"),
                  h4("Slope"),
                  textOutput("pred1slope"),
                  textOutput("pred2slope"),
                  textOutput("pred3slope"),
                  h4("Intercept"),
                  textOutput("pred1intercept"),
                  textOutput("pred2intercept"),
                  textOutput("pred3intercept"),
                  h5("The linear model of crime explained by percent of urban population can be evaluated with the P value"),
                  h4("P Value of Regression Model"),
                  textOutput("pred1p"),
                  textOutput("pred2p"),
                  textOutput("pred3p")
                  
            )
      )
))