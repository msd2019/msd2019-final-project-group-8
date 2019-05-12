library(text2vec)
#save(word_vectors,file = "xy.RData")
load("data/wv.Rdata")

#mysample <- read.csv("MyData.csv",sep=",")
#Sys.setenv(word_vectors)  # `A+C` could also be used
#get = Sys.getenv("R_TEST",unset = NA)
# tokens <- space_tokenizer(as.character(get$commentss))
# it = itoken(tokens, progressbar = FALSE)
# vocab <- create_vocabulary(it)
# vectorizer <- vocab_vectorizer(vocab)
# tcm <- create_tcm(it, vectorizer, skip_grams_window = 3L)
# glove = GlobalVectors$new(word_vectors_size = 50, vocabulary = vocab, x_max = 10)
# word_vectors1 = glove$fit_transform(tcm, n_iter = 10)
# install.packages("MASS")
# library(MASS)
#write.table(word_vectors,file="test.txt",row.names=FALSE)
#temp = read.table("wordvec", sep = " ")
#temp = read.table("test.txt",header=TRUE)
library(tidyverse)
library(tm)
library(wordcloud)
library(tmap)
library(shinycssloaders)
library(shiny)
# # write.table(word_vectors,"aaa.txt",col.names=F,row.names=F)
# # 
# # bbb<-as.matrix(read.table(file="aaa.txt",header=T))
# #colnames(bbb)<-NULL
# 
ui <- fluidPage(
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      textInput("caption", "Query Word", "happy"),
      #actionButton("update", "Change"),
      
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 80)
    ),
    
    # Show Word Cloud
    mainPanel(
      h2("Presenting the Twitter WordCloud Generator!"),
      h5(" Simply put, the frequently occuring words in the corpus are used to generate a word embedding. Feel free to query any word and the a wordcloud of n-closes words will be generated. You can adjust 'n' on the left panel."),
      h6("Gives error for words not in corpus. Common words like 'happy', 'sad', 'fear', 'play',etc. Bear in mind, this returns words used in similar context, not necessarily synonyms."),
      withSpinner(plotOutput("plot"))
    )
    #verbatimTextOutput("value")
  ))

server = function(input,output) {
  
  output$plot <-renderPlot({
    p1 = word_vectors[input$caption, , drop = FALSE]
    cos_sim = sim2(x = word_vectors, y = p1, method = "cosine", norm = "l2")
    p1 = sort(cos_sim[,1], decreasing = TRUE)
    
    df = data.frame(item = as.character(names(p1)),freq = as.numeric(p1))
    df$item = gsub(")","",df$item)
    df$item = gsub(",","",df$item)
    df = df[!duplicated(df$item), ]
    
    set.seed(1234)
    wordcloud(words = df$item, freq = df$freq*2, scale = c(2,0.2),
              max.words=input$max, random.order=FALSE, rot.per=0.2,
              colors=brewer.pal(5, "Dark2"))},height = 600, width = 700 )
  
}

shinyApp(ui, server)

