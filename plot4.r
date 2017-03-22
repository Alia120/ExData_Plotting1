## Week 1:

pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
pwr <- subset(pwr,pwr$Date == "2007-02-01"|pwr$Date =="2007-02-02")
pwr$DateTime <- as.POSIXct(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
with(pwr, plot(DateTime,Global_active_power,"l",ylab = "Global Active Power (kilowatts)",xlab = ""))
with(pwr, plot(DateTime,Voltage,"l"))
with(pwr, plot(DateTime,Sub_metering_1, "l", ylab = "Energy Sub Metering",xlab = ""))
lines(pwr$DateTime,pwr$Sub_metering_2,col = "red")
lines(pwr$DateTime,pwr$Sub_metering_3,col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),
       col=c('black','red','blue'),ncol=1)
with(pwr, plot(DateTime,Global_reactive_power,"l"))
dev.off()