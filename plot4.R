#setwd and read the txt file
setwd("C:/Users/Lisa Liu/Desktop/Data Science Course/Course 4 Exploratory Data Analysis")
power<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
#use dplyr to help with manipulating tabular data
library(dplyr)
powerdf<-tbl_df(power) #better formatted data frame
rm(power)


#subset the desired dates
subset <- filter(powerdf, Date == "1/2/2007" | Date == "2/2/2007")

#define the variables
glob.act<- as.character(subset$Global_active_power)
glob.act<- as.numeric(glob.act)
volt <- as.character(subset$Voltage)
volt <- as.numeric(volt)
sm1<- as.character(subset$Sub_metering_1)
sm2<- as.character(subset$Sub_metering_2)
sm3<- as.character(subset$Sub_metering_3)
sm1<- as.numeric(sm1)
sm2<- as.numeric(sm2)
sm3<- as.numeric(sm3)
glob.react <- as.character(subset$Global_reactive_power)
glob.react <- as.numeric(glob.react)

#set up the plot window into 2x2
par(mfrow = c(2,2), mar =c(4, 4, 2, 1))

#top left plot from plot2.R
plot(glob.act, type = "s", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#top right plot
plot(volt, type = "s", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))


#bottom left plot from plot3.R
plot(sm1, type = "s", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(sm2, type = "s", xaxt = "n", col = "red")
lines(sm3, type = "s", xaxt = "n", col = "blue")

axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.45, bty="n")

#bottom right plot
plot(glob.react, type = "s", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#save as png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
#close device
dev.off()

