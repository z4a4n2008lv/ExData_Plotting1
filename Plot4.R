Plot4 <- function(){
    exdata<- read.csv("/media/z4a4n2008lv/32BB16C717126E7D/BigData/Exploratory Data Analysis/Assets/household_power_consumption.txt",sep=";",header = TRUE)
    png(filename = "/media/z4a4n2008lv/32BB16C717126E7D/BigData/Exploratory Data Analysis/Assets/Assignment 1/Plot4.png",width = 480,height = 480,units = "px")
    exData<- with(exdata,subset(exdata,Date=="2/2/2007" | Date=="1/2/2007"))
    remove(exdata)
    exData$Date <- as.Date(exData$Date, format = "%d/%m/%Y")
    exData$timetemp <- paste(exData$Date, exData$Time)
    exData$Time <- strptime(exData$timetemp, format = "%Y-%m-%d %H:%M:%S")
    exData<- exData[,2:9]
    exData$Global_active_power = as.numeric(exData$Global_active_power)
    exData$Sub_metering_1 = as.numeric(exData$Sub_metering_1)
    exData$Sub_metering_2 = as.numeric(exData$Sub_metering_2)
    exData$Sub_metering_3 = as.numeric(exData$Sub_metering_3)
    exData$Global_reactive_power = as.numeric(exData$Global_reactive_power)
    par(mfrow = c(2,2),mar = c(4,4,2,1))
    
    ##Plot 1
    plot(exData$Time,exData$Global_active_power,type = "n",ylab = "Global Active Power(Kilowatts)",xlab = "")
    lines(exData$Time,exData$Global_active_power)
    ##Plot 2
    plot(exData$Time,exData$Voltage,type = "n",ylab = "Voltage",xlab = "")
    lines(exData$Time,exData$Voltage)
    ##Plot 3
    with(exData,plot(Time,Sub_metering_1,type = "n",xlab = "",ylab = "Energy Sub Metering"))
    axis(2,at = seq(0,30,by=10))
    with(exData,lines(Time,Sub_metering_1,col="black"))
    with(exData,lines(Time,Sub_metering_2,col="red"))
    with(exData,lines(Time,Sub_metering_3,col="blue"))
    legend("topright",lwd = 4,cex = 1.2,col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
    ##Plot 4
    with(exData,plot(Time,Sub_metering_1,type = "n",xlab = "",ylab = "Global_reactive_power",ylim = c(0,200)))
    with(exData,lines(Time,Global_reactive_power,col="black"))
    dev.off()
}