#
#  Week 4
#  Question 5
#
install.packages("ggExtra")
library(ggplot2)
library(grid)
library(ggExtra)

getData  <- function() {
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
}

motorVehicle <- function() {
  
  dev.new()
  dev.set(2)
  par(mfrow = c(1,1))
  
  #Get the motor vechicle in short name
  SCC_Motor<- subset(SCC, grepl("*Motor*", Short.Name), drop = TRUE)
  SCC_Motor_Vehicle <- subset(SCC_Motor, grepl("*Highway*", Short.Name),drop = TRUE)
  
  # Baltimore Data
  baltimoreData <- subset(NEI, fips == "24510")
  
  #Find Motor Vehical in Baltimore Data
  balt_motor <- subset(baltimoreData, baltimoreData$SCC %in% SCC_Motor_Vehicle$SCC, drop = TRUE)
  
  #Ggplot the data for the motor Emission change
  p1 <-  ggplot(data = balt_motor, aes(year, log(Emissions), color = factor(type))) + geom_point() + stat_smooth(method = "glm")
  
  #Plot the graph and the title
  p1 + ggtitle("Baltimore Motor Vehicle Emission from 1999-2008")
  
  dev.copy(png, file = "plot5.png")
}

getData()
motorVehicle()
