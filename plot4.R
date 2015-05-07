# reading the data
hpc <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

# convert and subsetting data
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc2 <- hpc[ which(hpc$Date>= "2007-2-1" & hpc$Date <= "2007-2-2"), ]
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

hpc2$Sub_metering_1 <- as.numeric(as.character(hpc2$Sub_metering_1))
hpc2$Sub_metering_2 <- as.numeric(as.character(hpc2$Sub_metering_2))
hpc2$Sub_metering_3 <- as.numeric(as.character(hpc2$Sub_metering_3))
hpc2$Voltage <- as.numeric(as.character(hpc2$Voltage))
hpc2$Global_reactive_power <- as.numeric(as.character(hpc2$Global_reactive_power))

hpc2$Time <- strptime(paste(as.character(hpc2$Date), as.character(hpc2$Time), sep=' '), format='%Y-%m-%d %H:%M:%S')

# a column-wise 2x2 grid
par(mfcol= c(2,2))

# topleft
plot(hpc2$Time, hpc2$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")

# bottomleft
plot(hpc2$Time, hpc2$Sub_metering_1, type='l', col="black", ylab="Energy sub metering", xlab="")
lines(hpc2$Time, hpc2$Sub_metering_2, col="red")
lines(hpc2$Time, hpc2$Sub_metering_3, col="blue")
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex=0.5)

# topright
plot(hpc2$Time, hpc2$Voltage, type='l', ylab="Voltage", xlab="datetime")

# bottomright
plot(hpc2$Time, hpc2$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")

# save to png
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
