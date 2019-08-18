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
par(mfrow = c(2,2))
Sys.setlocale("LC_TIME", "English")

# No.1
with(data,plot(Date_Time,Global_active_power,type = "l",xlab = "",ylab = "Global active power"))

# No.2
with(data,plot(Date_Time,Voltage,type = "l",xlab = "datetime",ylab = "Voltage",col ="black"))

# No.3
with(data,plot(Date_Time,Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering"))
with(data,lines(Date_Time,Sub_metering_1,col = "black"))
with(data,lines(Date_Time,Sub_metering_2,col = "red"))
with(data,lines(Date_Time,Sub_metering_3,col = "blue"))
legend("topright",col = c("black","red","blue"),legend = names(data)[4:2],lty = 1,bty = "n",cex = 0.6,x.intersp = 1, y.intersp = 0.2)

# No.4
with(data,plot(Date_Time,Global_reactive_power,type = "l",col = "black",xlab = "datetime",ylab ="Global_reactive_power"))

dev.copy(png, width = 480, height = 480,file = "./EDA-Course Project 1/plot4.png")
dev.off()
