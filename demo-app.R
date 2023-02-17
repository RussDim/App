library(shiny)


ui <- fluidPage(
  sliderInput(inputId ='bins',
              label = 'I am a label',
              min = 2,
              max = 50,
              value = 20),
  plotOutput(outputId = 'displot')
)



server <- function(input, output, session){
  
  output$displot <- renderPlot({
  
  
  # generate bins based on input$bins from ui.R
  x    <- faithful[, 2]
  bins <- seq(min(x), max(x), length.out = input$bins + 1)
  
  # draw the histogram with the specified number of bins
  hist(x, breaks = bins, col = 'darkgray', border = 'white',
       xlab = 'Waiting time to next eruption (in mins)',
       main = 'Histogram of waiting times')
  })
}



shinyApp(ui, server)