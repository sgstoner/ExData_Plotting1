dataFile <- "./household_power_consumption.txt"

#load data
plotData <- read.table(dataFile, header=T, sep=";", na.strings="?")

#manipulate data
subsetData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007") ,]

# create plot
png("plot1.png", width=480, height=480)
hist(subsetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()