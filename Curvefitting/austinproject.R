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

lmfit <- lm(austin$Population ~ austin$Date)
quadfit <- lm(austin$Population ~ austin$Date + I(austin$Date^2))
logfit <- lm(log(austin$Population) ~ austin$Population)

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

predict(lmfit, austintest)

