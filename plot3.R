library(dplyr)
library(datasets)
library(tidyr)
a<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
a<-subset(a, Date == "1/2/2007"| Date == "2/2/2007")
a$dateTime<-paste(a$Date, a$Time)
a$dateTime<-strptime(a$dateTime, format = "%d/%m/%Y %H:%M:%S")
a$Global_active_power<-as.numeric(a$Global_active_power)
plot(a$dateTime, a$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(a$dateTime, a$Sub_metering_2, type = "l", col = "red")
lines(a$dateTime, a$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = .75, cex = .75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#creating png file
dev.copy(png, file = "plot3.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()




