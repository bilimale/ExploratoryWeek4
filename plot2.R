#
#  Assignment 4
#  Question 2
#
getData  <- function() {
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  
}

 
#
#  Draw gpahs for baltimore plots 
#
baltimorePlot <- function() {
  
  #Get baltimore data
  baltimoreData <- subset(NEI, fips == "24510")
  
  dev.new()
  dev.set(2)
  par(mfrow = c(1,1))
   
  # Box plot to display the range of emissions with mean line indicating the avegage for the year.
  boxplot(log(Emissions) ~ factor(year), data = baltimoreData, ylab = "Emissions as log", col = c("red","blue","green","orange"))
  
  #title 
  title(main = "PM2.5 Emissions for Baltimore between 1999-2008")
  
  #Copy the png file 
  dev.copy(png, file = "plot2.png")
  dev.off()
}

getData()
baltimorePlot()