# ui.R

library(shiny)
source("tweetvizdatacollection.R")

shinyUI(fluidPage(
  titlePanel("Tweets per Candidate"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a specific candidate, visualize the volume of tweets"),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Hillary Clinton" = "Hillary Clinton|Hillaryclinton", 
                              "Bernie Sanders" = "Bernie Sanders|Bernie Sanders",
                              "Ted Cruz" = "Ted Cruz|TedCruz", 
                              "Marco Rubio" = "Marco Rubio|MarcoRubio",
                              "Donald Trump" = "Donald Trump|DonaldTrump",
                              "Chris Christie" = "Chris Christie|Chrischristie",
                              "Jeb Bush" = "Jeb Bush|JebBush",
                              "John Kasich" = "John Kasich|JohnKasich",
                              "Ben Carson" = "Ben Carson|Bencarson",
                              "Carly Fiorina" = "Carly Fiorina|CarlyFiorina"),
                  selected = "Hillary Clinton|Hillaryclinton"),
      
      
      sliderInput("range", 
                  label = "Range of time",
                  min = min(tweetvizdf$times), max = max(tweetvizdf$times), 
                  value = c(min(tweetvizdf$times), max(tweetvizdf$times)))
    ),
    
    mainPanel(
      
      verbatimTextOutput("info_click"),
      plotOutput("freq_plot"),
      plotOutput("most_active")
      
    )
    
  )
  
))