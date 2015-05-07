# reading the data
hpc <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

# convert and subsetting data
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc2 <- hpc[ which(hpc$Date>= "2007-2-1" & hpc$Date <= "2007-2-2"), ]
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

# a single graph
par(mfcol= c(1,1))

# plot
hist(hpc2$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")

# save to png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
