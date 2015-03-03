df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                    colClasses = c("character", "character", rep("numeric", 7)))
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# set background to white
old.par <- par(no.readonly = TRUE)
par(bg="white")

# plot 2
df1$DateTime <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
with(df1, plot(DateTime, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)"))

par(old.par)

# save to png
dev.copy(png, file = "plot2.png")
dev.off()
