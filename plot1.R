plot1 <- function(filename, dates){
  myTable <- read.table (filename,header=TRUE,sep=";",na.strings="?",as.is=TRUE)
  GlobalActivePower <- NULL
  for (i in 1:length(dates)){
    GlobalActivePower <- c(GlobalActivePower, 
                           myTable[myTable[,"Date"] == dates[i],
                                   "Global_active_power"])
  }
  hist(GlobalActivePower, col="red", breaks=12, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png")
  dev.off()
}