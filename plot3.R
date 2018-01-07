# Read datafile
household_consumption <- read.table("./Data/Power_consumption/household_power_consumption.txt",sep = ";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?")
View(household_consumption)
# convert variable Date & Time to character format
household_consumption$Date <- as.character(household_consumption$Date)
household_consumption$Time <- as.character(household_consumption$Time)
# Read data from 2007-02-01 and 2007-02-02
Sub_household_consumption <- subset(household_consumption,Date == c("1/2/2007","2/2/2007"))
View(Sub_household_consumption)
class(Sub_household_consumption$Date)
class(Sub_household_consumption$Time)
Sub_household_consumption$Global_active_power <- as.numeric(Sub_household_consumption$Global_active_power)
# paste the variables Date & Time 
Sub_household_consumption$Date_TIme <- paste(Sub_household_consumption$Date,Sub_household_consumption$Time,sep = "_")
# convert variable Date to Date format
library(lubridate)
Sub_household_consumption$Date_TIme <- dmy_hms(Sub_household_consumption$Date_TIme)
class(Sub_household_consumption$Date_TIme)
# Plotting & copying to png file
with(Sub_household_consumption,plot(Date_TIme,Sub_metering_1,type = "n",ylab = "Energy Sub Metering"))
with(Sub_household_consumption,points(Date_TIme,Sub_metering_1,type="l",col="black"))
with(Sub_household_consumption,points(Date_TIme,Sub_metering_2,type="l",col="red"))
with(Sub_household_consumption,points(Date_TIme,Sub_metering_3,type="l",col="blue"))
legend("topright", lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "plot3.png",width = 480, height = 480, units = "px") # copy my plot to a PNG file
dev.off()
