## Week 1:

pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
pwr <- subset(pwr,pwr$Date == "2007-02-01"|pwr$Date =="2007-02-02")
png(filename = "plot3.png",width = 480, height = 480)
with(pwr, plot(DateTime,Sub_metering_1, "l", ylab = "Energy Sub Metering"))
lines(pwr$DateTime,pwr$Sub_metering_2,col = "red")
lines(pwr$DateTime,pwr$Sub_metering_3,col = "blue")
dev.off()
