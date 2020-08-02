#import and clean data
data<-read.csv("household_power_consumption.txt", sep=";")
filter_data<-filter(data, Date=="1/2/2007"| Date=="2/2/2007")
a<-as.Date(filter_data$Date, "%d/%m/%y")
select_data<-mutate(filter_data, Date=a)

#plot1
hist(as.numeric(select_data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
png("plot1.png", width = 480, height = 480)
dev.off()      
    