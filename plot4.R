#
#  Week 4
#  Question 4
#
install.packages("ggExtra")
library(ggplot2)
library(grid)
library(ggExtra)

getData  <- function() {
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
}

coalPlot <- function() {

  dev.new()
  dev.set(2)
  par(mfrow = c(1,1))
  
  # Get the subset of the Coal polution
  SCC_Subset <- subset(SCC, grepl("*Coal*", Short.Name), drop = TRUE)
  
  # And Combustion
  SCC_Subset_Comb <- subset(SCC_Subset, grepl("*Comb*", Short.Name), drop = TRUE)
  
  #Filter the NEI data fro the subset of coal and combustion
  NEI_Coal <- subset(NEI, NEI$SCC %in% SCC_Subset_Comb$SCC)
  
  # Draw ggplot for year and mapping the coal combustion
  p1 <- ggplot2::ggplot(data = NEI_Coal, aes(year, log10(Emissions), color = factor(SCC), group=200 )) + geom_point() + stat_smooth(method = "glm")
  
  p1 + ggtitle("Coal Combustion Emission Trend in US between 1999-2008") + theme(legend.position = "none")
  
  dev.copy(png, file = "plot4.png")
  dev.off()
}