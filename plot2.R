# read the data from the file, the required data are within first 100000 rows
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?",nrows=100000)


# subset the data from the required dates
Feb_data<-data[which( data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# remove the rawnames
rownames(Feb_data) <- NULL

#convert to Date type
Feb_data$Date<-as.Date((Feb_data$Date), "%d/%m/%Y")

#convert to Character
Feb_data$Time<-as.character(Feb_data$Time)

#concatenate Date and Time to DateTime column
Feb_data$DateTime<-paste(Feb_data$Date,Feb_data$Time)

#Convert to POSIXct Date and Time class
Feb_data$DateTime <- as.POSIXct(Feb_data$DateTime)


#open the graphic device
png(file="plot2.png")

#plot 
with(Feb_data,plot(DateTime,Global_active_power, type = "l", xlab="", ylab="Global active power (kilowatts)"))
dev.off()
