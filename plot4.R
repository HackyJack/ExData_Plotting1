theData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
theData$Date <- as.Date(theData$Date, "%d/%m/%Y")
theData <- theData[theData$Date >= as.Date("2007-02-01") & theData$Date <= as.Date("2007-02-02"), ]
theData$Seq <- sprintf("%s %s", theData$Date, theData$Time)
theData$Seq <- strptime(theData$Seq, "%Y-%m-%d %H:%M:%S")
theData$Global_active_power <- as.numeric(theData$Global_active_power)
theData$Global_reactive_power <- as.numeric(theData$Global_reactive_power)
theData$Voltage <- as.numeric(theData$Voltage)

theData$Sub_metering_1 <- as.numeric(theData$Sub_metering_1)
theData$Sub_metering_2 <- as.numeric(theData$Sub_metering_2)
theData$Sub_metering_3 <- as.numeric(theData$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(theData$Seq, theData$Global_active_power, type="l", 
	ylab="Global Active Power",
	xlab="",
     cex=0.2)


plot(theData$Seq, theData$Voltage, type="l", 
	ylab="Voltage",
	xlab="Datetime")

plot(theData$Seq, theData$Sub_metering_1, type="l", 
	ylab="Global Active Power",
	xlab="")

lines(theData$Seq, theData$Sub_metering_2, type="l", col="red")
lines(theData$Seq, theData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(theData$Seq, theData$Global_reactive_power, type="l",
	ylab="Global Reactive Power",
	xlab="Datetime")
dev.off()

