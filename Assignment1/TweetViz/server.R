# server.R

library(stringr)
library(streamR)
source("tweetvizdatacollection.R")

shinyServer(function(input, output) {
  
  
  
  output$freq_plot <- renderPlot({
    barplot(length(grep(input$var, 
                        tweetvizdf[tweetvizdf$times >= input$range[1] & 
                        tweetvizdf$times <= input$range[2], ]$text, ignore.case = TRUE)),
                   width = .4, ylim = c(0, 4000),
            main = bquote(paste("Volume of Conversation:", .(length(grep(input$var, 
                               tweetvizdf[tweetvizdf$times >= input$range[1] & 
                                          tweetvizdf$times <= input$range[2], ]$text, 
                               ignore.case = TRUE))))))
  })
  
  output$info_click <- renderText({
    paste0(input$var)
  })
  
  output$most_active <- renderPlot({
    par(mai = c(1, 3, 1, 1))
    barplot(sort(table(
      tweetvizdf[str_detect(tweetvizdf$text, input$var), ]
      [tweetvizdf$times >= input$range[1] & tweetvizdf$times <= input$range[2], ]$screen_name), 
      decreasing = T)[1:10], main = "Most Active Handles Mentioning Candidate",
      cex.names = 1, horiz = TRUE, las = 1)
    
  })
  
}
)
