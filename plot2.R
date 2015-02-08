library(dplyr)
library(datasets)
library(tidyr)
a<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
a<-subset(a, Date == "1/2/2007"| Date == "2/2/2007")
a$dateTime<-paste(a$Date, a$Time)
a$dateTime<-strptime(a$dateTime, format = "%d/%m/%Y %H:%M:%S")
plot(a$dateTime, a$Global_active_power, xlab = "time", ylab = "Global Active Power (kilowatts)", type = "l")
#creating png file
dev.copy(png, file = "plot2.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()







