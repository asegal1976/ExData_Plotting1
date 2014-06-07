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
png(file="plot4.png")
# Define 2 by 2 graph matrix
par (mfrow=c(2,2))

with(Feb_data,{

        #First plot
with(Feb_data,plot(DateTime,Global_active_power, type = "l", xlab="", ylab="Global active power"))        
        
  

        #Second plot
with(Feb_data,plot(DateTime,Voltage, type = "l", xlab="datetime", ylab="Voltage"))        

 
        #Third plot


# plot Sub_metering_1 as function of DateTime
with(Feb_data,plot(DateTime,Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))

# add plot Sub_metering_2 as function of DateTime
with(Feb_data,points(DateTime,Sub_metering_2,type = "l", col="red"))

# add plot Sub_metering_3 as function of DateTime
with(Feb_data,points(DateTime,Sub_metering_3,type = "l", col="blue"))

# add legend to the plot
legend("topright",lty = c(1, 1, 1), col=c("black" ,"red","blue"), box.lty=0,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

        #Fourth plot  
with(Feb_data,plot(DateTime,Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power"))    

})

dev.off()