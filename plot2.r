HHdata <-  read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows = 2075259, comment.char = "")
HHdata1 = HHdata[HHdata$Date == "1/2/2007" | HHdata$Date =="2/2/2007",]

HHdata1$Global_active_power = as.numeric(as.character(HHdata1$Global_active_power))
png(file = "plot2.png", width = 480, height = 480)
HHdata1$NewDate <- as.Date(HHdata1$Date, "%d/%m/%Y")
HHdata1$NewDate <- paste (HHdata1$NewDate, HHdata1$Time, sep = " ")
HHdata1$NewDate <- strptime(HHdata1$NewDate, "%Y-%m-%d  %H:%M:%S")
plot(HHdata1$NewDate, HHdata1$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off ()