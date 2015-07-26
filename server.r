library(shiny)
library(datasets)
library(caret)
library(randomForest)
library(e1071)
data(iris)
set.seed(111)

modFit <- train(iris$Species~., data=iris[,-5], method="rf", prox=TRUE)

data <- function (indata1, indata2, indata3, indata4) {
  data.frame(
    "Sepal Length"= indata1, 
    "Sepal Width"= indata2,
    "Petal Length"= indata3,
    "Petal Width"= indata4,
    stringsAsFactors=FALSE)
}

prediction<- function (data) {
  as.numeric( predict( modFit, newdata=data, type="prob" ))*100
}

# Define server logic for slider examples
shinyServer(function(input, output) {

  output$barPlot <- renderPlot({
    barplot(prediction(data(input$decimal1, input$decimal2, input$decimal3, input$decimal4)),
                  main="Species Prediction in Percents",
                  ylab="Percent",
                  ylim=c(0,100),
                  names.arg=c("Setosa", "Versicolor", "Virginica"),
                  col=c("hotpink","cyan","purple"))
  })
})