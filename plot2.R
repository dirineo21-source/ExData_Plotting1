data <- read.table("/cloud/project/household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character","character", rep("numeric",7)))

data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()