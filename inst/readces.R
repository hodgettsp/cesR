# Script to read the CES DTA datasets & create RData files.

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
data_file <- here::here("inst/extdata/dataverse_files_main.zip")

# unzip 'data_file' and place unzipped folder in 'instdir' file location.
unzip(data_file)

# assign directory within the unzipped folder.
instdir_main <- here::here("inst/extdata/dataverse_files_main")

# set working directory to unzipped folder.
setwd(instdir_main)

# creates a list of the files within the unzipped folder.
# the parentheses print the list in the console.
(files <- list.files(path = getwd(), pattern = "*.dta$"))

# for loop to create dataset objects
# for the length of the list of files,
# read the .dta file using the haven package into a temporary holder,
# use the sub function to find the pattern of .dta and replace with nothing in the file list,
# assign the temporary placeholder to variable 'name'
# remove placeholder
for(i in 1:length(files)){
  tmp <- haven::read_dta(file = files[i])
  name <- sub(".dta", "", files[i])
  assign(name, tmp)
  rm(tmp)
}

# set working directory to the export directory.
setwd(expodir)

# write RData files to 'data' folder.
save(onlinesurvey, file = "onlinesurvey.RData")
save(phonesurvey,  file = "phonesurvey.RData")

# compress Rdata files.
tools::checkRdaFiles(here::here("data"))
tools::resaveRdaFiles((here::here("data")), compress = "bzip2")


