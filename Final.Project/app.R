#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(jsonlite)
library(tidyverse)
library(httr)
library(shiny)
library(tm)
library(SnowballC)
library(wordcloud)
library(RCurl)
library(XML)
library(wordcloud)
library(RColorBrewer)

r <- GET(
    "https://api.yelp.com/v3/businesses/search",
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        location = "Davis"
    )
)

json <- httr::content(r, as = "text")
fromJSON(json, flatten = TRUE)$businesses %>% select(name,id)
x = fromJSON(json, flatten = TRUE)$businesses %>% select(id)
low = fromJSON(json, flatten = TRUE)$businesses %>% select(name)
x = x[1:20,]

r1 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[1]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json1 <- httr::content(r1, as = "text")

a = tibble("Name" = fromJSON(json1, flatten = TRUE)$name,"Display Phone" = fromJSON(json1, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json1, flatten = TRUE)$rating,"Location"=fromJSON(json1, flatten = TRUE)$location$address1,"Price"=fromJSON(json1, flatten = TRUE)$price,"Transactions"=fromJSON(json1, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json1, flatten = TRUE)$is_closed)

r2 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[2]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json2 <- httr::content(r2, as = "text")

b = tibble("Name" = fromJSON(json2, flatten = TRUE)$name,"Display Phone" = fromJSON(json2, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json2, flatten = TRUE)$rating,"Location"=fromJSON(json2, flatten = TRUE)$location$address1,"Price"=fromJSON(json2, flatten = TRUE)$price,"Transactions"=fromJSON(json2, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json2, flatten = TRUE)$is_closed)


r3 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[3]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json3 <- httr::content(r3, as = "text")

c = tibble("Name" = fromJSON(json3, flatten = TRUE)$name,"Display Phone" = fromJSON(json3, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json3, flatten = TRUE)$rating,"Location"=fromJSON(json3, flatten = TRUE)$location$address1,"Price"=fromJSON(json3, flatten = TRUE)$price,"Transactions"=fromJSON(json3, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json3, flatten = TRUE)$is_closed)

r4 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[4]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json4 <- httr::content(r4, as = "text")
d = tibble("Name" = fromJSON(json4, flatten = TRUE)$name,"Display Phone" = fromJSON(json4, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json4, flatten = TRUE)$rating,"Location"=fromJSON(json4, flatten = TRUE)$location$address1,"Price"=fromJSON(json4, flatten = TRUE)$price,"Transactions"=fromJSON(json4, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json4, flatten = TRUE)$is_closed)

r5 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[5]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json5 <- httr::content(r5, as = "text")

e = tibble("Name" = fromJSON(json5, flatten = TRUE)$name,"Display Phone" = fromJSON(json5, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json5, flatten = TRUE)$rating,"Location"=fromJSON(json5, flatten = TRUE)$location$address1,"Price"=fromJSON(json5, flatten = TRUE)$price,"Transactions"=fromJSON(json5, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json5, flatten = TRUE)$is_closed)

r6 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[6]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json6 <- httr::content(r6, as = "text")

f = tibble("Name" = fromJSON(json6, flatten = TRUE)$name,"Display Phone" = fromJSON(json6, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json6, flatten = TRUE)$rating,"Location"=fromJSON(json6, flatten = TRUE)$location$address1,"Price"=fromJSON(json6, flatten = TRUE)$price,"Transactions"=fromJSON(json6, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json6, flatten = TRUE)$is_closed)

r7 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[7]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json7 <- httr::content(r7, as = "text")


g = tibble("Name" = fromJSON(json7, flatten = TRUE)$name,"Display Phone" = fromJSON(json7, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json7, flatten = TRUE)$rating,"Location"=fromJSON(json7, flatten = TRUE)$location$address1,"Price"=fromJSON(json7, flatten = TRUE)$price,"Transactions"=fromJSON(json7, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json7, flatten = TRUE)$is_closed)


r8 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[8]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json8 <- httr::content(r8, as = "text")

h = tibble("Name" = fromJSON(json8, flatten = TRUE)$name,"Display Phone" = fromJSON(json8, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json8, flatten = TRUE)$rating,"Location"=fromJSON(json8, flatten = TRUE)$location$address1,"Price"=fromJSON(json8, flatten = TRUE)$price,"Transactions"=fromJSON(json8, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json8, flatten = TRUE)$is_closed)

r9 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[9]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json9 <- httr::content(r9, as = "text")

i = tibble("Name" = fromJSON(json9, flatten = TRUE)$name,"Display Phone" = fromJSON(json9, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json9, flatten = TRUE)$rating,"Location"=fromJSON(json9, flatten = TRUE)$location$address1,"Price"=fromJSON(json9, flatten = TRUE)$price,"Transactions"=fromJSON(json9, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json9, flatten = TRUE)$is_closed)

r10 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[10]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json10 <- httr::content(r10, as = "text")

e = tibble("Name" = fromJSON(json10, flatten = TRUE)$name,"Display Phone" = fromJSON(json10, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json10, flatten = TRUE)$rating,"Location"=fromJSON(json10, flatten = TRUE)$location$address1,"Price"=fromJSON(json10, flatten = TRUE)$price,"Transactions"=fromJSON(json10, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json10, flatten = TRUE)$is_closed)

r11 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[11]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json11 <- httr::content(r11, as = "text")

f = tibble("Name" = fromJSON(json11, flatten = TRUE)$name,"Display Phone" = fromJSON(json11, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json11, flatten = TRUE)$rating,"Location"=fromJSON(json11, flatten = TRUE)$location$address1,"Price"=fromJSON(json11, flatten = TRUE)$price,"Transactions"=fromJSON(json11, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json11, flatten = TRUE)$is_closed)

r12 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[12]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json12 <- httr::content(r12, as = "text")

g = tibble("Name" = fromJSON(json12, flatten = TRUE)$name,"Display Phone" = fromJSON(json12, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json12, flatten = TRUE)$rating,"Location"=fromJSON(json12, flatten = TRUE)$location$address1,"Price"=fromJSON(json12, flatten = TRUE)$price,"Transactions"=fromJSON(json12, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json12, flatten = TRUE)$is_closed)

r13 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[13]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json13 <- httr::content(r13, as = "text")

h = tibble("Name" = fromJSON(json13, flatten = TRUE)$name,"Display Phone" = fromJSON(json13, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json13, flatten = TRUE)$rating,"Location"=fromJSON(json13, flatten = TRUE)$location$address1,"Price"=fromJSON(json13, flatten = TRUE)$price,"Transactions"=fromJSON(json13, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json13, flatten = TRUE)$is_closed)

r14 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[14]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json14 <- httr::content(r14, as = "text")

i = tibble("Name" = fromJSON(json14, flatten = TRUE)$name,"Display Phone" = fromJSON(json14, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json14, flatten = TRUE)$rating,"Location"=fromJSON(json14, flatten = TRUE)$location$address1,"Price"=fromJSON(json14, flatten = TRUE)$price,"Transactions"=fromJSON(json14, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json14, flatten = TRUE)$is_closed)

r15 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[15]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json15 <- httr::content(r15, as = "text")

j = tibble("Name" = fromJSON(json15, flatten = TRUE)$name,"Display Phone" = fromJSON(json15, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json15, flatten = TRUE)$rating,"Location"=fromJSON(json15, flatten = TRUE)$location$address1,"Price"=fromJSON(json15, flatten = TRUE)$price,"Transactions"=fromJSON(json15, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json15, flatten = TRUE)$is_closed)

r16 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[16]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json16 <- httr::content(r16, as = "text")

k = tibble("Name" = fromJSON(json16, flatten = TRUE)$name,"Display Phone" = fromJSON(json16, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json16, flatten = TRUE)$rating,"Location"=fromJSON(json16, flatten = TRUE)$location$address1,"Price"=fromJSON(json16, flatten = TRUE)$price,"Transactions"=fromJSON(json16, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json16, flatten = TRUE)$is_closed)

r17 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[17]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json17 <- httr::content(r17, as = "text")

l = tibble("Name" = fromJSON(json17, flatten = TRUE)$name,"Display Phone" = fromJSON(json17, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json17, flatten = TRUE)$rating,"Location"=fromJSON(json17, flatten = TRUE)$location$address1,"Price"=fromJSON(json17, flatten = TRUE)$price,"Transactions"=fromJSON(json17, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json17, flatten = TRUE)$is_closed)


r18 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[18]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json18 <- httr::content(r18, as = "text")

m = tibble("Name" = fromJSON(json18, flatten = TRUE)$name,"Display Phone" = fromJSON(json18, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json18, flatten = TRUE)$rating,"Location"=fromJSON(json18, flatten = TRUE)$location$address1,"Price"=fromJSON(json18, flatten = TRUE)$price,"Transactions"=fromJSON(json18, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json18, flatten = TRUE)$is_closed)

r19 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[19]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json19 <- httr::content(r19, as = "text")

n = tibble("Name" = fromJSON(json19, flatten = TRUE)$name,"Display Phone" = fromJSON(json19, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json19, flatten = TRUE)$rating,"Location"=fromJSON(json19, flatten = TRUE)$location$address1,"Price"=fromJSON(json19, flatten = TRUE)$price,"Transactions"=fromJSON(json19, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json19, flatten = TRUE)$is_closed)

r20 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[20]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
    )
)
json20 <- httr::content(r20, as = "text")

o = tibble("Name" = fromJSON(json20, flatten = TRUE)$name,"Display Phone" = fromJSON(json20, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json20, flatten = TRUE)$rating,"Location"=fromJSON(json20, flatten = TRUE)$location$address1,"Price"=fromJSON(json20, flatten = TRUE)$price,"Transactions"=fromJSON(json20, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json20, flatten = TRUE)$is_closed)

z = tibble("Name" = c(a$Name,b$Name,c$Name,d$Name,e$Name,f$Name,g$Name,h$Name,i$Name,j$Name,k$Name,l$Name,m$Name,n$Name,o$Name),"Display Phone" = c(a$`Display Phone`,b$`Display Phone`,c$`Display Phone`,d$`Display Phone`,e$`Display Phone`,f$`Display Phone`,g$`Display Phone`,h$`Display Phone`,i$`Display Phone`,j$`Display Phone`,k$`Display Phone`,l$`Display Phone`,m$`Display Phone`,n$`Display Phone`,o$`Display Phone`),"Average Rating"=c(a$`Average Rating`,b$`Average Rating`,c$`Average Rating`,d$`Average Rating`,e$`Average Rating`,f$`Average Rating`,g$`Average Rating`,h$`Average Rating`,i$`Average Rating`,j$`Average Rating`,k$`Average Rating`,l$`Average Rating`,m$`Average Rating`,n$`Average Rating`,o$`Average Rating`),"Location"=c(a$Location,b$Location,c$Location,d$Location,e$Location,f$Location,g$Location,h$Location,i$Location,j$Location,j$Location,k$Location,l$Location,m$Location,n$Location,o$Location),"Price"=c(a$Price,b$Price,c$Price,d$Price,e$Price,f$Price,g$Price,h$Price,i$Price,j$Price,k$Price,l$Price,m$Price,n$Price,o$Price),"Transactions"=c(a$Transactions,b$Transactions,c$Transactions,d$Transactions,e$Transactions,f$Transactions,g$Transactions,h$Transactions,i$Transactions,j$Transactions,k$Transactions,l$Transactions,m$Transactions,n$Transactions,o$Transactions),"If Store is closed currently"=c(a$`If Store is closed currently`,b$`If Store is closed currently`,c$`If Store is closed currently`,d$`If Store is closed currently`,e$`If Store is closed currently`,f$`If Store is closed currently`,g$`If Store is closed currently`,h$`If Store is closed currently`,i$`If Store is closed currently`,j$`If Store is closed currently`,k$`If Store is closed currently`,l$`If Store is closed currently`,m$`If Store is closed currently`,n$`If Store is closed currently`,o$`If Store is closed currently` ))







ui <- fluidPage(

    # Application title
    titlePanel("Information for Restaurants in Davis, California"),
    h4(tags$a(href = "https://www.linkedin.com/in/amanorsingh/", "Aman Singh")),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("NameofRestaurant", "Name of Restaurant", choices = c("-",z$Name))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
            tableOutput("cool")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$cool <- renderTable({
        z_filter = subset(z,z$Name == input$NameofRestaurant)
    })
    
    output$plot <- renderPlot({
        wordcloud(final_words,max.words = 100,min.freq = 15,colors=brewer.pal(8, "Dark2"))
    })
    
        
}

# Run the application 
shinyApp(ui = ui, server = server)
