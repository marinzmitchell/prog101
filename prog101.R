##########################################################################
## Driver: (Marin Mitchell) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (2025-01-14)                                                   ##
##########################################################################

library(marinecs100b)

# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
# Kenai Fjords National Park

# How was temperature monitored?
#using HOBO V2 temperature loggers at each rocky sites

#What's the difference between absolute temperature and temperature anomaly?
#absolute temperature is the exact temperature measured at a specific time
#temperature anomaly is the difference between the average temperatrture and a
#temperature measured at as specific time

#Ansolute = measurment as recorded by the sensor
#Anomaly = difference from a long-term mean
# Begin exploring ---------------------------------------------------------

library(marinecs100b)

# How many kefj_* vectors are there?
?kefj
#6
# How long are they?
#1295038

# What do they represent?
Temperature readings from five sites in Kenai Fjords 2007-2024.
#temperature, names of site, datetime of reading, tide level,
# air/water/temperature

# Link to sketch


aialik_datetime <- kefj_datetime[kefj_site == "Aialik"]
aialik_interval <- aialik_datetime[2:length(aialik_datetime)] - aialik_datetime[1
  :length(aialik_datetime) - 1)]
table(aialik_interval)


# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?

which.max(kefj_temperature)
kefj_temperature[158962]
max_temp <- site[kefj_temperature == max(kefj_temperature)]
max_temp
hottest_idx
kefj_site[158962]
36.092 "Aialik"

# Link to sketch

# Plot the hottest day

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59", tz = "Etc/GMT+8")
hotday_idx <- which(kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end)
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# Repeat for the coldest day

coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct("2013-01-27 00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2013-01-27 23:59", tz = "Etc/GMT+8")
coldday_idx <- which(kefj_site == coldest_site &
                      kefj_datetime >= coldday_start &
                      kefj_datetime <= coldday_end)
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?

# How did Traiger et al. define extreme temperature exposure?

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.

# Compare your answer to the visualization you made. Does it look right to you?

# Repeat this process for extreme cold exposure on the coldest day.


# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
