## Plot1.R

numberOfRows <-  2*24*60

## Load data
header <- read.csv("household_power_consumption.txt", nrows=2, sep=";")
data <- read.csv("household_power_consumption.txt", header=FALSE, skip=66637, nrows=numberOfRows, sep=";", na.strings="?")

# Set names to data
names(data) <- names( header )

## Transform dates
data$Date <- as.Date( data$Date, format="%d/%m/%Y" )

## Print to file
png(filename ="plot1.png", width = 480, height = 480,bg = "white")
hist( data$Global_active_power, ylim=c(0,1200), col="red", xlab="Global active power (kilowatts)", main="Global Active Power")
dev.off()