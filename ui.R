library(shiny)
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Predict Variety of Iris"),
    
  sidebarPanel(
    helpText("Enter measurements below (in centemeters) to predict the probablity that an iris 
    with the selected measurements belongs to the species 'Setosa', 
    'Versicolor', or 'Virginica'. Click 'Submit' for prediction."),
    sliderInput("decimal1", "Sepal Length:", 
        min = 4, max = 8, value = 4.6, step= 0.2),
    sliderInput("decimal2", "Sepal Width:", 
        min = 2, max = 5, value = 3, step= 0.2),
    sliderInput("decimal3", "Petal Length:", 
        min = 1, max = 7, value = 2.6, step= 0.2),
    sliderInput("decimal4", "Petal Width:", 
        min = 0.1, max = 2.5, value = 1.1, step= 0.2),
    submitButton('Submit')
  ),
    
  mainPanel(
    tabsetPanel(
      tabPanel("Plot Results", plotOutput("barPlot")), 
      tabPanel("Supporting Documentation", 
        helpText("To use this app to predict the variety of iris, 
        use the sliders to the left to enter iris measurements, 
        and then prss 'Submit'. Use the 'Plot Results' tab to view
        the resulting prediction represented in a barplot."),
        helpText("The data used is the 'iris' data provided with 
        RStudio. The model for this app was created using the 'caret'
        package and the 'random forest' method. The code used to build
        the model is given below."),
        helpText("library(caret)"),
        helpText("data(iris)"),
        helpText("set.seed(111)"),
        helpText("modFit <- train(iris$Species~., data=iris[,-5], method='rf', prox=TRUE)"))
    )
  )
))