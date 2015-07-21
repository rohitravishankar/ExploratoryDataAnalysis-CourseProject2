## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggregatedTotal <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")
barplot(height=aggregatedTotal$Emissions, names.arg=aggregatedTotal$year, xlab="years", ylab="total PM2.5 emission",main="Total PM2.5 emissions at various years")
dev.off()