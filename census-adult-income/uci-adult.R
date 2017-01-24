library(tidyverse)

 # Download Data and Data Summary
adult.url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
download.file(adult.url, "adult.data")
names.url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.names"
download.file(names.url, destfile = "adult.names")

 # Read adult.data as CSV and apply headers
adult <- read.csv("adult.data", header=FALSE)
names(adult) <- c("age", "work.class", "final.stat.weight", "education",
                  "education.years", "marital.status", "occupation",
                  "relationship", "race", "sex", "capital.gain", "capital.loss",
                  "hours.per.week", "native.country", "income.key")
str(adult)

 # Messing around with magrittr and dplyr to check that I get the idea behind it
test <- adult %>%
  filter(hours.per.week > 30) %>%
  filter(education.years > 13)

mean(adult$capital.gain)
mean(test$capital.gain) # yep, filtering worked

 # ggplot2? lol wutRthis
 # But serious with you guys now, this plot is for the future of gainz
ggplot(adult, aes(education.years, capital.gain, color=education)) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab("Capital Gain") +
  geom_jitter(alpha=0.08)
ggsave(filename = "education-and-capital-gain.png", width = 8, height = 4, dpi=300)