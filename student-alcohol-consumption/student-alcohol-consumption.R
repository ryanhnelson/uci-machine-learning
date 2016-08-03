library(caret)
library(ggplot2)
library(randomForest)
library(reshape2)

# No good reason to make a function, but doing it for practice
sac.merge <- function(x, y) {
  d1=read.table(x, sep=";",header=TRUE)
  d2=read.table(y, sep=";",header=TRUE)
  d3 <- merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus", 
                         "Medu","Fedu", "Mjob","Fjob","reason","nursery",
                         "internet"))
  return(d3)
} # Ha! Kept it clean with those blind functions

sac <- sac.merge("student-mat.csv", "student-por.csv")

# Example Correlation
model <- lm(formula = Dalc.x ~ G3.y, data = sac) # Daily Alc. and Final Grade
summary(model)
plot(model)

# Screwing around with ML for Final Grade
model <- train(G3.x ~ sex + age + studytime.x + higher.x + freetime.x +
                 Dalc.x + Walc.x + health.x + absences.x,
               data = sac,
               method = "rf",
               trControl = trainControl(method = "cv",
                                        number = 5)
)

model # LOL, well, that sucked