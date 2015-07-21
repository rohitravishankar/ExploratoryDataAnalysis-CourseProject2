## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)

subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotal <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotal$fips[aggregatedTotal$fips=="24510"] <- "Baltimore, MD"
aggregatedTotal$fips[aggregatedTotal$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png")
g <- ggplot(aggregatedTotal, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()