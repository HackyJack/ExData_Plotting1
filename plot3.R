theData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
theData$Date <- as.Date(theData$Date, "%d/%m/%Y")
theData <- theData[theData$Date >= as.Date("2007-02-01") & theData$Date <= as.Date("2007-02-02"), ]
theData$Seq <- sprintf("%s %s", theData$Date, theData$Time)
theData$Seq <- strptime(theData$Seq, "%Y-%m-%d %H:%M:%S")

theData$Sub_metering_1 <- as.numeric(theData$Sub_metering_1)
theData$Sub_metering_2 <- as.numeric(theData$Sub_metering_2)
theData$Sub_metering_3 <- as.numeric(theData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(theData$Seq, theData$Sub_metering_1, type="l", 
	ylab="Energy sub metering",
	xlab="")

lines(theData$Seq, theData$Sub_metering_2, type="l", col="red")
lines(theData$Seq, theData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

dev.off()
