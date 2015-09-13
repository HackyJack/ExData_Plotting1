theData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
theDataSub <- theData[theData$Date %in% c("1/2/2007","2/2/2007") ,]
theDataSub$Global_active_power <- as.numeric(theDataSub$Global_active_power)


png("plot1.png", width=480, height=480)
theDataSub$Global_active_power <- theDataSub$Global_active_power / 1000
hist(theDataSub$Global_active_power, col="red",
	main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

