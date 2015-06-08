#First the data is loaded into R
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
#A subset is made, keeping only the relevant dates
hpc<- subset(household_power_consumption, Date=="1/2/2007" | Date== "2/2/2007")
#The date and time settings of the variables in the input table are converted
Sys.setlocale("LC_TIME", "English_Colombia.1252")
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S", tz="GMT")
hpc$Weekdays<-weekdays(hpc$DateTime)

#The file is created
png(filename="plot4.png", width=480, height=480)
#A 2x2 layout is created for the 4 graphs
par(mfcol=c(2,2))
#Plotting functions
with(hpc, {
  #First plot is created
  plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts")
  #Second plot is created
  plot(DateTime, c(Sub_metering_1), type="n", ylab="Energy sub metering", xlab="", yaxt="n")
    #Appropriate axis addead
    axis(2,at=c(0,10,20,30))
    #First variable added
    lines(hpc$DateTime,hpc$Sub_metering_1, col="black")
    #Second variable added
    lines(hpc$DateTime,hpc$Sub_metering_2, col="red")
    #Third variable added
    lines(hpc$DateTime,hpc$Sub_metering_3, col="blue")
    #Legend added
    legend("topright", bty="n",lwd=c(2.5,2.5,2.5),col=c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
  #Third plot is created
  plot(DateTime,Voltage, xlab="datetime",type="l")
  #Fourth plot is created
  plot(DateTime,Global_reactive_power, xlab="datetime",type="l")
})
dev.off()