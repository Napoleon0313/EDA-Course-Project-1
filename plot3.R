library(data.table)
library(dplyr)
library(lubridate)
setwd("D:/Data File/Coursera/Data Science-JHU/Exploratory Data Analysis/Week 1/Course Project 1")
data <- fread("./household_power_consumption.txt",na.strings = "?",data.table = FALSE) %>%
        filter(Date %in% c("1/2/2007","2/2/2007")) %>%
        mutate(Date_Time = paste(Date,Time,sep = " ")) %>%
        select(Date_Time:Global_active_power)
data$Date_Time <- strptime(data$Date_Time,format = "%d/%m/%Y %H:%M:%S")

# plot
with(data,plot(Date_Time,Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering"))
with(data,lines(Date_Time,Sub_metering_1,col = "black"))
with(data,lines(Date_Time,Sub_metering_2,col = "red"))
with(data,lines(Date_Time,Sub_metering_3,col = "blue"))
legend("topright",col = c("black","red","blue"),legend = names(data)[4:2],lty = 1,cex = 0.4)
