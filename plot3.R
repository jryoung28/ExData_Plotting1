library(dplyr)
library(datasets)
library(lubridate)
rawfile <- read.table("household_power_consumption.txt", sep = ';', na.strings = "?", header = TRUE)
rawfile$Date <- as.Date(rawfile$Date, "%d/%m/%Y")
household <- subset(rawfile, Date >= "2007-02-01" & Date <= "2007-02-02" )

# merge date and time and add to the household data frame
household <- mutate(household, date_time = as.POSIXct(paste(household$Date, as.character(household$Time))) ) 

# set par
par(mfrow = c(1,1))

#plot the line graph
with(household, plot(Sub_metering_1 ~ date_time, type = "l", ylab = "Energy sub metering", xlab = ""))
with(household, lines(Sub_metering_2 ~ date_time, col = "red"))
with(household, lines(Sub_metering_3 ~ date_time, col = "blue"))

legend("topright", lty = 1, cex = 0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )



dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()