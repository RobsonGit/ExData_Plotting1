url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./household_power_consumption.zip", mode = "wb")
#numbers of records to read (in command below) checked by experimenting with file
#not using "skip" option in order to read the variables' names
data = read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), na.strings="?", header=T, sep=";", nrows=69516)
data = subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data$datetime = paste(as.character(data$Date),as.character(data$Time))
data$datetime = strptime(data$datetime,"%d/%m/%Y %H:%M:%S")
#setting local time in R to English; in other case names of days are shown in local language on chart
Sys.setlocale("LC_TIME","English United States")
png(filename="plot4.png", width=480, height=480, bg="white", units="px", pointsize=12)
par(mfcol=c(2,2))
plot(data$datetime, data$Global_active_power, xlab=NA, ylab="Global Active Power", type="l")
plot(data$datetime, data$Sub_metering_1, xlab=NA, ylab="Energy sub metering", type="l")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
plot(data$datetime, data$Voltage, xlab="datetime", ylab="Voltage", type="l", yaxt="n")
axis(2, at=c(234,236,238,240,242,244,246), labels=c(234,NA,238,NA,242,NA,246))
plot(data$datetime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.copy(png, file="plot4.png")
dev.off()
dev.off()
