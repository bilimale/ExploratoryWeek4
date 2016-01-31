#
# Exploratory Week 4
# plot1.R - plot1.png
#

readData <- function() {
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")  
}

drawPlot <- function() {

  #Remove negative data since they seems like error
  #NEI <- NEI[!Emissions < 0 ]
  
  dev.set(2)
  par(mfrow = c(1,1))
  boxplot(log10(Emissions) ~ factor(year), data = NEI, ylab = "Emissions as log10", col = c("red","blue", "green", "orange"))
  title(main = "PM2.5 Emissions in US between 1999-2008")
  dev.copy(png, file = "plot1.png")
  dev.off()
}

readData()
drawPlot()