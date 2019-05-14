library(text2vec)

library(tidyverse)
library(tm)
library(wordcloud)
library(tmap)
library(shinycssloaders)
library(shiny)

#save(word_vectors,file = "wv.RData") : used previously in the twitter_vector.Rmd file

load("data/wvv.Rdata") #workspace object word_vectors has now been loaded


#ui part of our code, generates the panels and we specify display text.
ui <- fluidPage(
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    
    sidebarPanel(
      textInput("caption", "Query Word", "happy"),
      
      #slider that ranges from 1 to 300 words for wordcloud. new wordcloud generated each time this value changes.
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 80)
    ),
    
    # Show Word Cloud
    mainPanel(
      h2("Presenting the Twitter WordCloud Generator!"),
      h5(" Simply put, the frequently occuring words in the corpus are used to generate a word embedding. Feel free to query any word and the a wordcloud of n-closest words will be generated. You can adjust 'n' on the left panel."),
      h6("Gives error for words not in corpus. Common words like 'happy', 'sad', 'fear', 'play',etc. Bear in mind, this returns words used in similar context, not necessarily synonyms."),
      withSpinner(plotOutput("plot"))
    )
  ))

#server part where calculation is performed.
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
    wordcloud(words = df$item, freq = df$freq*2, scale = c(3,0.3),
              max.words=input$max, random.order=FALSE, rot.per=0.2,
              colors=brewer.pal(5, "Dark2"))},height = 600, width = 700 )
  
}

#calls the app ui and server functions.
shinyApp(ui, server)

