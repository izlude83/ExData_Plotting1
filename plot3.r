HHdata <-  read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows = 2075259, comment.char = "")
HHdata1 = HHdata[HHdata$Date == "1/2/2007" | HHdata$Date =="2/2/2007",]

HHdata1$Global_active_power = as.numeric(as.character(HHdata1$Global_active_power))
HHdata1$NewDate <- as.Date(HHdata1$Date, "%d/%m/%Y")
HHdata1$NewDate <- paste (HHdata1$NewDate, HHdata1$Time, sep = " ")
HHdata1$NewDate <- strptime(HHdata1$NewDate, "%Y-%m-%d  %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)
HHdata1$Sub_metering_1 = as.numeric(as.character(HHdata1$Sub_metering_1))
HHdata1$Sub_metering_2 = as.numeric(as.character(HHdata1$Sub_metering_2))
HHdata1$Sub_metering_3 = as.numeric(as.character(HHdata1$Sub_metering_3))
plot(HHdata1$NewDate, HHdata1$Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy Sub Metering", ylim = c(0, max(HHdata1$Sub_metering_1, HHdata1$Sub_metering_2, HHdata1$Sub_metering_3)))
par(new = TRUE)
plot(HHdata1$NewDate, HHdata1$Sub_metering_2, type="l", col = "red", xlab = "", ylab = "Energy Sub Metering", ylim = c(0, max(HHdata1$Sub_metering_1, HHdata1$Sub_metering_2, HHdata1$Sub_metering_3)))
par(new = TRUE)
plot(HHdata1$NewDate, HHdata1$Sub_metering_3, type="l", col = "blue", xlab = "", ylab = "Energy Sub Metering", ylim = c(0, max(HHdata1$Sub_metering_1, HHdata1$Sub_metering_2, HHdata1$Sub_metering_3)))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off ()