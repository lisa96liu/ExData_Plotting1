#setwd and read the txt file
setwd("C:/Users/Lisa Liu/Desktop/Data Science Course/Course 4 Exploratory Data Analysis")
power<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
#use dplyr to help with manipulating tabular data
library(dplyr)
powerdf<-tbl_df(power) #better formatted data frame
rm(power)
#subset the desired dates
subset <- filter(powerdf, Date == "1/2/2007" | Date == "2/2/2007")

#change global active power to character
glob.act<- as.character(subset$Global_active_power)
#then, change to numeric
glob.act<- as.numeric(glob.act)

#fix time variable
Dates <- as.character(subset$Date)
Dates <- strptime(Dates, "%d/%m/%Y") #convert date into POSIXlt
#get day of week
library(lubridate)
dayofweek<- wday(Dates)
dayofweek<-as.numeric(dayofweek)
#create new dataframe
df <-cbind(dayofweek, glob.act)

plot(glob.act, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

#draw x axis
axis(side = 1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#save as png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
#close device
dev.off()
