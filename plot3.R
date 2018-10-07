# Coursera Data Science: Exploratory Data Analysis
# To create plot3.png

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
elec$Sub_metering_1 <- as.numeric(paste(elec$Sub_metering_1))
elec$Sub_metering_2 <- as.numeric(paste(elec$Sub_metering_2))
elec$Sub_metering_3 <- as.numeric(paste(elec$Sub_metering_3))

# plot data
attach(elec)
plot(datetime, Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(datetime, Sub_metering_2, col = "Red")
lines(datetime, Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(elec)
