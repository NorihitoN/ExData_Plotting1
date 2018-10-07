# Coursera Data Science: Exploratory Data Analysis
# To create plot2.png

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

# plot data
with(elec, plot(datetime, Global_active_power, main="Global Active Power", 
                ylab="Global Active Power (kilowatts)", xlab="", type = "l"))

# save png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
