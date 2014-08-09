plot2 <- function(filename, dates){
  myTable <- read.table (filename,header=TRUE,sep=";",na.strings="?",as.is=TRUE)
  GlobalActivePower <- NULL
  Date <- NULL
  Time <- NULL
  for (i in 1:length(dates)){
    GlobalActivePower <- c(GlobalActivePower, 
                           myTable[myTable[,"Date"] == dates[i],
                                   "Global_active_power"])
    Time <- c(Time, myTable[myTable[,"Date"] == dates[i], "Time"])
    Date <- c(Date, myTable[myTable[,"Date"] == dates[i], "Date"])
  }
  Date <- strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")
  plot(Date,GlobalActivePower,type="l",main="Global Active Power", 
       ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
}