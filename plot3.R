dataFile <- "./data/household_power_consumption.txt"

#load data
plotData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#manipulate data
subsetData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot
png("plot3.png", width=480, height=480)
plot(datetime, subsetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subsetData$Sub_metering_2, type="l", col="red")
lines(datetime, subsetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()