library(dplyr)
df<-read.csv2("C:\\Users\\TSM\\Downloads\\household_power_consumption//household_power_consumption.txt")
df$Date <- as.character(df$Date)
df$Date2 <- as.Date(df$Date,format="%d/%m/%Y")
df2 <-df[between(df$Date2,as.Date("2007-02-01"),as.Date("2007-02-02")),]

df2$Global_active_power <- as.numeric(df2$Global_active_power)/1000

#Create plot 1
png('C:\\Users\\TSM\\Desktop\\Coursera\\JH\\4\\Week1\\plot1.png',width=480,height=480)
hist(df2$Global_active_power,breaks=c(0,.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6),
     col="red", main="Global Active Power",ylim=c(0,1200)
     ,xaxt="n",xlab="Global Active Power (kilowatts)")
axis(side=1,at=seq(0,6,2),labels=seq(0,6,2))
dev.off()

#Create proper date time
df2$Time2 <- as.POSIXct(paste(df2$Date,df2$Time),format="%d/%m/%Y %H:%M:%S")

#Make plot 2
png('C:\\Users\\TSM\\Desktop\\Coursera\\JH\\4\\Week1\\plot2.png',width=480,height=480)
plot(x=df2$Time2,y=df2$Global_active_power,type="l",xlab=""
     ,ylab="Global Active Power (kilowats)")
dev.off()

#Make plot 3
png('C:\\Users\\TSM\\Desktop\\Coursera\\JH\\4\\Week1\\plot3.png',width=480,height=480)
matplot(x=df2$Time2,y=df2[,grep("Sub",colnames(df2))]
        ,type=c("l"),pch=1,col=1:3,ylab="",xaxt="n")
axis(1,at=c(min(df2$Time2),mean(df2$Time2),max(df2$Time2)),labels=c("Thu","Fri","Sat"))
legend("topright",legend=colnames(df2)[grep("Sub",colnames(df2))],col=1:3)
dev.off()

#Make plot 4
png('C:\\Users\\TSM\\Desktop\\Coursera\\JH\\4\\Week1\\plot4.png',width=480,height=480)

par(mfrow=c(2,2))

plot(x=df2$Time2,y=df2$Global_active_power,type="l",xlab=""
     ,ylab="Global Active Power (kilowats)")

plot(x=df2$Time2,y=df2$Voltage,type="l"
     ,ylab="Voltage",xlab="datetime")

matplot(x=df2$Time2,y=df2[,grep("Sub",colnames(df2))]
        ,type=c("l"),pch=1,col=1:3,ylab="",xaxt="n")
axis(1,at=c(min(df2$Time2),mean(df2$Time2),max(df2$Time2)),labels=c("Thu","Fri","Sat"))
legend("topright",legend=colnames(df2)[grep("Sub",colnames(df2))],col=1:3)

plot(x=df2$Time2,y=df2$Global_active_power,type="l"
     ,ylab="Voltage",xlab="datetime")

dev.off()

