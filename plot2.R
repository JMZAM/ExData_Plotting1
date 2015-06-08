household_power_consumption <- read.csv("~/Data_science_specialization/Exploratory_data_analysis/household_power_consumption.txt", sep=";", na.strings = "?")
hpc<- subset(household_power_consumption, Date=="1/2/2007" | Date== "2/2/2007")

#The date and time settings of the variables in the input table are converted
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S", tz="GMT")
hpc$Weekdays<-weekdays(hpc$DateTime)
#A png file is created
png(filename="plot2.png", width=480, height=480)
#The plot is created
with(hpc, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()