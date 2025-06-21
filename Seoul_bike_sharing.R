library(car)

bike <- read.csv("SeoulBike_FinalDataset.csv")
View(bike)

# Prepare the data
bike$Date <- as.Date(bike$Date, format="%d/%m/%Y")
bike$Day_of_Week <- weekdays(bike$Date)

# Convert categorical variables
bike$Seasons <- as.factor(bike$Seasons)
bike$Holiday <- ifelse(bike$Holiday == "Holiday", 1, 0)




# Build the model using all potential independent variables
model_all <- lm(Rented_Bike_Count ~ 
                  Hour + Temperature + Humidity +
                  Wind_speed + Visibility +
                  Dew_point_temperature + Solar_Radiation +
                  Rainfall + Snowfall +
                  Holiday + Seasons + Day_of_Week,
                data = bike)
summary(model_all)

# Calculate VIF values
vif(model_all)

# Build new model using only the final selected independent variables
model_final <- lm(Rented_Bike_Count ~ 
                    Hour + Temperature + Rainfall +
                    Holiday + Seasons + Day_of_Week,
                  data = bike)

# Check VIF for the final model
library(car)
vif(model_final)


# Select only the needed columns
bike_final <- bike[, c("Rented_Bike_Count", "Hour", "Temperature", 
                       "Rainfall", "Holiday", "Seasons", "Day_of_Week")]

# Save it as a new CSV
write.csv(bike_final, "SeoulBike_FinalDataset.csv", row.names = FALSE)







bike_rentals <- read.csv("SeoulBike_FinalDataset.csv")
View(bike_rentals)
summary(bike_rentals)


# Histogram for Rented Bike Count
hist(bike_rentals$Rented_Bike_Count, main = "Histogram of Rented Bike Count", xlab = "Bike Count", col = "skyblue", breaks = 30)

# Histogram for Hour
hist(bike_rentals$Hour, main = "Histogram of Hour", xlab = "Hour of Day", col = "lightgreen", breaks = 24)

# Histogram for Temperature
hist(bike_rentals$Temperature, main = "Histogram of Temperature", xlab = "Temperature (°C)", col = "pink", breaks = 30)

# Histogram for Rainfall
hist(bike_rentals$Rainfall, main = "Histogram of Rainfall", xlab = "Rainfall (mm)", col = "lightyellow", breaks = 30)

# Histogram for Holiday
hist(bike_rentals$Holiday, main = "Histogram of Holiday", xlab = "Holiday (0=No, 1=Yes)", col = "orange", breaks = 2)

# Histogram for Seasons
plot(table(bike_rentals$Seasons), main = "Histogram of Seasons", xlab = "Season", col = "lightblue")

# Histogram for Day of Week
plot(table(bike_rentals$Day_of_Week), main = "Histogram of Day of Week", xlab = "Day", col = "lightcoral")



barplot(table(bike_rentals$Holiday), 
        main = "Barplot of Holiday",
        names.arg = c("No Holiday", "Holiday"),
        col = "orange",
        ylab = "Frequency")

# Bar chart for Day of the Week
barplot(table(bike_rentals$Day_of_Week),
        main = "Barplot of Day of Week",
        xlab = "Day",
        ylab = "Frequency",
        col = "lightcoral",
        names.arg = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

# Bar chart for Seasons
barplot(table(bike_final$Seasons),
        main = "Barplot of Seasons",
        xlab = "Season",
        ylab = "Frequency",
        col = "lightblue",
        names.arg = c("Autumn", "Spring", "Summer", "Winter"))





# Boxplot for Rented Bike Count
boxplot(bike_rentals$Rented_Bike_Count, main = "Boxplot of Rented Bike Count", ylab = "Bike Count", col = "lightblue")

# Boxplot for Temperature
boxplot(bike_rentals$Temperature, main = "Boxplot of Temperature", ylab = "Temperature (°C)", col = "lightgreen")

# Boxplot for Rainfall
boxplot(bike_rentals$Rainfall, main = "Boxplot of Rainfall", ylab = "Rainfall (mm)", col = "pink")


# For Hour
plot(bike_rentals$Hour, bike_rentals$Rented_Bike_Count, 
     main = "Scatterplot of Bike Count vs Hour", 
     xlab = "Hour", ylab = "Rented Bike Count", 
     pch = 19, col = "blue")
abline(lm(Rented_Bike_Count ~ Hour, data = bike_rentals), col = "red", lwd = 2)

# For Temperature
plot(bike_rentals$Temperature, bike_rentals$Rented_Bike_Count, 
     main = "Scatterplot of Bike Count vs Temperature", 
     xlab = "Temperature (°C)", ylab = "Rented Bike Count", 
     pch = 19, col = "blue")
abline(lm(Rented_Bike_Count ~ Temperature, data = bike_rentals), col = "red", lwd = 2)

# For Rainfall
plot(bike_rentals$Rainfall, bike_rentals$Rented_Bike_Count, 
     main = "Scatterplot of Bike Count vs Rainfall", 
     xlab = "Rainfall (mm)", ylab = "Rented Bike Count", 
     pch = 19, col = "blue")
abline(lm(Rented_Bike_Count ~ Rainfall, data = bike_rentals), col = "red", lwd = 2)

# (No scatterplot for categorical variables like Holiday, Season, Day of Week — these are better analyzed with boxplots, not scatterplots.)






library(ggplot2)

ggplot(bike, aes(x = Rented_Bike_Count)) +
  geom_histogram(binwidth = 100, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Rented Bike Count", x = "Bike Count", y = "Frequency") +
  theme_minimal()




library(ggplot2)

ggplot(bike, aes(y = Rented_Bike_Count)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Boxplot of Rented Bike Count", y = "Bike Count") +
  theme_minimal()




























