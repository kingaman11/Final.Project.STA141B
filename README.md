# Final Project STA 141B


What I want to do with this project is to be able to get all the restaurants in Davis and than show an dataframe of whether the place is closed, the phone number, the rating, the display address, as well as the price. I will also display an word map as well. The main word map where the input is "-" is that it shows an wordmap of all the reviews of the restaurants in Davis. When you are more specific in your input, it will show the word map of the reviews that people have put down for that specific restaurant. This in particular is actually very helpful to me because I have always struggled with finding a place to eat as well as finding out what customers have to say as well as other factors such as the average reviews, if store is open, and how expensive the store is. I am very happy with this app, while it is simplistic, it very straightforward and people can gain a lot from that simplistic software design. This app makes it very easy to make my choice on food. Hopefully in the future I can expand it to include other cities such as my hometown Fremont,California or even by counties.

All of this data has been produced from the YELP API Developers version.

The final output is at this link: https://amanorsingh1.shinyapps.io/FinalSTA141B/

The full word map of all the reviews of restaurants in Davis.

<img width="1398" alt="Screen Shot 2021-03-14 at 8 18 03 AM" src="https://user-images.githubusercontent.com/50162348/111073885-cda7f300-849d-11eb-8fd5-4fc9c03999da.png">

The word map of reviews of an specific restaurant in Davis aka my favorite restaurant being Burgers & Brew.

<img width="1440" alt="Screen Shot 2021-03-14 at 8 20 01 AM" src="https://user-images.githubusercontent.com/50162348/111073945-13fd5200-849e-11eb-8d84-88a94acc43b0.png">








```{r}
r1 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[1]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json1 <- httr::content(r1, as = "text", encoding = "UTF-8")

a = tibble("Name" = fromJSON(json1, flatten = TRUE)$name,"Display Phone" = fromJSON(json1, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json1, flatten = TRUE)$rating,"Location"=fromJSON(json1, flatten = TRUE)$location$address1,"Price"=fromJSON(json1, flatten = TRUE)$price,"Transactions"=fromJSON(json1, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json1, flatten = TRUE)$is_closed)

r2 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[2]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json2 <- httr::content(r2, as = "text", encoding = "UTF-8")

b = tibble("Name" = fromJSON(json2, flatten = TRUE)$name,"Display Phone" = fromJSON(json2, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json2, flatten = TRUE)$rating,"Location"=fromJSON(json2, flatten = TRUE)$location$address1,"Price"=fromJSON(json2, flatten = TRUE)$price,"Transactions"=fromJSON(json2, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json2, flatten = TRUE)$is_closed)


r3 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[3]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json3 <- httr::content(r3, as = "text", encoding = "UTF-8")

c = tibble("Name" = fromJSON(json3, flatten = TRUE)$name,"Display Phone" = fromJSON(json3, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json3, flatten = TRUE)$rating,"Location"=fromJSON(json3, flatten = TRUE)$location$address1,"Price"=fromJSON(json3, flatten = TRUE)$price,"Transactions"=fromJSON(json3, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json3, flatten = TRUE)$is_closed)

r4 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[4]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json4 <- httr::content(r4, as = "text", encoding = "UTF-8")
d = tibble("Name" = fromJSON(json4, flatten = TRUE)$name,"Display Phone" = fromJSON(json4, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json4, flatten = TRUE)$rating,"Location"=fromJSON(json4, flatten = TRUE)$location$address1,"Price"=fromJSON(json4, flatten = TRUE)$price,"Transactions"=fromJSON(json4, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json4, flatten = TRUE)$is_closed)

r5 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[5]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json5 <- httr::content(r5, as = "text", encoding = "UTF-8")

e = tibble("Name" = fromJSON(json5, flatten = TRUE)$name,"Display Phone" = fromJSON(json5, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json5, flatten = TRUE)$rating,"Location"=fromJSON(json5, flatten = TRUE)$location$address1,"Price"=fromJSON(json5, flatten = TRUE)$price,"Transactions"=fromJSON(json5, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json5, flatten = TRUE)$is_closed)

r6 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[6]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json6 <- httr::content(r6, as = "text", encoding = "UTF-8")

f = tibble("Name" = fromJSON(json6, flatten = TRUE)$name,"Display Phone" = fromJSON(json6, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json6, flatten = TRUE)$rating,"Location"=fromJSON(json6, flatten = TRUE)$location$address1,"Price"=fromJSON(json6, flatten = TRUE)$price,"Transactions"=fromJSON(json6, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json6, flatten = TRUE)$is_closed)

r7 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[7]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json7 <- httr::content(r7, as = "text", encoding = "UTF-8")


g = tibble("Name" = fromJSON(json7, flatten = TRUE)$name,"Display Phone" = fromJSON(json7, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json7, flatten = TRUE)$rating,"Location"=fromJSON(json7, flatten = TRUE)$location$address1,"Price"=fromJSON(json7, flatten = TRUE)$price,"Transactions"=fromJSON(json7, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json7, flatten = TRUE)$is_closed)


r8 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[8]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json8 <- httr::content(r8, as = "text", encoding = "UTF-8")

h = tibble("Name" = fromJSON(json8, flatten = TRUE)$name,"Display Phone" = fromJSON(json8, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json8, flatten = TRUE)$rating,"Location"=fromJSON(json8, flatten = TRUE)$location$address1,"Price"=fromJSON(json8, flatten = TRUE)$price,"Transactions"=fromJSON(json8, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json8, flatten = TRUE)$is_closed)

r9 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[9]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json9 <- httr::content(r9, as = "text", encoding = "UTF-8")

i = tibble("Name" = fromJSON(json9, flatten = TRUE)$name,"Display Phone" = fromJSON(json9, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json9, flatten = TRUE)$rating,"Location"=fromJSON(json9, flatten = TRUE)$location$address1,"Price"=fromJSON(json9, flatten = TRUE)$price,"Transactions"=fromJSON(json9, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json9, flatten = TRUE)$is_closed)

r10 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[10]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json10 <- httr::content(r10, as = "text", encoding = "UTF-8")

e = tibble("Name" = fromJSON(json10, flatten = TRUE)$name,"Display Phone" = fromJSON(json10, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json10, flatten = TRUE)$rating,"Location"=fromJSON(json10, flatten = TRUE)$location$address1,"Price"=fromJSON(json10, flatten = TRUE)$price,"Transactions"=fromJSON(json10, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json10, flatten = TRUE)$is_closed)

r11 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[11]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json11 <- httr::content(r11, as = "text", encoding = "UTF-8")

f = tibble("Name" = fromJSON(json11, flatten = TRUE)$name,"Display Phone" = fromJSON(json11, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json11, flatten = TRUE)$rating,"Location"=fromJSON(json11, flatten = TRUE)$location$address1,"Price"=fromJSON(json11, flatten = TRUE)$price,"Transactions"=fromJSON(json11, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json11, flatten = TRUE)$is_closed)

r12 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[12]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json12 <- httr::content(r12, as = "text", encoding = "UTF-8")

g = tibble("Name" = fromJSON(json12, flatten = TRUE)$name,"Display Phone" = fromJSON(json12, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json12, flatten = TRUE)$rating,"Location"=fromJSON(json12, flatten = TRUE)$location$address1,"Price"=fromJSON(json12, flatten = TRUE)$price,"Transactions"=fromJSON(json12, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json12, flatten = TRUE)$is_closed)

r13 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[13]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json13 <- httr::content(r13, as = "text", encoding = "UTF-8")

h = tibble("Name" = fromJSON(json13, flatten = TRUE)$name,"Display Phone" = fromJSON(json13, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json13, flatten = TRUE)$rating,"Location"=fromJSON(json13, flatten = TRUE)$location$address1,"Price"=fromJSON(json13, flatten = TRUE)$price,"Transactions"=fromJSON(json13, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json13, flatten = TRUE)$is_closed)

r14 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[14]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json14 <- httr::content(r14, as = "text", encoding = "UTF-8")

i = tibble("Name" = fromJSON(json14, flatten = TRUE)$name,"Display Phone" = fromJSON(json14, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json14, flatten = TRUE)$rating,"Location"=fromJSON(json14, flatten = TRUE)$location$address1,"Price"=fromJSON(json14, flatten = TRUE)$price,"Transactions"=fromJSON(json14, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json14, flatten = TRUE)$is_closed)

r15 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[15]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json15 <- httr::content(r15, as = "text", encoding = "UTF-8")

j = tibble("Name" = fromJSON(json15, flatten = TRUE)$name,"Display Phone" = fromJSON(json15, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json15, flatten = TRUE)$rating,"Location"=fromJSON(json15, flatten = TRUE)$location$address1,"Price"=fromJSON(json15, flatten = TRUE)$price,"Transactions"=fromJSON(json15, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json15, flatten = TRUE)$is_closed)

r16 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[16]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json16 <- httr::content(r16, as = "text", encoding = "UTF-8")

k = tibble("Name" = fromJSON(json16, flatten = TRUE)$name,"Display Phone" = fromJSON(json16, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json16, flatten = TRUE)$rating,"Location"=fromJSON(json16, flatten = TRUE)$location$address1,"Price"=fromJSON(json16, flatten = TRUE)$price,"Transactions"=fromJSON(json16, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json16, flatten = TRUE)$is_closed)

r17 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[17]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json17 <- httr::content(r17, as = "text", encoding = "UTF-8")

l = tibble("Name" = fromJSON(json17, flatten = TRUE)$name,"Display Phone" = fromJSON(json17, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json17, flatten = TRUE)$rating,"Location"=fromJSON(json17, flatten = TRUE)$location$address1,"Price"=fromJSON(json17, flatten = TRUE)$price,"Transactions"=fromJSON(json17, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json17, flatten = TRUE)$is_closed)


r18 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[18]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json18 <- httr::content(r18, as = "text", encoding = "UTF-8")

m = tibble("Name" = fromJSON(json18, flatten = TRUE)$name,"Display Phone" = fromJSON(json18, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json18, flatten = TRUE)$rating,"Location"=fromJSON(json18, flatten = TRUE)$location$address1,"Price"=fromJSON(json18, flatten = TRUE)$price,"Transactions"=fromJSON(json18, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json18, flatten = TRUE)$is_closed)

r19 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[19]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json19 <- httr::content(r19, as = "text", encoding = "UTF-8")

n = tibble("Name" = fromJSON(json19, flatten = TRUE)$name,"Display Phone" = fromJSON(json19, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json19, flatten = TRUE)$rating,"Location"=fromJSON(json19, flatten = TRUE)$location$address1,"Price"=fromJSON(json19, flatten = TRUE)$price,"Transactions"=fromJSON(json19, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json19, flatten = TRUE)$is_closed)

r20 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[20]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json20 <- httr::content(r20, as = "text", encoding = "UTF-8")

o = tibble("Name" = fromJSON(json20, flatten = TRUE)$name,"Display Phone" = fromJSON(json20, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json20, flatten = TRUE)$rating,"Location"=fromJSON(json20, flatten = TRUE)$location$address1,"Price"=fromJSON(json20, flatten = TRUE)$price,"Transactions"=fromJSON(json20, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json20, flatten = TRUE)$is_closed)


r21 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[21]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json21 <- httr::content(r21, as = "text", encoding = "UTF-8")

p = tibble("Name" = fromJSON(json21, flatten = TRUE)$name,"Display Phone" = fromJSON(json21, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json21, flatten = TRUE)$rating,"Location"=fromJSON(json21, flatten = TRUE)$location$address1,"Price"=fromJSON(json21, flatten = TRUE)$price,"Transactions"=fromJSON(json21, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json21, flatten = TRUE)$is_closed)

r22 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[22]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json22 <- httr::content(r22, as = "text", encoding = "UTF-8")

q = tibble("Name" = fromJSON(json22, flatten = TRUE)$name,"Display Phone" = fromJSON(json22, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json22, flatten = TRUE)$rating,"Location"=fromJSON(json22, flatten = TRUE)$location$address1,"Price"=fromJSON(json22, flatten = TRUE)$price,"Transactions"=fromJSON(json22, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json22, flatten = TRUE)$is_closed)

r23 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[23]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json23 <- httr::content(r23, as = "text", encoding = "UTF-8")

r = tibble("Name" = fromJSON(json23, flatten = TRUE)$name,"Display Phone" = fromJSON(json23, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json23, flatten = TRUE)$rating,"Location"=fromJSON(json23, flatten = TRUE)$location$address1,"Price"=fromJSON(json23, flatten = TRUE)$price,"Transactions"=fromJSON(json23, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json23, flatten = TRUE)$is_closed)

r24 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[24]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json24 <- httr::content(r24, as = "text", encoding = "UTF-8")

s = tibble("Name" = fromJSON(json24, flatten = TRUE)$name,"Display Phone" = fromJSON(json24, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json24, flatten = TRUE)$rating,"Location"=fromJSON(json24, flatten = TRUE)$location$address1,"Price"=fromJSON(json24, flatten = TRUE)$price,"Transactions"=fromJSON(json24, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json24, flatten = TRUE)$is_closed)

r25 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[25]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json25 <- httr::content(r25, as = "text", encoding = "UTF-8")

t = tibble("Name" = fromJSON(json25, flatten = TRUE)$name,"Display Phone" = fromJSON(json25, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json25, flatten = TRUE)$rating,"Location"=fromJSON(json25, flatten = TRUE)$location$address1,"Price"=fromJSON(json25, flatten = TRUE)$price,"Transactions"=fromJSON(json25, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json25, flatten = TRUE)$is_closed)

r26 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[26]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json26 <- httr::content(r26, as = "text", encoding = "UTF-8")

u = tibble("Name" = fromJSON(json26, flatten = TRUE)$name,"Display Phone" = fromJSON(json26, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json26, flatten = TRUE)$rating,"Location"=fromJSON(json26, flatten = TRUE)$location$address1,"Price"=fromJSON(json26, flatten = TRUE)$price,"Transactions"=fromJSON(json26, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json26, flatten = TRUE)$is_closed)

r27 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[27]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json27 <- httr::content(r27, as = "text", encoding = "UTF-8")

v = tibble("Name" = fromJSON(json27, flatten = TRUE)$name,"Display Phone" = fromJSON(json27, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json27, flatten = TRUE)$rating,"Location"=fromJSON(json27, flatten = TRUE)$location$address1,"Price"=fromJSON(json27, flatten = TRUE)$price,"Transactions"=fromJSON(json27, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json27, flatten = TRUE)$is_closed)

r28 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[28]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json28 <- httr::content(r28, as = "text", encoding = "UTF-8")

w = tibble("Name" = fromJSON(json28, flatten = TRUE)$name,"Display Phone" = fromJSON(json28, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json28, flatten = TRUE)$rating,"Location"=fromJSON(json28, flatten = TRUE)$location$address1,"Price"=fromJSON(json28, flatten = TRUE)$price,"Transactions"=fromJSON(json28, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json28, flatten = TRUE)$is_closed)

r29 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[29]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json29 <- httr::content(r29, as = "text", encoding = "UTF-8")

x1 = tibble("Name" = fromJSON(json29, flatten = TRUE)$name,"Display Phone" = fromJSON(json29, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json29, flatten = TRUE)$rating,"Location"=fromJSON(json29, flatten = TRUE)$location$address1,"Price"=fromJSON(json29, flatten = TRUE)$price,"Transactions"=fromJSON(json29, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json29, flatten = TRUE)$is_closed)

r30 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[30]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json30 <- httr::content(r30, as = "text", encoding = "UTF-8")

y = tibble("Name" = fromJSON(json30, flatten = TRUE)$name,"Display Phone" = fromJSON(json30, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json30, flatten = TRUE)$rating,"Location"=fromJSON(json30, flatten = TRUE)$location$address1,"Price"=fromJSON(json30, flatten = TRUE)$price,"Transactions"=fromJSON(json30, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json30, flatten = TRUE)$is_closed)

r31 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[31]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json31 <- httr::content(r31, as = "text", encoding = "UTF-8")

z1 = tibble("Name" = fromJSON(json31, flatten = TRUE)$name,"Display Phone" = fromJSON(json31, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json31, flatten = TRUE)$rating,"Location"=fromJSON(json31, flatten = TRUE)$location$address1,"Price"=fromJSON(json31, flatten = TRUE)$price,"Transactions"=fromJSON(json31, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json31, flatten = TRUE)$is_closed)

r32 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[32]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json32 <- httr::content(r32, as = "text", encoding = "UTF-8")

a1 = tibble("Name" = fromJSON(json32, flatten = TRUE)$name,"Display Phone" = fromJSON(json32, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json32, flatten = TRUE)$rating,"Location"=fromJSON(json32, flatten = TRUE)$location$address1,"Price"=fromJSON(json32, flatten = TRUE)$price,"Transactions"=fromJSON(json32, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json32, flatten = TRUE)$is_closed)

r33 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[33]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json33 <- httr::content(r33, as = "text", encoding = "UTF-8")

b1 = tibble("Name" = fromJSON(json33, flatten = TRUE)$name,"Display Phone" = fromJSON(json33, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json33, flatten = TRUE)$rating,"Location"=fromJSON(json33, flatten = TRUE)$location$address1,"Price"=fromJSON(json33, flatten = TRUE)$price,"Transactions"=fromJSON(json33, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json33, flatten = TRUE)$is_closed)

r34 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[34]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json34 <- httr::content(r34, as = "text", encoding = "UTF-8")

c1 = tibble("Name" = fromJSON(json34, flatten = TRUE)$name,"Display Phone" = fromJSON(json34, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json34, flatten = TRUE)$rating,"Location"=fromJSON(json34, flatten = TRUE)$location$address1,"Price"=fromJSON(json34, flatten = TRUE)$price,"Transactions"=fromJSON(json34, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json34, flatten = TRUE)$is_closed)


r35 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[35]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json35 <- httr::content(r35, as = "text", encoding = "UTF-8")

d1 = tibble("Name" = fromJSON(json35, flatten = TRUE)$name,"Display Phone" = fromJSON(json35, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json35, flatten = TRUE)$rating,"Location"=fromJSON(json35, flatten = TRUE)$location$address1,"Price"=fromJSON(json35, flatten = TRUE)$price,"Transactions"=fromJSON(json35, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json35, flatten = TRUE)$is_closed)

r36 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[36]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json36 <- httr::content(r36, as = "text", encoding = "UTF-8")

e1 = tibble("Name" = fromJSON(json36, flatten = TRUE)$name,"Display Phone" = fromJSON(json36, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json36, flatten = TRUE)$rating,"Location"=fromJSON(json36, flatten = TRUE)$location$address1,"Price"=fromJSON(json36, flatten = TRUE)$price,"Transactions"=fromJSON(json36, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json36, flatten = TRUE)$is_closed)

r37 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[37]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json37 <- httr::content(r37, as = "text", encoding = "UTF-8")

f1 = tibble("Name" = fromJSON(json37, flatten = TRUE)$name,"Display Phone" = fromJSON(json37, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json37, flatten = TRUE)$rating,"Location"=fromJSON(json37, flatten = TRUE)$location$address1,"Price"=fromJSON(json37, flatten = TRUE)$price,"Transactions"=fromJSON(json37, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json37, flatten = TRUE)$is_closed)

r38 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[38]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json38 <- httr::content(r38, as = "text", encoding = "UTF-8")

g1 = tibble("Name" = fromJSON(json38, flatten = TRUE)$name,"Display Phone" = fromJSON(json38, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json38, flatten = TRUE)$rating,"Location"=fromJSON(json38, flatten = TRUE)$location$address1,"Price"=fromJSON(json38, flatten = TRUE)$price,"Transactions"=fromJSON(json38, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json38, flatten = TRUE)$is_closed)


r39 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[35]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json39 <- httr::content(r39, as = "text", encoding = "UTF-8")

h1 = tibble("Name" = fromJSON(json39, flatten = TRUE)$name,"Display Phone" = fromJSON(json39, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json39, flatten = TRUE)$rating,"Location"=fromJSON(json39, flatten = TRUE)$location$address1,"Price"=fromJSON(json39, flatten = TRUE)$price,"Transactions"=fromJSON(json39, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json39, flatten = TRUE)$is_closed)


r40 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[40]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json40 <- httr::content(r40, as = "text", encoding = "UTF-8")

i1 = tibble("Name" = fromJSON(json40, flatten = TRUE)$name,"Display Phone" = fromJSON(json40, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json40, flatten = TRUE)$rating,"Location"=fromJSON(json40, flatten = TRUE)$location$address1,"Price"=fromJSON(json40, flatten = TRUE)$price,"Transactions"=fromJSON(json40, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json40, flatten = TRUE)$is_closed)

r41 <- GET(
  str_glue("https://api.yelp.com/v3/businesses/{id}",id=x[41]),
  add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
  query = list(
  )
)
json35 <- httr::content(r41, as = "text", encoding = "UTF-8")

d1 = tibble("Name" = fromJSON(json41, flatten = TRUE)$name,"Display Phone" = fromJSON(json41, flatten = TRUE)$display_phone,"Average Rating"=fromJSON(json41, flatten = TRUE)$rating,"Location"=fromJSON(json41, flatten = TRUE)$location$address1,"Price"=fromJSON(json41, flatten = TRUE)$price,"Transactions"=fromJSON(json41, flatten = TRUE)$transactions,"If Store is closed currently"=fromJSON(json41, flatten = TRUE)$is_closed)








z = tibble("Name" = c(a$Name,b$Name,c$Name,d$Name,e$Name,f$Name,g$Name,h$Name,i$Name,j$Name,k$Name,l$Name,m$Name,n$Name,o$Name),"Display Phone" = c(a$`Display Phone`,b$`Display Phone`,c$`Display Phone`,d$`Display Phone`,e$`Display Phone`,f$`Display Phone`,g$`Display Phone`,h$`Display Phone`,i$`Display Phone`,j$`Display Phone`,k$`Display Phone`,l$`Display Phone`,m$`Display Phone`,n$`Display Phone`,o$`Display Phone`),"Average Rating"=c(a$`Average Rating`,b$`Average Rating`,c$`Average Rating`,d$`Average Rating`,e$`Average Rating`,f$`Average Rating`,g$`Average Rating`,h$`Average Rating`,i$`Average Rating`,j$`Average Rating`,k$`Average Rating`,l$`Average Rating`,m$`Average Rating`,n$`Average Rating`,o$`Average Rating`),"Location"=c(a$Location,b$Location,c$Location,d$Location,e$Location,f$Location,g$Location,h$Location,i$Location,j$Location,j$Location,k$Location,l$Location,m$Location,n$Location,o$Location),"Price"=c(a$Price,b$Price,c$Price,d$Price,e$Price,f$Price,g$Price,h$Price,i$Price,j$Price,k$Price,l$Price,m$Price,n$Price,o$Price),"Transactions"=c(a$Transactions,b$Transactions,c$Transactions,d$Transactions,e$Transactions,f$Transactions,g$Transactions,h$Transactions,i$Transactions,j$Transactions,k$Transactions,l$Transactions,m$Transactions,n$Transactions,o$Transactions),"If Store is closed currently"=c(a$`If Store is closed currently`,b$`If Store is closed currently`,c$`If Store is closed currently`,d$`If Store is closed currently`,e$`If Store is closed currently`,f$`If Store is closed currently`,g$`If Store is closed currently`,h$`If Store is closed currently`,i$`If Store is closed currently`,j$`If Store is closed currently`,k$`If Store is closed currently`,l$`If Store is closed currently`,m$`If Store is closed currently`,n$`If Store is closed currently`,o$`If Store is closed currently` ))

z$`If Store is closed currently` = ifelse(z$`If Store is closed currently`=="FALSE","OPEN","CLOSED")
```
