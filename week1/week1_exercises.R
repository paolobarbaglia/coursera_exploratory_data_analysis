# Week 1 Exercises

# Question: Are there any counties in the U.S. that exceed that national standard for fine particle pollution?
pollution <- read.csv("data/avgpm25.csv",colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

summary(pollution$pm25) # Summary
boxplot(pollution$pm25, col="blue") # Boxplot
hist(pollution$pm25, col = "green") # Histogram
rug(pollution$pm25)

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region") # Barplot

boxplot(pm25 ~ region, data = pollution, col = "red") # Multiple Boxplot

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1)) # Multiple Histogram
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

with(pollution, plot(latitude, pm25)) # Scatterplot
abline(h = 12, lwd = 2, lty = 2)

with(pollution, plot(latitude, pm25, col = region)) # Scatterplot with color
abline(h = 12, lwd = 2, lty = 2)

par(mfrow = c(1, 2), mar = c(5, 4, 2, 1)) # Multiple Scatterplot
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))