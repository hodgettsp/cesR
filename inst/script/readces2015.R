# Script to read the CES SAV and CSV datasets & create RData files.

#library(haven)
#library(here)
#library(tools)
#library(labelled)

# directory where for the .dta files
instdir <- here::here("inst/extdata")

# directory where the .RData files will be created.
expodir <- here::here("data")

#### Script for 2015 web survey starts here ####

# set working directory to 'instdir'.
setwd(instdir)

# assign zipped dataset file to 'data_file' variable.
data_file <- here::here("inst/extdata/CES15_CPSPES_Web_SSI-Full-SPSS.zip")

# unzip 'data_file' and place unzipped folder in 'instdir' file location.
unzip(data_file, exdir = here::here("inst/extdata/ces2015web"))

# assign directory within the unzipped folder.
instdir_main <- here::here("inst/extdata/ces2015web")

# set working directory to unzipped folder.
setwd(instdir_main)

# creates a list of the files within the unzipped folder.
# the parentheses print the list in the console.
(files <- list.files(path = getwd(), pattern = "*.SAV$"))

# for loop to create dataset objects
# for the length of the list of files,
# read the .SAV file using the haven package into a more understandable name
for(i in 1:length(files)){
  ces2015_web <- haven::read_sav(file = files[i])
}

# set working directory to the export directory.
setwd(expodir)

# write RData files to 'data' folder.
save(ces2015_web, file = "ces2015_web.RData")





#### Script for phone survey is below ####

# set working directory to 'instdir'.
setwd(instdir)

# assign zipped dataset file to 'data_file' variable.
data_file <- here::here("inst/extdata/CES2015-phone-SPSS.zip")

# unzip 'data_file' and place unzipped folder in 'instdir' file location.
unzip(data_file, exdir = here::here("inst/extdata/ces2015phone"))

# assign directory within the unzipped folder.
instdir_main <- here::here("inst/extdata/ces2015phone")

# set working directory to unzipped folder.
setwd(instdir_main)

# creates a list of the files within the unzipped folder.
# the parentheses print the list in the console.
(files <- list.files(path = getwd(), pattern = "*.sav$"))

# for loop to create dataset objects
# for the length of the list of files,
# read the .SAV file using the haven package into a more understandable name
for(i in 1:length(files)){
  ces2015_phone <- haven::read_sav(file = files[i])
}

# set working directory to the export directory.
setwd(expodir)

# write RData files to 'data' folder.
save(ces2015_phone, file = "ces2015_phone.RData")





#### Script for combined survey is below ####

# set working directory to 'instdir'.
setwd(instdir)

# assign zipped dataset file to 'data_file' variable.
data_file <- here::here("inst/extdata/CES2015_Combined_SPSS.zip")

# unzip 'data_file' and place unzipped folder in 'instdir' file location.
unzip(data_file, exdir = here::here("inst/extdata/ces2015combined"))

# assign directory within the unzipped folder.
instdir_main <- here::here("inst/extdata/ces2015combined")

# set working directory to unzipped folder.
setwd(instdir_main)

# creates a list of the files within the unzipped folder.
# the parentheses print the list in the console.
(files <- list.files(path = getwd(), pattern = "*.SAV$"))

# for loop to create dataset objects
# for the length of the list of files,
# read the .csv file using the haven package into a more understandable name
for(i in 1:length(files)){
  ces2015_combo <- haven::read_sav(file = files[i])
}

# set working directory to the export directory.
setwd(expodir)

# write RData files to 'data' folder.
save(ces2015_combo, file = "ces2015_combo.RData")



# compress Rdata files.
tools::checkRdaFiles(here::here("data"))
tools::resaveRdaFiles((here::here("data")), compress = "gzip")
