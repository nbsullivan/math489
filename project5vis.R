library(ggplot2)

getwd()
setwd("C:/Users/nick/Documents/GitHub/Math489")

rabbits <- read.csv("fibRabbitData.csv")

colnames(rabbits) <- c("month", "juvenile", "adults", "AdultJuvRatio")

rabbits$totalpop <- rabbits$juvenile + rabbits$adults

rabbit.small <- subset(rabbits, month < 20)
  
ggplot(data = rabbit.small, aes(x = month, y = AdultJuvRatio)) +
  geom_point() +
  geom_hline(aes(yintercept = (1 + sqrt(5))/2), linetype = "dashed", color = "red") +
  ggtitle("Adult to juvenile Ratio approaching its limit")


rabbit.med <- subset(rabbits, month < 15)


ggplot(data = rabbit.med) +
  geom_path(data = rabbit.med, aes(x = month, y =adults, color = "Adult")) +
  geom_path(data = rabbit.med, aes(x = month, y = juvenile, color = "Juvenile")) +
  ylab("Population") +
  xlab("Month")+
  ggtitle("Population Numbers Over Time")+
  theme(legend.title=element_blank())

rabbit.lrg <- subset(rabbits, month < 500)

ggplot(data = rabbit.lrg, aes(x = month, y = totalpop)) +
  geom_line() +
  scale_y_log10() +
  ggtitle("Total log 10 population over time")
