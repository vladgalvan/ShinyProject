library(shiny)
shinyServer(function(input, output) {
      
      selectedData <- reactive({
            USArrests[, c("UrbanPop", input$ycol)]
            })
      
      model1 <- lm(Murder ~ UrbanPop, data = USArrests)
      model2 <- lm(Assault ~ UrbanPop, data = USArrests)
      model3 <- lm(Rape ~ UrbanPop, data = USArrests)
      
      output$plot1 <- renderPlot({
            par(mar = c(5.1, 4.1, 0, 1))
            plot(selectedData())
            
            if(input$ycol=='Murder'){abline(model1, col = "blue", lwd = 2)}
            if(input$ycol=='Assault'){abline(model2, col = "green", lwd = 2)}
            if(input$ycol=='Rape'){abline(model3, col = "red", lwd = 2)}
            
      })
      
      output$pred1 <- renderText({if(input$ycol=='Murder'){anova(model1)$'Pr(>F)'[1]}})
      output$pred2 <- renderText({if(input$ycol=='Assault'){anova(model2)$'Pr(>F)'[1]}})
      output$pred3 <- renderText({if(input$ycol=='Rape'){anova(model3)$'Pr(>F)'[1]}})
            
      output$table <- renderTable({
            head(selectedData(),10)
      })

})