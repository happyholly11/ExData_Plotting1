##Download and unzip the data file into the working directory
##Do not rename the file, the unzipped txt file should have the name "household_power_consumption.txt"

data<-read.table("household_power_consumption.txt",sep = ";", header=TRUE, colClasses = c(rep("character",9)))
data<-data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
#data$Global_active_power<-as.numeric(data$Global_active_power)
#data$Voltage<-as.numeric(data$Voltage)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#Plot 1
plot(data$Global_active_power~data$DateTime, xlab="",ylab="Global Active Power (kilowatts)", type="l")
#Plot 2
plot(data$Voltage~data$DateTime,xlab="datetime",ylab="Voltage",type="l")
#Plot 3
plot(data$Sub_metering_1~data$DateTime, xlab="", ylab="Energy sub metering", type="l")
lines(data$Sub_metering_2~data$DateTime,col="red")
lines(data$Sub_metering_3~data$DateTime,col="blue")
legend("topright",bty = "n", lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 4
plot(data$Global_reactive_power~data$DateTime, xlab="datetime",, type="l")
dev.off()