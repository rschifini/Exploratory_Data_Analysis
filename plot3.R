data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                stringsAsFactors=FALSE,
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                na.strings = "?")

c <- as.Date(data$Date,"%d/%m/%Y")
data2 <- data[c>="2007-02-01" & c<="2007-02-02",]
rm(data)
rm(c)

data2$date_time <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

plot(data2$date_time,data2$Sub_metering_1,type = "l",col="black",xlab="",ylab = "Energy sub metering")
lines(data2$date_time,data2$Sub_metering_2,type = "l",col="red")
lines(data2$date_time,data2$Sub_metering_3,type = "l",col="blue")
legend("topright",names(data2[7:9]),col = c("black","red","blue"),lwd = 1)

dev.off()
