require("XML")
require("tm")
require("wordcloud")
u <- "http://www.bioconductor.org/packages/release/bioc/"
t = readHTMLTable(u)[[1]]
ap.corpus <- Corpus(DataframeSource(data.frame(as.character(t[,3]))))
ap.corpus <- tm_map(ap.corpus, removePunctuation)
ap.corpus <- tm_map(ap.corpus, tolower)
ap.corpus <- tm_map(ap.corpus, function(x) removeWords(x, stopwords("english")))
ap.tdm <- TermDocumentMatrix(ap.corpus)
ap.m <- as.matrix(ap.tdm)
ap.v <- sort(rowSums(ap.m),decreasing=TRUE)
ap.d <- data.frame(word = names(ap.v),freq=ap.v)
table(ap.d$freq)
save.image("wordcloud_bioconductor.RData", compress=T)
pal2 <- brewer.pal(8,"Dark2")
wordcloud(ap.d$word,ap.d$freq, scale=c(8,.2),min.freq=3, 
max.words=Inf, random.order=FALSE, rot.per=.15, colors=pal2)