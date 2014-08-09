plot3 <- function(filename, dates){
  myTable <- read.table (filename,header=TRUE,sep=";",na.strings="?",as.is=TRUE)
  Sub_metering_1 <- NULL
  Sub_metering_2 <- NULL
  Sub_metering_3 <- NULL
  Date <- NULL
  Time <- NULL
  for (i in 1:length(dates)){
    idx <- myTable[,"Date"] == dates[i]
    Sub_metering_1 <- c(Sub_metering_1, myTable[idx, "Sub_metering_1"])
    Sub_metering_2 <- c(Sub_metering_2, myTable[idx, "Sub_metering_2"])
    Sub_metering_3 <- c(Sub_metering_3, myTable[idx, "Sub_metering_3"])
    Time <- c(Time, myTable[idx, "Time"])
    Date <- c(Date, myTable[idx, "Date"])
  }
  Date <- strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")
  plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering")
  lines(Date, Sub_metering_2, type="l", col="red")
  lines(Date, Sub_metering_3, type="l", col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1, cex=0.8)
  dev.copy(png, file="plot3.png")
  dev.off()
}