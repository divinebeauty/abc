library(datasets)
library(dplyr)
library(tidyr)
a<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
a<-subset(a, Date == "1/2/2007"| Date == "2/2/2007")
class(a$Time)
a$dateTime<-paste(a$Date, a$Time)
a$dateTime<-strptime(a$dateTime, format = "%d/%m/%Y %H:%M:%S")
a$Global_active_power<-as.numeric(a$Global_active_power)
par(mfrow = c(2,2))
plot(a$dateTime, a$Global_active_power, ylab = "Global Active Power",xlab = "" ,type = "l")
plot(a$dateTime, a$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
plot(a$dateTime, a$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(a$dateTime, a$Sub_metering_2, type = "l", col = "red")
lines(a$dateTime, a$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = .6, cex = .6, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(a$dateTime, a$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0.0, 0.5), type = "l")
#creating png file
dev.copy(png, file = "plot4.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()




