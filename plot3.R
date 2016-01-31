#
#  Week 4
#  Question 3
#
install.packages("ggExtra")
library(ggplot2)
library(grid)
library(ggExtra)

getData  <- function() {
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
}


baltimorePlotType <- function() {
  
  
  #Get baltimore data
  baltimoreData <- subset(NEI, fips == "24510")
  
  dev.new()
  dev.set(2)
  #par(mfrow = c(1,1))
  

  #Add the title
  h1 <-  ggtitle("Baltimore Emission for 1999-2008 for type specific")
  
  # Plotting with type as factor
  p2 <- ggplot(data = baltimoreData, aes(year, log10(Emissions))) + geom_point() + geom_line(aes(color=type)) + h1
  
  # Plotting with type as factor
  p1 <- ggplot(data = baltimoreData, aes(year, log10(Emissions), color = factor(type))) + geom_point() + stat_smooth(method = "lm")
  
  # Arrange as a grid the 2 plots
  gridExtra::grid.arrange(p2,p1)
  
  # Copy to file and clear
  dev.copy(png, file = "plot3.png")
  dev.off()
  
}
getData()
baltimorePlotType()