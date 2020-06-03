library(shiny)
shinyServer(function(input, output) {
    model1 <- reactive({
        brushed_data <- brushedPoints(Orange, input$brush1,
                                      xvar = "age", yvar = "circumference")
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(circumference ~ age, data = brushed_data)
    })
    
    output$slopeOut <- renderText({
        if(is.null(model1())){
            "No Model Found"
        } else {
            model1()[[1]][2]
        }
    })
    
    output$intOut <- renderText({
        if(is.null(model1())){
            "No Model Found"
        } else {
            model1()[[1]][1]
        }
    })
     
    output$RSOut <- renderText({
        if(is.null(model1())){"No Model Found"}
        else {summary(model1())$r.squared}
    })
    
    output$ARSOut <- renderText({
        if(is.null(model1())){"No Model Found"}
        else {summary(model1())$adj.r.squared}
    })
    
    
    output$plot1 <- renderPlot({
        plot(Orange$age, Orange$circumference, xlab = "Age(days)",
             ylab = "Circumference(mm)", main = "Orange tree Measurements(select points to get model)",
             cex = 1.5, pch = 16, bty = "n")
        if(!is.null(model1())){
            abline(model1(), col = "blue", lwd = 2)
        }
    })
    
    output$plotResid <- renderPlot({
        
        if(!is.null(model1())){
            plot(resid(model1()),main = "Residual plot")
        }
    })
    
    output$histTree <- renderPlot({
        hist(Orange$age, xlab = 'Tree age(days)', col = 'lightblue', main = 'Age' )
        
    })
    
    output$histCircum <- renderPlot({
        hist(Orange$circumference, xlab = 'Tree circumference(mm)', col = 'blue', main = 'Circumference' )
        
    })
    
    
    
    
    
    
})