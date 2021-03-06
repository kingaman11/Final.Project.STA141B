library(jsonlite)
library(tidyverse)
library(httr)
library(shiny)
library(tm)
library(wordcloud)
library(RCurl)
library(XML)
library(wordcloud)
library(RColorBrewer)
library(bslib)

#Yelp Token
Sys.setenv(YELP_TOKEN = "zB_vgAi6chPRyDfgrHXToL2GAUWb6EzginrW_2eQHoQnkMpONlPUon_F2wzH9YGgbYidaHkn3jMtqxh84YIhavfDHE0kajXKpSg5Nbm1p-98XVc2L59WW4BLV7idX3Yx")

#dataanalysis, had to manipulate some data
r <- GET(
    "https://api.yelp.com/v3/businesses/search",
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        location = "Davis",
        limit = "50"
    )
)

json <- httr::content(r, as = "text", encoding = "UTF-8")
x = fromJSON(json, flatten = TRUE)$businesses %>% select(id)
final = fromJSON(json, flatten = TRUE)$businesses[-26,] 
low = fromJSON(json, flatten = TRUE)$businesses[-26,] %>% select(name)
x = x[-26,]
z = tibble("Name" = final$name,"Display Phone" = final$display_phone, "Average Rating" = final$rating,"Location" = final$location.address1,"Price" = final$price,"If store is closed currently" = final$is_closed)
z$`If store is closed currently` = ifelse(z$`If store is closed currently`=="FALSE","Open","Closed")
z = as.data.frame(z)
final$price[is.na(final$price)] <- "$$"
final$categories.=final$categories[[1]][1,2]
final$categories.[2]=final$categories[[2]][1,2]
final$categories.[3]=final$categories[[3]][1,2]
final$categories.[4]=final$categories[[4]][1,2]
final$categories.[5]=final$categories[[5]][1,2]
final$categories.[6]=final$categories[[6]][1,2]
final$categories.[7]=final$categories[[7]][1,2]
final$categories.[8]=final$categories[[8]][1,2]
final$categories.[9]=final$categories[[9]][1,2]
final$categories.[10]=final$categories[[10]][1,2]
final$categories.[11]=final$categories[[11]][1,2]
final$categories.[12]=final$categories[[12]][1,2]
final$categories.[13]=final$categories[[13]][1,2]
final$categories.[14]=final$categories[[14]][1,2]
final$categories.[15]=final$categories[[15]][1,2]
final$categories.[16]=final$categories[[16]][1,2]
final$categories.[17]=final$categories[[17]][1,2]
final$categories.[18]=final$categories[[18]][1,2]
final$categories.[19]=final$categories[[19]][1,2]
final$categories.[20]=final$categories[[20]][1,2]
final$categories.[21]=final$categories[[21]][1,2]
final$categories.[22]=final$categories[[22]][1,2]
final$categories.[23]=final$categories[[23]][1,2]
final$categories.[24]=final$categories[[24]][1,2]
final$categories.[25]=final$categories[[25]][1,2]
final$categories.[26]=final$categories[[26]][1,2]
final$categories.[27]=final$categories[[27]][1,2]
final$categories.[28]=final$categories[[28]][1,2]
final$categories.[29]=final$categories[[29]][1,2]
final$categories.[30]=final$categories[[30]][1,2]
final$categories.[31]=final$categories[[31]][1,2]
final$categories.[32]=final$categories[[32]][1,2]
final$categories.[33]=final$categories[[33]][1,2]
final$categories.[34]=final$categories[[34]][1,2]
final$categories.[35]=final$categories[[35]][1,2]
final$categories.[36]=final$categories[[36]][1,2]
final$categories.[37]=final$categories[[37]][1,2]
final$categories.[38]=final$categories[[38]][1,2]
final$categories.[39]=final$categories[[39]][1,2]
final$categories.[40]=final$categories[[40]][1,2]
final$categories.[41]=final$categories[[41]][1,2]
final$categories.[42]=final$categories[[42]][1,2]
final$categories.[43]=final$categories[[43]][1,2]
final$categories.[44]=final$categories[[44]][1,2]
final$categories.[45]=final$categories[[45]][1,2]
final$categories.[46]=final$categories[[46]][1,2]
final$categories.[47]=final$categories[[47]][1,2]
final$categories.[48]=final$categories[[48]][1,2]
final$categories.[49]=final$categories[[49]][1,2]

r1 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[1]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r1)
json1 <- httr::content(r1, as = "text", encoding = "UTF-8")
word.1 = fromJSON(json1, flatten = TRUE)$reviews %>% select(text)
word.1 = paste(unlist(word.1), collapse =" ")
word1 = Corpus(VectorSource(word.1))
#res<-wordcloud(word1,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r2 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[2]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r2)
json2 <- httr::content(r2, as = "text", encoding = "UTF-8")
word.2 = fromJSON(json2, flatten = TRUE)$reviews %>% select(text)
word.2 = paste(unlist(word.2), collapse =" ")
word2 = Corpus(VectorSource(word.2))
#res<-wordcloud(word2,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r3 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[3]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r3)
json3 <- httr::content(r3, as = "text", encoding = "UTF-8")
word.3 = fromJSON(json3, flatten = TRUE)$reviews %>% select(text)
word.3 = paste(unlist(word.3), collapse =" ")
word3 = Corpus(VectorSource(word.3))
#res<-wordcloud(word3,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r4 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[4]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r4)
json4 <- httr::content(r4, as = "text", encoding = "UTF-8")
word.4 = fromJSON(json4, flatten = TRUE)$reviews %>% select(text)
word.4 = paste(unlist(word.4), collapse =" ")
word4 = Corpus(VectorSource(word.4))
#res<-wordcloud(word4,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r5 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[5]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r5)
json5 <- httr::content(r5, as = "text", encoding = "UTF-8")
word.5 = fromJSON(json5, flatten = TRUE)$reviews %>% select(text)
word.5 = paste(unlist(word.5), collapse =" ")
word5 = Corpus(VectorSource(word.5))
#res<-wordcloud(word5,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r6 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[6]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r6)
json6 <- httr::content(r6, as = "text", encoding = "UTF-8")
word.6 = fromJSON(json6, flatten = TRUE)$reviews %>% select(text)
word.6 = paste(unlist(word.6), collapse =" ")
word6 = Corpus(VectorSource(word.6))
#res<-wordcloud(word6,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r7 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[7]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r7)
json7 <- httr::content(r7, as = "text", encoding = "UTF-8")
word.7 = fromJSON(json7, flatten = TRUE)$reviews %>% select(text)
word.7 = paste(unlist(word.7), collapse =" ")
word7 = Corpus(VectorSource(word.7))
#res<-wordcloud(word7,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r8 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[8]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r8)
json8 <- httr::content(r8, as = "text", encoding = "UTF-8")
word.8 = fromJSON(json8, flatten = TRUE)$reviews %>% select(text)
word.8 = paste(unlist(word.8), collapse =" ")
word8 = Corpus(VectorSource(word.8))
#res<-wordcloud(word8,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))




r9 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[9]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r9)
json9 <- httr::content(r9, as = "text", encoding = "UTF-8")
word.9 = fromJSON(json9, flatten = TRUE)$reviews %>% select(text)
word.9 = paste(unlist(word.9), collapse =" ")
word9 = Corpus(VectorSource(word.9))
#res<-wordcloud(word9,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r10 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[10]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r10)
json10 <- httr::content(r10, as = "text", encoding = "UTF-8")
word.10 = fromJSON(json10, flatten = TRUE)$reviews %>% select(text)
word.10 = paste(unlist(word.10), collapse =" ")
word10 = Corpus(VectorSource(word.10))
#res<-wordcloud(word10,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))



r11 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[11]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r11)
json11 <- httr::content(r11, as = "text", encoding = "UTF-8")
word.11 = fromJSON(json11, flatten = TRUE)$reviews %>% select(text)
word.11 = paste(unlist(word.11), collapse =" ")
word11 = Corpus(VectorSource(word.11))
#res<-wordcloud(word11,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r12 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[12]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r12)
json12 <- httr::content(r12, as = "text", encoding = "UTF-8")
word.12 = fromJSON(json12, flatten = TRUE)$reviews %>% select(text)
word.12 = paste(unlist(word.12), collapse =" ")
word12 = Corpus(VectorSource(word.12))
#res<-wordcloud(word12,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r13 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[13]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r13)
json13 <- httr::content(r13, as = "text", encoding = "UTF-8")
word.13 = fromJSON(json13, flatten = TRUE)$reviews %>% select(text)
word.13 = paste(unlist(word.13), collapse =" ")
word13 = Corpus(VectorSource(word.13))
#res<-wordcloud(word13,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r14 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[14]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r14)
json14 <- httr::content(r14, as = "text", encoding = "UTF-8")
word.14 = fromJSON(json14, flatten = TRUE)$reviews %>% select(text)
word.14 = paste(unlist(word.14), collapse =" ")
word14 = Corpus(VectorSource(word.14))
#res<-wordcloud(word14,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r15 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[15]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r15)
json15 <- httr::content(r15, as = "text", encoding = "UTF-8")
word.15 = fromJSON(json15, flatten = TRUE)$reviews %>% select(text)
word.15 = paste(unlist(word.15), collapse =" ")
word15 = Corpus(VectorSource(word.15))
#res<-wordcloud(word15,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r16 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[16]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r16)
json16 <- httr::content(r16, as = "text", encoding = "UTF-8")
word.16 = fromJSON(json16, flatten = TRUE)$reviews %>% select(text)
word.16 = paste(unlist(word.16), collapse =" ")
word16 = Corpus(VectorSource(word.16))
#res<-wordcloud(word16,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r17 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[17]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r17)
json17 <- httr::content(r17, as = "text", encoding = "UTF-8")
word.17 = fromJSON(json5, flatten = TRUE)$reviews %>% select(text)
word.17 = paste(unlist(word.17), collapse =" ")
word17 = Corpus(VectorSource(word.17))
#res<-wordcloud(word17,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r18 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[18]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r18)
json18 <- httr::content(r18, as = "text", encoding = "UTF-8")
word.18 = fromJSON(json18, flatten = TRUE)$reviews %>% select(text)
word.18 = paste(unlist(word.18), collapse =" ")
word18 = Corpus(VectorSource(word.18))
#res<-wordcloud(word18,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r19 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[5]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r19)
json19 <- httr::content(r19, as = "text", encoding = "UTF-8")
word.19 = fromJSON(json19, flatten = TRUE)$reviews %>% select(text)
word.19 = paste(unlist(word.19), collapse =" ")
word19 = Corpus(VectorSource(word.19))
#res<-wordcloud(word19,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r20 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[20]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r20)
json20 <- httr::content(r20, as = "text", encoding = "UTF-8")
word.20 = fromJSON(json20, flatten = TRUE)$reviews %>% select(text)
word.20 = paste(unlist(word.20), collapse =" ")
word20 = Corpus(VectorSource(word.20))
#res<-wordcloud(word20,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r21 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[21]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r21)
json21 <- httr::content(r21, as = "text", encoding = "UTF-8")
word.21 = fromJSON(json21, flatten = TRUE)$reviews %>% select(text)
word.21 = paste(unlist(word.21), collapse =" ")
word21 = Corpus(VectorSource(word.21))
#res<-wordcloud(word21,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r22 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[22]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r22)
json22 <- httr::content(r22, as = "text", encoding = "UTF-8")
word.22 = fromJSON(json20, flatten = TRUE)$reviews %>% select(text)
word.22 = paste(unlist(word.22), collapse =" ")
word22 = Corpus(VectorSource(word.22))
#res<-wordcloud(word22,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r23 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[23]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r23)
json23 <- httr::content(r23, as = "text", encoding = "UTF-8")
word.23 = fromJSON(json23, flatten = TRUE)$reviews %>% select(text)
word.23 = paste(unlist(word.23), collapse =" ")
word23 = Corpus(VectorSource(word.23))
#res<-wordcloud(word23,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r24 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[24]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r24)
json24 <- httr::content(r24, as = "text", encoding = "UTF-8")
word.24 = fromJSON(json24, flatten = TRUE)$reviews %>% select(text)
word.24 = paste(unlist(word.24), collapse =" ")
word24 = Corpus(VectorSource(word.24))
#res<-wordcloud(word24,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r25 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[25]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r25)
json25 <- httr::content(r25, as = "text", encoding = "UTF-8")
word.25 = fromJSON(json25, flatten = TRUE)$reviews %>% select(text)
word.25 = paste(unlist(word.25), collapse =" ")
word25 = Corpus(VectorSource(word.25))
#res<-wordcloud(word25,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r26 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[26]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r26)
json26 <- httr::content(r26, as = "text", encoding = "UTF-8")
word.26 = fromJSON(json26, flatten = TRUE)$reviews %>% select(text)
word.26 = paste(unlist(word.26), collapse =" ")
word26 = Corpus(VectorSource(word.26))
#res<-wordcloud(word26,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r27 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[20]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r27)
json27 <- httr::content(r27, as = "text", encoding = "UTF-8")
word.27 = fromJSON(json27, flatten = TRUE)$reviews %>% select(text)
word.27 = paste(unlist(word.27), collapse =" ")
word27 = Corpus(VectorSource(word.27))
#res<-wordcloud(word27,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r28 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[28]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r28)
json28 <- httr::content(r28, as = "text", encoding = "UTF-8")
word.28 = fromJSON(json28, flatten = TRUE)$reviews %>% select(text)
word.28 = paste(unlist(word.28), collapse =" ")
word28 = Corpus(VectorSource(word.28))
#res<-wordcloud(word28,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r29 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[29]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r29)
json29 <- httr::content(r29, as = "text", encoding = "UTF-8")
word.29 = fromJSON(json29, flatten = TRUE)$reviews %>% select(text)
word.29 = paste(unlist(word.29), collapse =" ")
word29 = Corpus(VectorSource(word.29))
#res<-wordcloud(word29,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r30 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[30]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r30)
json30 <- httr::content(r30, as = "text", encoding = "UTF-8")
word.30 = fromJSON(json30, flatten = TRUE)$reviews %>% select(text)
word.30 = paste(unlist(word.30), collapse =" ")
word30 = Corpus(VectorSource(word.30))
#res<-wordcloud(word30,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r31 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[31]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r31)
json31 <- httr::content(r31, as = "text", encoding = "UTF-8")
word.31 = fromJSON(json31, flatten = TRUE)$reviews %>% select(text)
word.31 = paste(unlist(word.31), collapse =" ")
word31 = Corpus(VectorSource(word.31))
#res<-wordcloud(word31,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r32 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[32]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r32)
json32 <- httr::content(r32, as = "text", encoding = "UTF-8")
word.32 = fromJSON(json32, flatten = TRUE)$reviews %>% select(text)
word.32 = paste(unlist(word.32), collapse =" ")
word32 = Corpus(VectorSource(word.32))
#res<-wordcloud(word32,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r33 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[33]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r33)
json33 <- httr::content(r33, as = "text", encoding = "UTF-8")
word.33 = fromJSON(json33, flatten = TRUE)$reviews %>% select(text)
word.33 = paste(unlist(word.33), collapse =" ")
word33 = Corpus(VectorSource(word.33))
#res<-wordcloud(word33,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r34 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[34]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r34)
json34 <- httr::content(r34, as = "text", encoding = "UTF-8")
word.34 = fromJSON(json34, flatten = TRUE)$reviews %>% select(text)
word.34 = paste(unlist(word.34), collapse =" ")
word34 = Corpus(VectorSource(word.34))
#res<-wordcloud(word34,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r35 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[35]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r35)
json35 <- httr::content(r35, as = "text", encoding = "UTF-8")
word.35 = fromJSON(json35, flatten = TRUE)$reviews %>% select(text)
word.35 = paste(unlist(word.35), collapse =" ")
word35 = Corpus(VectorSource(word.35))
#res<-wordcloud(word35,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))


r36 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[36]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r36)
json36 <- httr::content(r36, as = "text", encoding = "UTF-8")
word.36 = fromJSON(json36, flatten = TRUE)$reviews %>% select(text)
word.36 = paste(unlist(word.36), collapse =" ")
word36 = Corpus(VectorSource(word.36))
#res<-wordcloud(word36,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r37 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[37]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r37)
json37 <- httr::content(r37, as = "text", encoding = "UTF-8")
word.37 = fromJSON(json37, flatten = TRUE)$reviews %>% select(text)
word.37 = paste(unlist(word.37), collapse =" ")
word37 = Corpus(VectorSource(word.37))
#res<-wordcloud(word37,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r38 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[38]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r38)
json38 <- httr::content(r38, as = "text", encoding = "UTF-8")
word.38 = fromJSON(json38, flatten = TRUE)$reviews %>% select(text)
word.38 = paste(unlist(word.38), collapse =" ")
word38 = Corpus(VectorSource(word.38))
#res<-wordcloud(word38,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r39 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[39]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r39)
json39 <- httr::content(r39, as = "text", encoding = "UTF-8")
word.39 = fromJSON(json39, flatten = TRUE)$reviews %>% select(text)
word.39 = paste(unlist(word.39), collapse =" ")
word39 = Corpus(VectorSource(word.39))
#res<-wordcloud(word39,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r40 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[40]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r40)
json40 <- httr::content(r40, as = "text", encoding = "UTF-8")
word.40 = fromJSON(json40, flatten = TRUE)$reviews %>% select(text)
word.40 = paste(unlist(word.40), collapse =" ")
word40 = Corpus(VectorSource(word.40))
#res<-wordcloud(word40,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r41 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[41]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r41)
json41 <- httr::content(r41, as = "text", encoding = "UTF-8")
word.41 = fromJSON(json41, flatten = TRUE)$reviews %>% select(text)
word.41 = paste(unlist(word.41), collapse =" ")
word41 = Corpus(VectorSource(word.41))
#res<-wordcloud(word41,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r42 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[42]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r42)
json42 <- httr::content(r42, as = "text", encoding = "UTF-8")
word.42 = fromJSON(json42, flatten = TRUE)$reviews %>% select(text)
word.42 = paste(unlist(word.42), collapse =" ")
word42 = Corpus(VectorSource(word.42))
#res<-wordcloud(word42,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r43 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[43]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r43)
json43 <- httr::content(r43, as = "text", encoding = "UTF-8")
word.43 = fromJSON(json43, flatten = TRUE)$reviews %>% select(text)
word.43 = paste(unlist(word.43), collapse =" ")
word43 = Corpus(VectorSource(word.43))
#res<-wordcloud(word43,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r44 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[44]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r44)
json44 <- httr::content(r44, as = "text", encoding = "UTF-8")
word.44 = fromJSON(json44, flatten = TRUE)$reviews %>% select(text)
word.44 = paste(unlist(word.44), collapse =" ")
word44 = Corpus(VectorSource(word.44))
#res<-wordcloud(word44,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r45 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[45]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r45)
json45 <- httr::content(r45, as = "text", encoding = "UTF-8")
word.45 = fromJSON(json45, flatten = TRUE)$reviews %>% select(text)
word.45 = paste(unlist(word.45), collapse =" ")
word45 = Corpus(VectorSource(word.45))
#res<-wordcloud(word45,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r46 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[46]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r46)
json46 <- httr::content(r46, as = "text", encoding = "UTF-8")
word.46 = fromJSON(json46, flatten = TRUE)$reviews %>% select(text)
word.46 = paste(unlist(word.46), collapse =" ")
word46 = Corpus(VectorSource(word.46))
#res<-wordcloud(word46,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r47 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[47]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r47)
json47 <- httr::content(r47, as = "text", encoding = "UTF-8")
word.47 = fromJSON(json47, flatten = TRUE)$reviews %>% select(text)
word.47 = paste(unlist(word.47), collapse =" ")
word47 = Corpus(VectorSource(word.47))
#res<-wordcloud(word47,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r48 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[48]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r48)
json48 <- httr::content(r48, as = "text", encoding = "UTF-8")
word.48 = fromJSON(json48, flatten = TRUE)$reviews %>% select(text)
word.48 = paste(unlist(word.48), collapse =" ")
word48 = Corpus(VectorSource(word.48))
#res<-wordcloud(word48,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))

r49 <- GET(
    str_glue("https://api.yelp.com/v3/businesses/{id}/reviews", id = x[49]),
    add_headers(Authorization = paste("Bearer", Sys.getenv("YELP_TOKEN"))),
    query = list(
        locale = "en_US"
    )
)
stop_for_status(r49)
json49 <- httr::content(r49, as = "text", encoding = "UTF-8")
word.49 = fromJSON(json49, flatten = TRUE)$reviews %>% select(text)
word.49 = paste(unlist(word.49), collapse =" ")
word49 = Corpus(VectorSource(word.49))
#res<-wordcloud(word49,max.words = 100,min.freq = 1,colors=brewer.pal(8, "Dark2"))



final_words = rbind(word.1,word.2,word.3,word.4,word.5,word.6,word.7,word.8,word.9,word.10,word.11,word.12,word.13,word.14,word.15,word.16,word.17,word.18,word.19,word.20,word.21,word.21,word.22,word.23,word.24,word.25,word.26,word.27,word.28,word.29,word.30,word.31,word.31,word.32,word.33,word.34,word.35,word.36,word.37,word.38,word.39,word.40,word.41,word.42,word.43,word.44,word.44,word.45,word.46,word.47,word.48,word.49)

ui <- fluidPage(
    theme = bs_theme(version = 4,bootswatch = "lux"),

    # Application title
    titlePanel("Information for Restaurants in Davis, California"),
    h4(tags$a(href = "https://www.linkedin.com/in/amanorsingh/", "Aman Singh")),

    
    sidebarLayout(
        sidebarPanel(
            selectInput("Price","Expense of Restaurant with $ - Lowest",choices = c("-",final$price)),
            selectInput("Category","Type of Food",choices = c("-",""),selected = ""),
            selectInput("NameofRestaurant", "Name of Restaurant", choices = c("-",""),selected = "")
        ),

        # Show a plot 
        mainPanel(
            plotOutput("plot"),
            tableOutput("table")
        )
    )
)

server <- function(session,input, output) {

    
    observeEvent(
        input$Price,
        updateSelectInput(session,"Category","Type of Food",choices = c("-",final$categories.[final$price==input$Price] ))
    )
    observeEvent(
        input$Category,
        updateSelectInput(session,"NameofRestaurant", "Name of Restaurant",choices = c("-",final$name[final$categories.==input$Category & final$price==input$Price ])))
    
    output$table <- renderTable({
        z_filter = subset(z, z$Name == input$NameofRestaurant)})
                 
    
    
    output$plot <- renderPlot({
        data = switch(input$NameofRestaurant,
                      "-" = final_words,
                      "Sam's Mediterranean Cuisine" = final_words[1],
                      "Burgers and Brew" = final_words[2],
                      "Dutch Bros Coffee" = final_words[3],
                      "Four Seasons Gourmet Chinese Restaurant" = final_words[4],
                      "Taqueria Davis" = final_words[5],
                      "Nugget Markets" = final_words[6] ,
                      "Mikuni Japanese Restaurant and Sushi Bar"=final_words[7],
                      "Zumapoke & Lush Ice" = final_words[8],
                      "Sweet and Shavery" = final_words[9],
                      "Taqueria Guadalajara" = final_words[10],
                      "Woodstock's Pizza Davis" = final_words[11],
                      "Temple Coffee Roasters" = final_words[12],
                      "Crepeville" = final_words[13],
                      "Thai Canteen" = final_words[14],
                      "Blaze Pizza" = final_words[15],
                      "Tommy J's Grill & Catering" = final_words[16],
                      "Raja's Tandoor" = final_words[17],
                      "Tea List" = final_words[18],
                      "Fish's Wild Island Grill" = final_words[19],
                      "In-N-Out Burger"= final_words[20],
                      "Zia's Delicatessen"=final_words[21],
                      "Davis Creamery"=final_words[22],
                      "Konditorei Austrian Pastry Cafe"=final_words[24],
                      "Shah's Halal Food - University Mall"=final_words[25],
                      "Root Of Happiness"=final_words[26],
                      "Thai Nakorn"=final_words[27],
                      "Davis Food Co-op"=final_words[28],
                      "Village Bakery"=final_words[29],
                      "Let Them Eat Cake"=final_words[30],
                      "Mishka's Cafe"=final_words[31],
                      "Wok of Flame"=final_words[32],
                      "Zen Toro Japanese Bistro & Sushi Bar"=final_words[34],
                      "Yoloberry Yogurt"=final_words[35],
                      "Yakitori Yuchan"=final_words[36],
                      "Delta of Venus"=final_words[37],
                      "MandRo Teahouse"=final_words[38],
                      "Yeti Restaurant"=final_words[39],
                      "Ike's Love & Sandwiches"=final_words[40],
                      "Kathmandu Kitchen"=final_words[41],
                      "Paesanos"=final_words[42],
                      "Teabo Café"=final_words[43],
                      "Tasty Gourmet"=final_words[44],
                      "Cultivé Frozen Yogurt"=final_words[45],
                      "Huku Japanese Bistro"=final_words[47],
                      "The Posh Bagel"=final_words[48],
                      "Cafe Bernardo"=final_words[49],
                      "Taqueria Guadalajara Grill"=final_words[50],
                      "Sophia's Thai Bar & Kitchen"=final_words[51],
                      "Black Bear Diner"=final_words[52]
                      )
        
        wordcloud(data,max.words = 100,min.freq = 10,colors=brewer.pal(8, "Dark2")) 
    })
        
}

# Run the application 
shinyApp(ui = ui, server = server)
