

library(shiny)
shinyUI(fluidPage(
    titlePanel("Visualize Many Models for Orange tree circumference prediction by age "),
    sidebarLayout(
        sidebarPanel(
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut"),
            h3("R squared"),
            textOutput("RSOut"),
            h3("Adjusted R squared"),
            textOutput("ARSOut")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Documentation",
                         h4("This visualization uses the Orange dataset in R 
                            which shows tree circumference in mm and age in days."),
                            
                        h4("The 'Histogram' tab shows the histogram of the the
                            dependent variable 'Circumference' and independent variable 'Age'.
                            The 'Model Plot' tab shows a scatterplot where you can select the points
                            and the regression line corresponding to this model will show up."),
                        
                        h4("The side panel will show the slope , intercept, R squared and the
                            adjusted R squared for the selected model. These details will show 
                           only when some points are selected on the scatterplot and the 
                           corresponding regression line is produced. "),
                        
                        h4("The residual plot will show below the model plot once a model is selected.
                            If no model is selected then no residual plot will show."
                         ),
                        
                        h4("This application is inspired from example at 
                           https://github.com/DataScienceSpecialization/
                           Developing_Data_Products/blob/master/Shiny_Part_2/Shiny_Part_2.Rmd"),
                ),
                
                
                
                tabPanel("Model Plot",
                         plotOutput("plot1",brush = brushOpts(id = 'brush1')),
                         plotOutput("plotResid",brush = brushOpts(id = 'brush1'))
                         
                ),
                tabPanel("Histograms",
                         plotOutput("histTree",brush = brushOpts(id = 'brush1')),
                         plotOutput("histCircum",brush = brushOpts(id = 'brush1'))
                )
                
                
            )
        )
    )
))
