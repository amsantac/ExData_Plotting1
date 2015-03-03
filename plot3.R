df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                    colClasses = c("character", "character", rep("numeric", 7)))
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# set background to white
old.par <- par(no.readonly = TRUE)
par(bg="white")

# plot 3
df1$DateTime <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
with(df1, plot(DateTime, Sub_metering_1, type = "l", ylab="Energy sub metering"))
with(df1, lines(DateTime, Sub_metering_2, col="red"))
with(df1, lines(DateTime, Sub_metering_3, col="blue"))
legend('topright', col = c("black", "red", "blue"), lty = c(1, 1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(old.par)

# save to png
dev.copy(png, file = "plot3.png")
dev.off()
