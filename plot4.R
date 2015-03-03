df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                    colClasses = c("character", "character", rep("numeric", 7)))
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

df1$DateTime <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")

# plot 4
old.par <- par(no.readonly = TRUE)
par(mfcol = c(2, 2))
par(bg="white")

# box 1
with(df1, plot(DateTime, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)"))

# box 2
with(df1, plot(DateTime, Sub_metering_1, type = "l", ylab="Energy sub metering"))
with(df1, lines(DateTime, Sub_metering_2, col="red"))
with(df1, lines(DateTime, Sub_metering_3, col="blue"))
legend('topright', col = c("black", "red", "blue"), lty = c(1, 1, 1), bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# box 3
with(df1, plot(DateTime, Voltage, type = "l"))

# box 4
with(df1, plot(DateTime, Global_reactive_power, type = "l"))

par(old.par)

# save to png
dev.copy(png, file = "plot4.png")
dev.off()
