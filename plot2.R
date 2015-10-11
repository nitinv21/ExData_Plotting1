## Getting full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#Just get two days data 
power.consumption  <-  subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

power.consumption$DateTime <- as.POSIXct( paste(as.Date(power.consumption$Date), power.consumption$Time) )


# Plot the data
plot(power.consumption$Global_active_power~power.consumption$DateTime,ylab='Global Active Power (kilowatts)', xlab='', type='l')


## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()