library(shiny)
library(ggvis)
library(dplyr)

# Source in functions and load in data.
source('../code/functions.R')
dat <- read.csv('../data/cleandata/cleanscores.csv')


# Defining a vector of different assignments for selection by user in visualizer.
options <- names(dat)[1:22]


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Grade Visualizer"),
  
  # Sidebar with different widgets depending on the selected tab
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected==1",
                       h3("Grades Distribution"),
                       tableOutput('frequencies')),
      conditionalPanel(condition = "input.tabselected==2",
                       selectInput("hist.opt", "X-axis variable", options, 
                                   selected = "HW1"),
                       sliderInput("width", "Bin Width", min = 0.1, max = 10, value = 3)),
      conditionalPanel(condition = "input.tabselected==3",
                      selectInput("scat.opt1", "X-axis variable", options, 
                                    selected = "Test1"),
                      selectInput("scat.opt2", "Y-axis variable", options, 
                                  selected = "Overall"),
                      sliderInput("opaqueness", "Opacity", min = 0, max = 1, value = .5)
 
                      )
      ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Barchart", value = 1, 
                           ggvisOutput("barchart")),
                  tabPanel("Histogram", value = 2, 
                           ggvisOutput("histogram"),
                           'Summary Statistics',
                           verbatimTextOutput('summary')),
                  tabPanel("Scatterplot", value = 3, 
                           ggvisOutput("scatterplot"),
                           'Correlation',
                           verbatimTextOutput('correlation')),
                  id = "tabselected")
    )
  )
)


# Define server logic
server <- function(input, output) {

  ###Code for first tab.
  
  # Calculate proportions of grades.
  dat$Grade <- factor(dat$Grade, levels = c('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D', 'F'))
  
  table_freqs <- dat %>%
    group_by(Grade) %>%
    count(Grade) %>%
    mutate(Prop = round(n / 334, digits = 2)) %>%
    rename('Freq' = n)
  
  # Render table for display on side panel for first tab.
  output$frequencies <- renderTable({
    table_freqs})
  
  # Generating barchart via ggvis for visualizatino in main panel.
  vis_barchart <- reactive({
    table_freqs %>%
      ggvis(x = ~Grade, y = ~Freq, fill :='blue') %>%
      layer_bars()
    }
  )
  
  vis_barchart %>% bind_shiny('barchart')
  
  
  ### Code for second tab.
  
  # Generating histogram via ggvis for visualizatino in main panel. 
  vis_histogram <- reactive({
      hist.opt <- prop('x', as.symbol(input$hist.opt))
      dat %>%
        ggvis(x = hist.opt, fill := 'blue', stroke := 'white') %>%
        layer_histograms(width = input$width)
      }
  )
  
  vis_histogram %>% bind_shiny('histogram')
  
  # Render summary stats for display on main panel for first tab.
  sum_stats <- reactive({
      print_stats(dat[[input$hist.opt]])
    }
  )
  
  output$summary <- renderPrint({
    sum_stats()
  })
    
  
  ### Code for third tab.
  
  # Generating scatterplot via ggvis for visualizatino in main panel.
  
  vis_scatterplot <- reactive({
    scat.opt1 <- prop('x', as.symbol(input$scat.opt1))
    scat.opt2 <- prop('y', as.symbol(input$scat.opt2))
    dat %>%
      ggvis(x = scat.opt1, y = scat.opt2, fill := 'blue', opacity := input$opaqueness) %>%
      layer_points()
  }
  )
  
  vis_scatterplot %>% bind_shiny('scatterplot')
  
  # Render correlation for display on main panel for first tab.
  correlation <- reactive({
    return(cor(x = dat[[input$scat.opt1]], y = dat[[input$scat.opt2]]))
  }
  )
  output$correlation <- renderText({
    correlation()
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)