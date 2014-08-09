url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./household_power_consumption.zip", mode = "wb")
#numbers of records to read (in command below) checked by experimenting with file
#not using "skip" option in order to read the variables' names
data = read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), na.strings="?", header=T, sep=";", nrows=69516)
data = subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data$datetime = paste(as.character(data$Date),as.character(data$Time))
data$datetime = strptime(data$datetime,"%d/%m/%Y %H:%M:%S")
png(filename="plot1.png", width=480, height=480, bg="white", units="px", pointsize=12)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="plot1.png")
dev.off()
dev.off()
