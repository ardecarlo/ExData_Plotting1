plot4 <- function(filename, dates){
  myTable <- read.table (filename,header=TRUE,sep=";",na.strings="?",as.is=TRUE)
  GlobalActivePower <- NULL
  Global_reactive_power <- NULL
  Voltage <- NULL
  Sub_metering_1 <- NULL
  Sub_metering_2 <- NULL
  Sub_metering_3 <- NULL
  Date <- NULL
  Time <- NULL
  for (i in 1:length(dates)){
    idx <- myTable[,"Date"] == dates[i]
    GlobalActivePower <- c(GlobalActivePower, myTable[idx, "Global_active_power"])
    Global_reactive_power <- c(Global_reactive_power, 
                               myTable[idx, "Global_reactive_power"])
    Voltage <- c(Voltage, myTable[idx, "Voltage"])
    Sub_metering_1 <- c(Sub_metering_1, myTable[idx, "Sub_metering_1"])
    Sub_metering_2 <- c(Sub_metering_2, myTable[idx, "Sub_metering_2"])
    Sub_metering_3 <- c(Sub_metering_3, myTable[idx, "Sub_metering_3"])
    Time <- c(Time, myTable[idx, "Time"])
    Date <- c(Date, myTable[idx, "Date"])
  }
  Date <- strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")
  par(mfrow=c(2,2))
  plot(Date, GlobalActivePower, ylab="Global Active Power", type="l")
  plot(Date, Voltage, type="l")
  plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering")
  lines(Date, Sub_metering_2, type="l", col="red")
  lines(Date, Sub_metering_3, type="l", col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1, cex=0.25)
  plot(Date, Global_reactive_power, type="l")
  
  dev.copy(png, file="plot4.png")
  dev.off()
}