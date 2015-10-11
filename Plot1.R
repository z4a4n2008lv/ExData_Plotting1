Plot1 <- function(){
    exdata<- read.csv("/media/z4a4n2008lv/32BB16C717126E7D/BigData/Exploratory Data Analysis/Assets/household_power_consumption.txt",sep=";",header = TRUE)
    exData<- with(exdata,subset(exdata,Date=="2/2/2007" | Date=="1/2/2007"))
    remove(exdata)
    exData$Date <- as.Date(exData$Date, format = "%d/%m/%Y")
    exData$timetemp <- paste(exData$Date, exData$Time)
    exData$Time <- strptime(exData$timetemp, format = "%Y-%m-%d %H:%M:%S")
    exData<- exData[,2:9]
    exData$Global_active_power = as.numeric(exData$Global_active_power)
    png(filename = "/media/z4a4n2008lv/32BB16C717126E7D/BigData/Exploratory Data Analysis/Assets/Assignment 1/Plot1.png",width = 480,height = 480,units = "px")
    hist(exData$Global_active_power,col = "red",xlab = "Global Active Power(KiloWatts)",main = "Global Active Power" ,ylim = c(0,1200))
    dev.off()
}