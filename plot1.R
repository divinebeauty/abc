library(datasets)
library(dplyr)
library(tidyr)
a<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
a<-subset(a, Date == "1/2/2007" | Date == "2/2/2007")
a$dateTime<-paste(a$Date, a$Time)
a$dateTime<-strptime(a$dateTime, format = "%d/%m/%Y %H:%M:%S")
a$Global_active_power<-as.numeric(a$Global_active_power)
class(a$Global_active_power)
hist(a$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", ylim = c(0,1200))
#creating png file
dev.copy(png, file = "plot1.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()













