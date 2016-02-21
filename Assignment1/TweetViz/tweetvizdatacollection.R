stopifnot(require(streamR))

# library(ROAuth)
# requestURL <- "https://api.twitter.com/oauth/request_token"
# accessURL <- "https://api.twitter.com/oauth/access_token"
# authURL <- "https://api.twitter.com/oauth/authorize"
# consumerKey <- "fUHv0arK9fbYbD7z2pa97Gnvo"
# consumerSecret <- "6FptGiCE8PWJ0EKsoCAWstKg4LjQJwmhwgtoTb2wzMKQc6fQzN"
# my_oauth <- OAuthFactory$new(consumerKey = consumerKey, consumerSecret = consumerSecret, 
#                              requestURL = requestURL, accessURL = accessURL, authURL = authURL)
# my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
# save(my_oauth, file = "my_oauth.Rdata")


# load("my_oauth.Rdata")
# filterStream("tweetviz.json", track = c("Hillary Clinton", "Bernie Sanders",
#                                         "Jeb Bush", "Marco Rubio", "Ted Cruz", 
#                                         "Donald Trump", "John kasich", "Ben Carson",
#                                         "Chris Christie", "Carly Fiorina", "Hillaryclinton", 
#                                         "Jebbush", "Berniesanders", "Marcorubio", 
#                                         "Chrischristie", "Bencarson", "Johnkasich", 
#                                         "Donaldtrump", "Tedcruz", "CarlyFiorina"),
#              timeout = 1800, oauth = my_oauth)


tweetvizdf <- parseTweets("data/tweetviz.json", simplify = FALSE)

tweetvizdf$times <- as.POSIXct(tweetvizdf$created_at, format="%a %b %d %H:%M:%S %z %Y")







