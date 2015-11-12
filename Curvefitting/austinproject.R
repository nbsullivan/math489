library(ggplot2)

getwd()
setwd("C:/Users/nick/Documents/GitHub/Math489/CurveFitting")


austin <- read.csv("ausmodeldata.csv")
austintest <- read.csv("austestdata.csv")

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Population")

ggplot(data = austin, aes(x = Date, y = log(Population))) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Log(Population)")

lmfit <- lm(Population ~ Date, data = austin)
quadfit <- lm(Population ~ Date + I(Date^2), data = austin)
logfit <- lm(log(Population) ~ Date, data = austin)

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y~x) +
  ggtitle("Austin Population With linear model")

ggsave("austestlin.jpeg")

ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y~ x + I(x^2)) +
  ggtitle("Austin Population With quadraic model")

ggsave("austestquad.jpeg")


ggplot(data = austin, aes(x = log(Date), y = log(Population))) +
  geom_point() +
  stat_smooth(method = "lm", formula = y~ x) +
  ggtitle("Austin Population With log model")

ggsave("austestlog.jpeg")

summary(lmfit)

testyears.df <- data.frame(Date = c(1960,1970,1980,1990,2000,2010))

lmpred <- predict(lmfit, newdata = testyears.df)
quadpred <- predict(quadfit, newdata = testyears.df)
logpred <- predict(logfit, newdata = testyears.df)
