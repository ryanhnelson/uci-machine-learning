require(dplyr)
require(caret)
require(e1071)
require(randomForest)

##### Importing the iris dataset from UCI #####
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
download.file(url, "./data/iris.data")
iris <- read.csv("./data/iris.data", header = FALSE)
plyr::rename(iris, c("V1"="sepal.length", "V2"="sepal.width", 
                     "V3"="petal.length", "V4"="petal.width", "V5"="species"))

##### Creating Training and Test Data Sets #####