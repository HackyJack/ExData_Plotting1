theData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
theData$Date <- as.Date(theData$Date, "%d/%m/%Y")
theData <- theData[theData$Date >= as.Date("2007-02-01") & theData$Date <= as.Date("2007-02-02"), ]
theData$Seq <- sprintf("%s %s", theData$Date, theData$Time)
theData$Seq <- strptime(theData$Seq, "%Y-%m-%d %H:%M:%S")
theData$Global_active_power <- as.numeric(theData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(theData$Seq, theData$Global_active_power, type="l", 
	main="Global Active Power", 
	ylab="Global Active Power (Kilowatts)",
	xlab="")
dev.off()