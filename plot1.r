HHdata <-  read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows = 2075259, comment.char = "")
HHdata1 = HHdata[HHdata$Date == "1/2/2007" | HHdata$Date =="2/2/2007",]

HHdata1$Global_active_power = as.numeric(as.character(HHdata1$Global_active_power))
png(file = "plot1.png", width = 480, height = 480)
hist(HHdata1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off ()