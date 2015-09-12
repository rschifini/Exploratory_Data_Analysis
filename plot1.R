data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                stringsAsFactors=FALSE,
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                na.strings = "?")

c <- as.Date(data$Date,"%d/%m/%Y")
data2 <- data[c>="2007-02-01" & c<="2007-02-02",]
rm(data)
rm(c)

data2$date_time <- strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480)

hist(data2$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()