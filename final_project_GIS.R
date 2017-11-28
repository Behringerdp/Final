#script for GIS_project
#NOAA station and shrimp data
BA_stations=subset(Louisiana_Stations, Louisiana_Stations$Station_Code >= 278 & Station_Code <=322)
BA_samples=subset(Louisiana_Samples, Louisiana_Samples$Station_Code >=278 & Station_Code <=322)
BA_samples_2007=subset(BA_samples, BA_samples$YYYY >=2007)

BA_ss = merge(BA_stations, BA_samples, 'Station_Code')
BA_sal_hydro = merge(BA_ss, Louisiana_Hydrological, 'Sample_Code')

BA_station_sal=subset(BA_sal_hydro, BA_sal_hydro$Station_Code >= 278 & Station_Code <=322)
BA_AUG_sal=subset(BA_sal_hydro, BA_sal_hydro$MM==8)