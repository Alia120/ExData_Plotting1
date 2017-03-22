## Week 1:

pwr <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
pwr <- subset(pwr,pwr$Date == "2007-02-01"|pwr$Date =="2007-02-02")
png(filename = "plot2.png",width = 480, height = 480)
pwr$DateTime <- as.POSIXct(paste(pwr$Date, pwr$Time), format="%Y-%m-%d %H:%M:%S")
with(pwr, plot(DateTime,Global_active_power,"l"))
dev.off()
