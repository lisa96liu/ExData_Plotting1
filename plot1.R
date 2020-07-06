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
#plot histogram
hist(glob.act, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#save as png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
#close device
dev.off()