# Coursera Data Science: Exploratory Data Analysis
# To create plot4.png

# load data
tmp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tmp)
elec <- read.table(unzip(tmp), sep=";", header = TRUE)
unlink(tmp);rm(tmp)

# change format
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
elec <- subset(elec, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
elec$datetime <- strptime(paste(elec$Date, elec$Time), "%Y-%m-%d %H:%M:%S")
elec$Global_active_power <- as.numeric(paste(elec$Global_active_power))
elec$Global_reactive_power <- as.numeric(paste(elec$Global_reactive_power))
elec$Voltage <- as.numeric(paste(elec$Voltage))
elec$Sub_metering_1 <- as.numeric(paste(elec$Sub_metering_1))
elec$Sub_metering_2 <- as.numeric(paste(elec$Sub_metering_2))
elec$Sub_metering_3 <- as.numeric(paste(elec$Sub_metering_3))

# plot data
par(mfrow = c(2,2))
# plot (1.1)
with(elec, plot(datetime, Global_active_power,
                ylab="Global Active Power (kilowatts)", xlab="", type = "l"))

attach(elec)
# plot (2.1)
plot(datetime, Voltage, type = "l", xlab="")

# plot (2.1)
plot(datetime, Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(datetime, Sub_metering_2, col = "Red")
lines(datetime, Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# plot (2.2)
plot(datetime, Global_reactive_power, type = "l", xlab="")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(elec)
