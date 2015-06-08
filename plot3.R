household_power_consumption <- read.csv("~/Data_science_specialization/Exploratory_data_analysis/household_power_consumption.txt", sep=";", na.strings = "?")
hpc<- subset(household_power_consumption, Date=="1/2/2007" | Date== "2/2/2007")

#The date and time settings of the variables in the input table are converted
Sys.setlocale("LC_TIME", "English_Colombia.1252")
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S", tz="GMT")
hpc$Weekdays<-weekdays(hpc$DateTime)

#The png file is created
png(filename="plot3.png", width=480, height=480)
#The plot is created
with(hpc, plot(DateTime, c(Sub_metering_1), type="n", ylab="Energy sub metering", xlab="", yaxt="n"))
#Appropriate x axis added  
axis(2,at=c(0,10,20,30))
#First variable data added
lines(hpc$DateTime,hpc$Sub_metering_1, col="black")
#Second variable data added
lines(hpc$DateTime,hpc$Sub_metering_2, col="red")
#Third variable data added
lines(hpc$DateTime,hpc$Sub_metering_3, col="blue")
#Legend added
legend("topright", lwd=c(2.5,2.5,2.5),col=c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
dev.off()