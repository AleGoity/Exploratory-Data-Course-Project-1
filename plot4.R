#import and clean data
data<-read.csv("household_power_consumption.txt", sep=";")
filter_data<-filter(data, Date=="1/2/2007"| Date=="2/2/2007")

a<-paste(filter_data$Date, filter_data$Time)
b<-strptime(a, "%d/%m/%Y %H:%M:%S")
select_data<-mutate(filter_data, date_time=b)

#plot4
png("plot4.png", width = 480, height = 480)
#to make four graphics
par(mfrow=c(2,2))
#graphic 1
plot(select_data$date_time,as.numeric(select_data$Global_active_power), ylab = "Global Active Power", xlab = "", type = "l")
#graphic 2
plot(select_data$date_time,as.numeric(select_data$Voltage), ylab = "Voltage", xlab = "datetime", type = "l")

#graphic 3
plot(select_data$date_time,as.numeric(select_data$Sub_metering_1), ylab = "Energy sub metering", xlab = "", type = "l")
legend("topright", lty=1,col = c("black", "red", "blue"), legend = c("Sub_mertering_1", "Sub_metering_2", "Sub_metering_3"))
lines(select_data$date_time,as.numeric(select_data$Sub_metering_2), col="red")
lines(select_data$date_time,as.numeric(select_data$Sub_metering_3), col="blue")

#graphic 4
plot(select_data$date_time,as.numeric(select_data$Global_reactive_power), xlab = "datetime", ylab="Global_reactive_power", type = "l")

dev.off()   
