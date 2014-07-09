Plot2 <- function() {
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
        
        #weekdays <- weekdays(date.time, abbreviate=TRUE)

        
        #add lines below if it works
        # DT.GAP <- data.frame(days, range$V3)
        
        
        #when plot works add .png lines
        png(filename= "Plot2.png", width= 480, height= 480)

        plot(date.time, range$V3, xlab="", ylab= "Global Active Power (kilowatts)", type= "l")
        
        dev.off()
}