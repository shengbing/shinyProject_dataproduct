#server.R

library(shiny)

shinyServer(function(input, output) {
        
        output$text1 <- renderText({ 
                input$df
        })
        
        output$text2 <- renderText({ 
                 input$tstatistics
        })
        
        output$text3 <- renderText({
                 round(pt(input$tstatistics, input$df, lower.tail = F), 3) 
                        
        })

        output$text4 <- renderText({
                if (input$checkbox1)
                {paste("corresponding p value for normal distribution = ", round(pnorm(input$tstatistics, lower.tail = F), 3))}
        })

        output$plot1 <- renderPlot({
                x <- seq(-10, 10, length=100)
                hx <- dnorm(x)
                
                degf <- input$df
                tstatistics<-input$tstatistics
                colors <- c("blue", "black")
                labels <- c(degf, "normal")
                
                plot(x, hx, type="l", lty=2, xlab="x value",
                     ylab="Density", main="t Distributions vs normal distribution")
                
                
                lines(x, dt(x, degf),lwd=2, col=colors[1])
                lines(c(tstatistics, tstatistics), c(-0.05, 0.4), col="red",lwd=5)

                
                legend("topright", inset=.05, title="Distributions",
                        labels, lwd=2, lty=c(1, 2), col=colors)
      })
        
}
)