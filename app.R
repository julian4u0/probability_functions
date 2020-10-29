library(shiny)
library(ggplot2)


# Define UI for application that draws a histogram
ui <- fluidPage(
    # Application title
    titlePanel("Interactive Probability Distributions"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput(
                "dis",
                "Distribution:",
                c(
                    "Binomial" = "bin",
                    "Poisson" = "poi",
                    "Exponential" = "exp",
                    "Gamma" = "gam",
                    "Normal" = "nor"
                )
            ),
            uiOutput('info'),
            
            uiOutput("acum_par"),
            
            uiOutput("first_par"),
            uiOutput("second_par", )
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(plotOutput("distPlot"))
    )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
    disinfo <- function(di) {
        switch (di,
                "bin" = {
                    n <- input$n
                    p <- input$p
                    ac <- input$ac
                    ar <- round(pbinom(ac, n, p), 8)
                    HTML(paste(h4("Expected value =  ", n * p, "\n")),
                         paste(h4("P( X ≤ ", ac, " ) =  ", ar , "\n")))
                    
                    
                    
                }, 
                "poi" = {
                    p <- input$p
                    ac <- input$ac
                    ar <- round(ppois(ac,p), 8)
                    HTML(paste(h4("Expected value =  ", p, "\n")),
                         paste(h4("P( X ≤ ", ac, " ) =  ", ar , "\n")))
                    
                }, 
                "exp" = {
                    p <- input$p
                    ac <- input$ac
                    ar <- round(pexp(ac, rate = p), 8)
                    HTML(paste(h4("Expected value =  ", round(1/p, 7), "\n")),
                         paste(h4("P( X ≤ ", ac, " ) =  ", ar , "\n")))
                    
                })
    }
    output$acum_par <-  renderUI({
        if(input$dis == "poi" |input$dis == "bin" ){
            
            sliderInput(
                "ac",
                "P(X ≤ c)",
                min = 0,
                max = 300,
                value = 4
            )
        }
        else{
            
            numericInput(
                "ac",
                "P(X ≤ c)",
                min = 0,
                max = 300,
                value = 4
            )
            
        }
    })
    output$info <-  renderUI({
        disinfo(input$dis)
    })
    
    output$first_par <- renderUI({
        switch (
            input$dis,
            "bin" = numericInput(
                "p",
                "Probability of every trial [0, 1]",
                0.3,
                min = 0,
                max = 1,
                step = 0.01,
                width = NULL
            ),
            "poi" = numericInput(
                "p",
                "Rate λ",
                0.3,
                min = 0,
                max = 1,
                step = 0.01,
                width = NULL
            ),
            "exp" = numericInput(
                "p",
                "Rate λ",
                0.3,
                min = 0,
                max = 1,
                step = 0.01,
                width = NULL
            )
        )
        
    })
    
    output$second_par <- renderUI({
        switch (
            input$dis,
            "bin" = sliderInput(
                "n",
                "Number of trials",
                12,
                min = 0,
                max = 300,
                step = 1,
                width = NULL
            )
        )
    })
    
    
    
    
    output$distPlot <- renderPlot({
        ac <- input$ac + 1
        n <- input$n
        p <- input$p
        #bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        switch (
            input$dis,
            "bin" = {
                binbar <- dbinom(0:n, n, p)
                cols <- c("gray", "green")
                pos <- 0:n
                barplot(
                    binbar,
                    col = cols[(pos < ac) + 1],
                    border = cols[(pos < ac) + 1],
                    names.arg = 0:n
                )
            },
            "poi" = {
                range <- qpois(0.999, p)
                nb <- round(p*5, 0)
                binbar <- dpois(0:range, p)
                cols <- c("gray", "green")
                pos <- 0:range
                barplot(
                    binbar,
                    col = cols[(pos < ac) + 1],
                    border = cols[(pos < ac) + 1],
                    names.arg = 0:range
                )
            },
            "exp" = {
                ac <- input$ac 
                cord.x <- c(-0)
                cord.x <- c(0,seq(0,ac,0.01),ac) 
                cord.y <- c(0,dexp(seq(0,ac,0.01), rate = p),0) 
                
                range <- qexp(0.999, rate=p)
                curve(dexp(x, rate = p), xlim= c(0, range), ylim = c(0, p))
                polygon(cord.x,cord.y,col='green')
                
            }
        )
        
    })
}

# Run the application
shinyApp(ui = ui, server = server)
