## Week 1:
pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
pwr <- subset(pwr,pwr$Date == "2007-02-01"|pwr$Date =="2007-02-02")
pwr$DateTime <- as.POSIXct(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot1.png",width = 480, height = 480)
hist(pwr$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()

