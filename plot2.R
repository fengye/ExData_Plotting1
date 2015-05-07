# reading the data
hpc <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

# convert and subsetting data
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc2 <- hpc[ which(hpc$Date>= "2007-2-1" & hpc$Date <= "2007-2-2"), ]
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

hpc2$Time <- strptime(paste(as.character(hpc2$Date), as.character(hpc2$Time), sep=' '), format='%Y-%m-%d %H:%M:%S')

# a single graph
par(mfcol= c(1,1))


plot(hpc2$Time, hpc2$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")

# save to png
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

