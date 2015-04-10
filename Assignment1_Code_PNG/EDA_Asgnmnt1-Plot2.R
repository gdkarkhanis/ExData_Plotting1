## Coursera Course: Exploratory Data Analysis
## Project Assignment 1 
## Data Source: UCI - Electric Power Consumption
## By Girish Karkhanis - Due 4/12/15

## Set path for working directory, download & extract
setwd("C:\\Users\\hp\\datasciencecoursera\\EDA")
library(sqldf)
myfile <- "household_power_consumption.txt"
mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
## Read extracted file
meters<-read.csv.sql(file=myfile, sql=mysql, header = TRUE, sep = ";")
## meters_n1<-as.xts(read.zoo(meters))
## meters$Date<-as.Date(meters$Date, format='%d/%m/%Y')
meters$Date<-strptime(paste(meters$Date,meters$Time), format='%d/%m/%Y %H:%M:%S')
head(meters)
weekd<-weekdays(meters$Date)
meters_n<-cbind(meters, weekd)
head(meters_n)
unique(weekd)
## Develop Plots as required

## Plot2 (Global Active Power(Y) vs Days(X))
png(filename="plot2.png", width = 480, height = 480, bg = "white")
plot(meters$Date,meters$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()

## End
