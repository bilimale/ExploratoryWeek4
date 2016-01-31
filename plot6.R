#
#  Week 4
#  Question 6
#
install.packages("ggExtra")
library(ggplot2)
library(grid)
library(ggExtra)

getData  <- function() {
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
}

compareBaltiMoreLosAngeles <- function() {
  
  dev.new()
  dev.set(2)
  par(mfrow = c(1,1))
  
  #Get the motor vechicle in short name
  SCC_Motor<- subset(SCC, grepl("*Motor*", Short.Name), drop = TRUE)
  SCC_Motor_Vehicle <- subset(SCC_Motor, grepl("*Highway*", Short.Name),drop = TRUE)
  
  # Baltimore Data
  baltimoreData <- subset(NEI, fips == "24510")
  
  #LosAngeles Data
  losangelesData <- subset(NEI, fips == "06037")
  
  #Changeg the county name
  baltimoreData$fips = "Baltimore"
  losangelesData$fips = "Los Angeles"
  
  #Join the 2 datasets
  losBalData <- rbind(baltimoreData, losangelesData)
  
  #Plot the graph as factor of fips
  p1 <-  ggplot(data = losBalData, aes(year, log(Emissions), color = factor(fips))) + stat_smooth(method = "glm")
  
  p1 + ggtitle("Comparision of Motor Emission \n for Baltimore and Los Angeles between 1999-2008")
  
  dev.copy(png, file = "plot6.png")
  dev.off()
  
}

getData()
compareBaltiMoreLosAngeles()
