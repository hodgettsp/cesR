# Script to read the CES dta dataset & create RData files.

#library(haven)
#library(here)
#library(tools)
#library(labelled)

# directory where for the .dta files
instdir <- here::here("inst/extdata")

# directory where the .RData files will be created.
expodir <- here::here("data")

# set working directory to 'instdir'.
setwd(instdir)

# assign zipped dataset file to 'data_file' variable.
data_file <- here::here("inst/extdata/CES_04060811_final_without-geo-data.zip")

# unzip 'data_file' and place unzipped folder in 'instdir' file location.
unzip(data_file, exdir = here::here("inst/extdata/ces04-11"))

# assign directory within the unzipped folder.
instdir_main <- here::here("inst/extdata/ces04-11")

# set working directory to unzipped folder.
setwd(instdir_main)

# creates a list of the files within the unzipped folder.
# the parentheses print the list in the console.
(files <- list.files(path = getwd(), pattern = "*.dta$"))

# for loop to create dataset objects
# for the length of the list of files,
# read the .dta file using the haven package into a more understandable name
for(i in 1:length(files)){
  ces0411 <- haven::read_dta(file = files[i])
}

# set working directory to the export directory.
setwd(expodir)

# write RData files to 'data' folder.
save(ces0411, file = "ces0411.RData")

# compress Rdata files.
tools::checkRdaFiles(here::here("data"))
tools::resaveRdaFiles((here::here("data")), compress = "gzip")
