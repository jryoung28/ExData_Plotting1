library(dplyr)
library(datasets)
library(lubridate)
rawfile <- read.table("household_power_consumption.txt", sep = ';', na.strings = "?", header = TRUE)
rawfile$Date <- as.Date(rawfile$Date, "%d/%m/%Y")
household <- subset(rawfile, Date >= "2007-02-01" & Date <= "2007-02-02" )

# merge date and time and add to the household data frame
household <- mutate(household, date_time = as.POSIXct(paste(household$Date, as.character(household$Time))) ) 

#set par
par(mfrow = c(1,1))
#plot the line graph
with(household, plot(Global_active_power ~ date_time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()