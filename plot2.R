download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","raw_data.zip")
unzip("raw_data.zip")
energyConsumption <- read.csv(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), na.strings="?", sep = ";")
str(energyConsumption)
language <- "English" 
Sys.setlocale("LC_TIME", language) 
plot2 <- png("plot2.png",width=480,height=480)
energyConsumption$DateTime <- strptime(paste(energyConsumption$ X1.2.2007, energyConsumption$X00.00.00), format="%d/%m/%Y %H:%M:%S")
plot(energyConsumption$DateTime, energyConsumption$X0.326, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()