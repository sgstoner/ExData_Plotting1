dataFile <- "./data/household_power_consumption.txt"

#load data
plotData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#manipulate data
subsetData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot
png("plot2.png", width=480, height=480)
plot(dateTime, subsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()