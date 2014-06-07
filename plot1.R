# read the data from the file, the required data are within first 100000 rows
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?",nrows=100000)


# subset the data from the required dates
Feb_data<-data[which( data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# remove the rawnames
rownames(Feb_data) <- NULL




#open the graphic device
png(file="plot1.png")

#plot the histogram, with required color and labels
hist(Feb_data$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()