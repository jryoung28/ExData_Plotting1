library(dplyr)
library(datasets)
rawfile <- read.table("household_power_consumption.txt", sep = ';', na.strings = "?", header = TRUE)
rawfile$Date <- as.Date(rawfile$Date, "%d/%m/%Y")
household <- subset(rawfile, Date >= "2007-02-01" & Date <= "2007-02-02" )

# set par
par(mfrow = c(1,1))

#plot the line graph
hist(household$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# copy to png 
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()