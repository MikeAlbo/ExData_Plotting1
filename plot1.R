Plot1 <- function() {
        #get data
        data.source <- read.table("household_power_consumption.txt", comment.char= "", 
                                    sep= ";", na.strings= "?", skip= 66600, n= 3050)
        #convert to data frame
        data <- data.frame(data.source)
        
        #subset data for date range
        range <- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')
        
        #-----------------------------------------------------------------------------
        #print .png function
        png(filename="Plot1.png", width = 480, height= 480)
        
        #plot 1 function 
        hist(range$V3,  xlab = "Global Active Power (kilowatts)", 
                ylab = "frequency", main= "Global Active Power", col="red")
        
        dev.off()

       
}