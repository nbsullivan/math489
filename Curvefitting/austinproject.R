library(ggplot2)

getwd()
setwd("C:/Users/nick/Documents/GitHub/Math489/CurveFitting")


austin <- read.csv("ausmodeldata.csv")
austintest <- read.csv("austestdata.csv")
austintest$Status <- "Actual"
austin$Status <- "Actual"

austinln <- austin
austinln$Population <- log(austinln$Population)
austinln$Date <- log(austinln$Date)

# intital plots of austin population for years 1850-1960
ggplot(data = austin, aes(x = Date, y = Population)) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Population")

ggplot(data = austin, aes(x = Date, y = log(Population))) +
  geom_point() +
  geom_line() +
  ggtitle("Austin Log(Population)")

# bulidng models for population growth
lmfit <- lm(Population ~ Date, data = austin)
quadfit <- lm(Population ~ Date + I(Date^2), data = austin)
expfit <- lm(log(Population) ~ Date, data = austin)
powerfit <- lm(Population ~ Date, data = austinln)

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


# setting up dataframes for making predictions
auslm <- data.frame(Date = c(1960,1970,1980,1990,2000,2010))
ausquad <- data.frame(Date = c(1960,1970,1980,1990,2000,2010))
ausexp <- data.frame(Date = c(1960,1970,1980,1990,2000,2010))
auspower <- data.frame(Date = log(c(1960,1970,1980,1990,2000,2010)))

#making predictions for each model
auslm$Population <- predict(lmfit, newdata = auslm)
ausquad$Population <- predict(quadfit, newdata = ausquad)
ausexp$Population <- exp(predict(expfit, newdata = ausexp))
auspower$Population <- exp(predict(powerfit, newdata = auspower))

#changing auspower$Date back to years
auspower$Date <- exp(auspower$Date)

#denoting the entires as predicted
auslm$Status <- "Predicted"
ausquad$Status <- "Predicted"
ausexp$Status <- "Predicted"
auspower$Status <- "Predicted"

#appending together results of predictions and actaul populations
auslmtotal <- rbind(auslm, austintest, austin)
ausquadtotal <- rbind(ausquad, austintest, austin)
ausexptotal <- rbind(ausexp, austintest, austin)
auspowertotal <- rbind(auspower, austintest, austin)

#colorized plots of prediction models
ggplot(data = auslmtotal, aes(x = Date, y = Population, color = Status)) +
  geom_line() +
  geom_point() +
  ggtitle("Austin population with linear model")
ggsave("auscolorlm.jpeg")

ggplot(data = ausquadtotal, aes(x = Date, y = Population, color = Status)) +
  geom_line() +
  geom_point() +
  ggtitle("Austin population with quadardic model")
ggsave("auscolorquad.jpeg")

ggplot(data = ausexptotal, aes(x = Date, y = Population, color = Status)) +
  geom_line() +
  geom_point() +
  ggtitle("Austin population with exponential model")
ggsave("auscolorexp.jpeg")

ggplot(data = auspowertotal, aes(x = Date, y = Population, color = Status)) +
  geom_line() +
  geom_point() +
  ggtitle("Austin population with power-law fit")
ggsave("auscolorlm.jpeg")

#other plots
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
