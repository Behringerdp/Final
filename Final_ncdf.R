#use data from netCDF for bathymetry of Barataria Bay. 

install.packages("chron")
install.packages("RcolorBrewer")
install.packages("lattice")
install.packages("ncdf")
install.packages("installr")
install.packages("ncdf4")

library(ncdf4)

f <- list.files(pattern=".nc",full.names=F)


ncname <- "etopo1"
ncfname <- paste(ncname, ".nc", sep = "")
dname <- "CHL"  # note: tmp means temperature (not temporary)



# open a NetCDF file
ncin <- nc_open(ncfname)
print(ncin)
