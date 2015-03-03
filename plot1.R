df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                    colClasses = c("character", "character", rep("numeric", 7)))
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# set background to white
old.par <- par(no.readonly = TRUE)
par(bg="white")

# plot 1
hist(df1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

par(old.par)

# save to png
dev.copy(png, file = "plot1.png")
dev.off()
