library(ggplot2)

getwd()
setwd("C:/Users/nick/Documents/GitHub/Math489")

q2_long <- read.csv("question2long.csv")
q3_long <- read.csv("question3long.csv")
bigsim <- read.csv("bigsimlong.csv")


q3_long_subset <- subset(q3_long, jumpnumber %% 5 == 0)
bigsim_subset <- subset(bigsim, jumpnumber %% 5 == 0)

ggplot(data = q2_long, aes(x = padNumber, y = numberOfFrogs, fill = jumpnumber, color = jumpnumber)) +
  geom_bar(stat = "identity") +
  facet_wrap(~jumpnumber) +
  ggtitle("100 frogs 5 pads")

ggsave("frogq2.jpeg")

ggplot(data = q3_long_subset, aes(x = padNumber, y = numberOfFrogs, fill = jumpnumber, color = jumpnumber)) +
  geom_bar(stat = "identity") +
  facet_wrap(~jumpnumber) +
  ggtitle("100 frogs 10 pads")

ggsave("frogq3.jpeg")

ggplot(data = bigsim_subset, aes(x = padNumber, y = numberOfFrogs, fill = jumpnumber, color = jumpnumber)) +
  geom_bar(stat = "identity") +
  facet_wrap(~jumpnumber) +
  ggtitle("10,000 frogs 10 pads")

ggsave("frogbigsim.jpeg")
