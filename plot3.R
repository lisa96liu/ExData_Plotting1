#setwd and read the txt file
setwd("C:/Users/Lisa Liu/Desktop/Data Science Course/Course 4 Exploratory Data Analysis")
power<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
#use dplyr to help with manipulating tabular data
library(dplyr)
powerdf<-tbl_df(power) #better formatted data frame
rm(power)


#subset the desired dates
subset <- filter(powerdf, Date == "1/2/2007" | Date == "2/2/2007")

#change sub metering to character
sm1<- as.character(subset$Sub_metering_1)
sm2<- as.character(subset$Sub_metering_2)
sm3<- as.character(subset$Sub_metering_3)
#then, change to numeric
sm1<- as.numeric(sm1)
sm2<- as.numeric(sm2)
sm3<- as.numeric(sm3)

#make plot
plot(sm1, type = "s", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(sm2, type = "s", xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "red")
lines(sm3, type = "s", xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "blue")

#draw x axis
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#add legend 
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#save as png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
#close device
dev.off()
