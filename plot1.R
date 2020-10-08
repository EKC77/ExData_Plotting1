## Subsetting the data

data<-read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors = FALSE)

## subseting the data before converting to correct formats
subset1 <- rbind(data[which(data$Date=="1/2/2007",arr.ind = FALSE),],data[which(data$Date=="2/2/2007",arr.ind = FALSE),])

## combining time and date by pasting characters 
subset1$datetime<-paste(subset1$Date,subset1$Time)

##setting formats
subset1$datetime<-as.POSIXct(subset1$datetime, format="%d/%m/%Y %H:%M:%S")
subset1$Global_active_power <- as.numeric(subset1$Global_active_power)
subset1$Global_reactive_power <- as.numeric(subset1$Global_reactive_power)
subset1$Voltage <- as.numeric(subset1$Voltage)
subset1$Global_intensity <- as.numeric(subset1$Global_intensity)
subset1$Sub_metering_1 <- as.numeric(subset1$Sub_metering_1)
subset1$Sub_metering_2 <- as.numeric(subset1$Sub_metering_2)
subset1$Sub_metering_3 <- as.numeric(subset1$Sub_metering_3)
str(subset1)


##PLOT 1
png(file="plot1.png",width=480,height=480)
hist(subset1$Global_active_power,xlab="Global Active Power (kilowatts)",col='red',main= "Global Active Power")
dev.off()
