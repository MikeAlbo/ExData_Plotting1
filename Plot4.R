Plot4 <- function() {
        #get data
        data.source <- read.table("household_power_consumption.txt", comment.char= "", 
                                  sep= ";", na.strings= "?", skip= 66600, n= 3050)
        #convert to data frame
        data <- data.frame(data.source)
        
        #subset data for date range
        range <- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')
        
        #date and time conversion 
        
        date <- as.character(range$V1)
        
        time <- as.character(range$V2)
        
        date.time <- paste(date, time)
        
        date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")
        
        png(filename= "Plot4.png", width= 480, height= 480)
        par(mfrow=c(2,2))
        plot(date.time, range$V3, xlab="", ylab= "Global Active Power", type= "l")
        plot(date.time, range$V5, xlab="datetime", ylab="Voltage", type="l")
        plot(date.time, range$V7, col= "black", type= "l", ylab= "Energy sub metering", xlab="")
        lines(date.time, range$V8, col="red", type= "l")
        lines(date.time, range$V9, col= "blue", type="l")
        legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch= "_", col=c("black", "red", "blue"))
        plot(date.time, range$V4, xlab="datetime", ylab= "Global_reactive_power", type= "l")
        
        dev.off()
}