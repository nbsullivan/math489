library(ggplot2)

getwd()
setwd("C:/Users/nick/Documents/GitHub/Math489")

austin <- read.csv("austinpopulation.csv")

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Population")

ggplot(data = austin, aes(x = Date, y = log(Population))) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Log(Population)")

lmfit <- lm(austin$Date ~ austin$Population)




