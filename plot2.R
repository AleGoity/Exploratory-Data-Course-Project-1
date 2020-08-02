#import and clean data
data<-read.csv("household_power_consumption.txt", sep=";")
filter_data<-filter(data, Date=="1/2/2007"| Date=="2/2/2007")

a<-paste(filter_data$Date, filter_data$Time)
b<-strptime(a, "%d/%m/%Y %H:%M:%S")
select_data<-mutate(filter_data, date_time=b)

#plot2
png("plot2.png", width = 480, height = 480)
plot(select_data$date_time,as.numeric(select_data$Global_active_power), ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()   
