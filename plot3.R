##Download and unzip the data file into the working directory
##Do not rename the file, the unzipped txt file should have the name "household_power_consumption.txt"

data<-read.table("household_power_consumption.txt",sep = ";", header=TRUE, colClasses = c(rep("character",9)))
data<-data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
##data$Global_active_power<-as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1~data$DateTime, xlab="", ylab="Energy sub metering", type="l")
lines(data$Sub_metering_2~data$DateTime,col="red")
lines(data$Sub_metering_3~data$DateTime,col="blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()