library(tm)
library(SnowballC)
library(wordcloud)

jeopQ <- read.csv('JEOPARDY_CSV.csv', stringsAsFactors = FALSE)
jeopCorpus <- Corpus(VectorSource(jeopQ$Question))
#Next, we will convert the corpus to a plain text document.
jeopCorpus <- tm_map(jeopCorpus, PlainTextDocument)
jeopCorpus <- tm_map(jeopCorpus, removePunctuation)
jeopCorpus <- tm_map(jeopCorpus, removeWords, stopwords('english'))

jeopCorpus <- tm_map(jeopCorpus, stemDocument)

wordcloud(jeopCorpus, max.words = 100, random.order = FALSE) #For Non-color wordcloud

wordcloud(jeopCorpus, max.words = 100, random.order = FALSE,colors=brewer.pal(6, "Dark2"))#For color word cloud

