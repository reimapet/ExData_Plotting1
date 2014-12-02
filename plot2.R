## plot2.R

## I need to do this to get english daynames as I am on FInnish system
Sys.setlocale("LC_ALL", 'C')

## DEtermine number of lines to read, add 1 to get the saturday in
numberOfRows <-  2*24*60+1

## Load data
header <- read.csv("household_power_consumption.txt", nrows=2, sep=";")
data <- read.csv("household_power_consumption.txt", header=FALSE, skip=66637, nrows=numberOfRows, sep=";", na.strings="?")

# Set names to data
names(data) <- names( header )

## Transform dates
data$Date <- as.Date( data$Date, format="%d/%m/%Y" )
data$weekdate <- weekdays(data$Date)

## Print to file
png(filename ="plot2.png", width = 480, height = 480,bg = "white")
plot( data$Global_active_power, type="l", xaxt="n", ylab="Global active power (kilowatts)", xlab="" )
n <- nrow(data)
ix <- c(1, n/2+1, n)
axis(side = 1, at = ix, labels = weekdays(data$Date[ix], abbreviate=TRUE), tcl = -0.7, cex.axis = 0.7 )
dev.off()