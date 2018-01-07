# Read datafile
household_consumption <- read.table("./Data/Power_consumption/household_power_consumption.txt",sep = ";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?")
View(household_consumption)
# convert variable Date to character format
household_consumption$Date <- as.character(household_consumption$Date)
# Read data from 2007-02-01 and 2007-02-02
Sub_household_consumption <- subset(household_consumption,Date == c("1/2/2007","2/2/2007"))
View(Sub_household_consumption)
Sub_household_consumption$Global_active_power <- as.numeric(Sub_household_consumption$Global_active_power)
dim(Sub_household_consumption)
# Plotting & copying to png file
hist(Sub_household_consumption$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(Kilowatts)")
dev.copy(png,file = "plot1.png",width = 480, height = 480, units = "px") # copy my plot to a PNG file
dev.off()