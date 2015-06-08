#First the data is loaded into R
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
#A subset is made, keeping only the relevant dates
hpc<- subset(household_power_consumption, Date=="1/2/2007" | Date== "2/2/2007")

#The code for the first plot follows
#Plot 1
#A 480x480 png file is created
png(filename="plot1.png", width=480, height=480)
#The histogram is added to the file
hist(hpc$Global_active_power, col= "red", xlab= "Global active power (Kilowatts)", main="Global Active Power")
dev.off()