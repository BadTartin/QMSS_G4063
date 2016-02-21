library(streamR)
library(stringr)

setwd("/Users/christophermartin/RStuff/G4063/D3TweetViz")

d3tweetsdf <- parseTweets("tweets.02.07.2016.json", simplify = FALSE)

d3tweetsdf$times <- as.POSIXct(d3tweetsdf$created_at, format="%a %b %d %H:%M:%S %z %Y")

candidates <- c("Hillary Clinton", "Bernie Sanders","Jeb Bush", "Marco Rubio", "Ted Cruz", 
                "Donald Trump", "John Kasich", "Ben Carson", "Chris Christie", "Carly Fiorina") 

d3tweetsdf$Hillary_Clinton <- str_detect(str_to_lower(d3tweetsdf$text),
                                         "hillary clinton|hillaryclinton")

d3tweetsdf$Bernie_Sanders <- str_detect(str_to_lower(d3tweetsdf$text), "bernie sanders|berniesanders")
d3tweetsdf$Jeb_Bush <- str_detect(str_to_lower(d3tweetsdf$text), "jeb bush|jebbush")
d3tweetsdf$Marco_Rubio <- str_detect(str_to_lower(d3tweetsdf$text), "marco rubio|marcorubio")
d3tweetsdf$Ted_Cruz <- str_detect(str_to_lower(d3tweetsdf$text), "ted cruz|tedcruz")
d3tweetsdf$Donald_Trump <- str_detect(str_to_lower(d3tweetsdf$text), "donald trump|donaldtrump")
d3tweetsdf$John_Kasich <- str_detect(str_to_lower(d3tweetsdf$text), "john kasich|johnkasich")
d3tweetsdf$Ben_Carson <- str_detect(str_to_lower(d3tweetsdf$text), "ben carson|bencarson")
d3tweetsdf$Chris_Christie <- str_detect(str_to_lower(d3tweetsdf$text), "chris christie|chrischristie")
d3tweetsdf$Carly_Fiorina <- str_detect(str_to_lower(d3tweetsdf$text), "carly fiorina|carlyfiorina")


write.csv(d3tweetsdf, file = "d3tweets.csv", row.names = FALSE, na = "")

bydate <- d3tweetsdf

res <- aggregate(bydate$Hillary_Clinton,
                 by=list(format(bydate$times, "%Y-%m-%d %H")),
                 sum)

res2 <- aggregate(bydate$Donald_Trump,
                  by=list(format(bydate$times, "%Y-%m-%d %H")),
                  sum)

res3 <- aggregate(bydate$Bernie_Sanders,
                  by=list(format(bydate$times, "%Y-%m-%d %H")),
                  sum)

res4 <- aggregate(bydate$Ted_Cruz,
                  by=list(format(bydate$times, "%Y-%m-%d %H")),
                  sum)


CandHour <- data.frame(Time = res$Group.1,
                       Hillary_Clinton = res$x,
                       Donald_Trump = res2$x,
                       Bernie_Sanders = res3$x,
                       Ted_Cruz = res4$x)

write.csv(CandHour, file = "candhour.csv", row.names = FALSE, na = "")




