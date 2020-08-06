# Script to read the CES SAV datasets & create RData files.

#library(haven)
#library(here)
#library(tools)
#library(labelled)

# directory where for the .dta files
instdir <- here::here("inst/extdata")

# directory where the .RData files will be created.
expodir <- here::here("data")

#### Script for 2008 web survey starts here ####

# set working directory to 'instdir'.
setwd(instdir)

# assign zipped dataset file to 'data_file' variable.
data_file <- here::here("inst/extdata/CES-E-2008.zip")

# unzip 'data_file' and place unzipped folder in 'instdir' file location.
unzip(data_file, exdir = here::here("inst/extdata/ces2008"))

# assign directory within the unzipped folder.
instdir_main <- here::here("inst/extdata/ces2008")

# set working directory to unzipped folder.
setwd(instdir_main)

# creates a list of the files within the unzipped folder.
# the parentheses print the list in the console.
(files <- list.files(path = getwd(), pattern = "*.sav$"))

# for loop to create dataset objects
# for the length of the list of files,
# read the .SAV file using the haven package into a more understandable name
for(i in 1:length(files)){
  ces2008 <- haven::read_sav(file = files[i])
}

# set working directory to the export directory.
setwd(expodir)

# write RData files to 'data' folder.
save(ces2008, file = "ces2008.RData")

# compress Rdata files.
tools::checkRdaFiles(here::here("data"))
tools::resaveRdaFiles((here::here("data")), compress = "gzip")
