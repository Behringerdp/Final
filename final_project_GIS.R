#script for GIS_project
#NOAA station and shrimp data
BA_stations=subset(Louisiana_Stations, Louisiana_Stations$Station_Code >= 278 & Station_Code <=322)
BA_samples=subset(Louisiana_Samples, Louisiana_Samples$Station_Code >=278 & Station_Code <=322)
BA_samples_2007=subset(BA_samples, BA_samples$YYYY >=2007)

BA_ss = merge(BA_stations, BA_samples, 'Station_Code')
BA_sal_hydro = merge(BA_ss, Louisiana_Hydrological, 'Sample_Code')

BA_station_sal=subset(BA_sal_hydro, BA_sal_hydro$Station_Code >= 278 & Station_Code <=322)
BA_AUG_sal=subset(BA_sal_hydro, BA_sal_hydro$MM==8)


#Salinity data for all BA stations in August
write.table(BA_AUG_sal, "BA_AUG_sal.txt", sep="\t", row.names=FALSE)


LA_shrimp=subset(Louisiana_Trawls, Louisiana_Trawls$`Species Code`==2002)
shrimp_sample=merge(LA_shrimp, BA_samples, 'Sample_Code')
BA_shrimp=merge(shrimp_sample, BA_stations, 'Station_Code')
BA_shrimp_sept=subset(BA_shrimp, BA_shrimp$MM==9)

write.table(BA_shrimp_sept, "BA_shrimp_sept.txt", sep="\t", row.names=FALSE)

summary(BA_shrimp_sept)


#average of total number by station
#avg total number by station Code

avg_shrimp=aggregate(BA_shrimp_sept[,4], list(BA_shrimp_sept$Station_Code), mean)
write.csv(avg_shrimp, "avg_shrimp.csv", row.names=FALSE)



avg_sal=aggregate(Sept_sal[,9], list(Sept_sal$`Salinity (ppt)`), mean)

write.csv(avg_sal, "avg_sal.csv", row.names=FALSE)
avg_sal






#separate out day month and year into separate columns

library(tidyr)


d <- data.frame(date = c("2017-02-23", "2017-02-22"))
#separate(d, "date", c("Year", "Month", "Day"), sep = "-")

separate(CIMS_sal_93_07, 2, into = c("Year", "Month", "Day"), remove = TRUE, convert = FALSE, 
         extra = "warn", fill = "warn", sep = "-")


separate(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn", ...)

#separate(CIMS_sal_93_07, 2, into = c("Year", "Month", "Day"), )

#library(dplyr)
df %>%
  mutate(
    year = substr(date,  1, 4),
    month = substr(date,  6, 7),
    day = substr(date, 9, 10),
    time = substr(date, 12, 15))




#extract CIMS Sept salinity 





