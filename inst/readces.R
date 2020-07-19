# Script to read the CES DTA datasets & create RData files.
#library(haven)
#library(here)
#library(tools)

# directory where the .dta files will be created.
indir <- here::here("inst/extdata")

# directory where the .RData files will be created.
outdir <- here::here("data")

# set working directory to 'indir'.
setwd(indir)

# assign zipped dataset file to 'data_file' variable.
data_file <- here::here("inst/extdata/dataverse_files_main.zip")

# unzip 'data_file' and place unzipped folder in 'indir' file location.
unzip(data_file)

# assign directory within the unzipped folder.
indir_main <- here::here("inst/extdata/dataverse_files_main")

# set working directory to unzipped folder.
setwd(indir_main)

# creates a list of the files within the unzipped folder.
(files <- list.files(path = getwd(), pattern = "*.dta$"))

# for the length of the file name read out as a dataset.
for(i in 1:length(files)){
  inp <- haven::read_dta(file = files[i])
  cat("Read:", files[i], "\trows: ", nrow(inp), " cols: ", ncol(inp), "\n")
  cname <- name <- sub(".dta", "", files[i])
  assign(name, inp)
  rm(inp)
}

# set working directory to the out directory.
setwd(outdir)

# write RData files to 'data' folder.
save(onlinesurvey, file = "onlinesurvey.RData")
save(phonesurvey,  file = "phonesurvey.RData")

#compress Rdata files.
tools::checkRdaFiles(here::here("data"))
tools::resaveRdaFiles((here::here("data")), compress = "bzip2")
