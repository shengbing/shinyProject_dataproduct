#ui.R

library(shiny)

shinyUI(fluidPage(
        titlePanel("T distribution"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Plot t-distribution with specified degree of freedom, and compute p-value for the t statistics you entered"),
                        
                                                
                        sliderInput("df", 
                                    label = "Degree of freedom:",
                                    min = 1, max = 100, value = 1, step=1),
                        
                        numericInput("tstatistics", 
                                    label = "Enter t statistics (-10 to 10) :",
                                    min = -10, max = 10, value = 0, step=0.0001),
                        
                        checkboxInput("checkbox1", label = "show normal p value", value = TRUE),
                        
                        submitButton("Submit")
                        
                        
                        
                        ),
                
                mainPanel(
                        h5("You have selected degree of freedom:"),
                        
                        verbatimTextOutput("text1"),
                        
                        h5("You have entered t statistics:"),
                        
                        verbatimTextOutput("text2"),
                        
                        h5("p value for t distribution = "),
                        
                        verbatimTextOutput("text3"),
                        
                        
                        
                        textOutput("text4"),
                        
                        plotOutput('plot1')
                )
        )
))