library(ggplot2)

getwd()
setwd("C:/Users/nick/Documents/GitHub/Math489")

austin <- read.csv("ausmodeldata.csv")

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Population")

ggplot(data = austin, aes(x = Date, y = log(Population))) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Log(Population)")

lmfit <- lm(austin$Date ~ austin$Population)

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y~x) +
  ggtitle("Austin Population With linear model")

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y~ x + I(x^2)) +
  ggtitle("Austin Population With quadraic model")


ggplot(data = austin, aes(x = Date, y = log(Population))) +
  geom_point() +
  stat_smooth(method = "lm", formula = y~ x) +
  ggtitle("Austin Population With log model")



