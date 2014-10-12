##Download and unzip the data file into the working directory
##Do not rename the file, the unzipped txt file should have the name "household_power_consumption.txt"

data<-read.table("household_power_consumption.txt",sep = ";", header=TRUE, colClasses = c(rep("character",9)))
data<-data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
hist(data$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png,file="plot1.png", width = 480, height = 480)
dev.off()