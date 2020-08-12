#' Create a dataframe object from CES survey.
#'
#' @description
#' get_ces() creates a dataframe for a requested Canadian Election Study
#' survey using an associated survey code to call and download
#' the survey dataset. Prints out the associated citation for use with
#' the requested dataset.
#'
#' @param srvy A CES survey code call. See *Survey Code Calls* below.
#' `srvy` value must be in quotations.
#'
#' @details
#'
#' ## Datasets
#' Datasets are loaded using either .dta or .sav file types.
#' To quickly convert a datasets values to factor type use
#' `labelled::to_factor()` on the dataset.
#'
#' ## Survey Code Calls
#' * `ces2019_web` calls 2019 CES online survey dataset.
#' * `ces2019_phone` calls 2019 CES phone survey dataset.
#' * `ces2015_web` calls 2015 CES online survey dataset.
#' * `ces2015_phone` calls 2015 CES phone survey dataset.
#' * `ces2015_combo` calls 2015 CES combined (online/phone) dataset.
#' * `ces2011` calls 2011 CES survey dataset.
#' * `ces2008` calls 2008 CES survey dataset.
#' * `ces2004` calls 2004 CES survey dataset.
#' * `ces0411` calls 2004-2011 CES survey dataset.
#' * `ces0406` calls 2004-2006 CES survey dataset.
#' * `ces2000` calls 2000 CES survey dataset.
#' * `ces1997` calls 1997 CES survey dataset.
#' * `ces1993` calls 1993 CES survey dataset.
#' * `ces1988` calls 1988 CES survey dataset.
#' * `ces1984` calls 1984 CES survey dataset.
#' * `ces1974` calls 1974 CES survey dataset.
#' * `ces7480` calls 1974-1980 CES survey dataset.
#' * `ces72_jnjl` calls 1972 June-July CES survey dataset.
#' * `ces72_sep` calls 1972 September CES survey dataset.
#' * `ces72_nov` calls 1972 November CES survey dataset.
#' * `ces1968` calls 1968 CES survey dataset.
#' * `ces1965` calls 1965 CES survey dataset.
#'
#' ## Incorrect/Repeated Code Calls
#' Incorrect (a non-existent survey code) or repeated (calling a code twice)
#' code calls will stop the function process and return associated error messages.
#'
#' ## Extra Notes
#' Due to the naming of the columns in the 1965 and 1968 datasets it is recommended
#' to download the associated codebook for the requested dataset.
#'
#' @examples
#' get_ces("ces2019_phone")
#'
#' MESSAGE: TO CITE THIS SURVEY FILE: Stephenson, Laura B; Harell, Allison; Rubenson, Daniel;
#' Loewen, Peter John, 2020, '2019 Canadian Election Study - Phone Survey',
#' https://doi.org/10.7910/DVN/8RHLG1, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF]
#'
#' get_ces("ces2019_phone")
#'
#' Error in get_ces("ces2019_phone") : Warning: File already exists.
#'
#' get_ces("ces2005")
#'
#' Error in get_ces("ces2005") : Warning: Code not in table.

#-----------------------------------------------------------------------

# function to call in CES survey from github repository

# 'get_ces' function, uses one variable 'srvy'
# code for function is commented here; all following else if statements work functionally the same as this if statement
get_ces <- function(srvy){
  # if 'srvy' is in 'ces_codese' vector
  if(srvy %in% ces_codes){
    # if 'srvy' is equal to 'ces2019_web'
    if(srvy == "ces2019_web"){
      # if file does not exist in given directory
      if(!file.exists("inst/extdata/ces2019_web/ces2019_web.dta")){
        # assign url to 'cesfile'
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2019-web.zip"
        # assign temporary file with .zip extension to placeholder variable
        hldr <- tempfile(fileext = ".zip")
        # download the file from url assigned to 'cesfile' with file extension from the temporary placeholder
        download.file(cesfile, hldr, quiet = TRUE)
        # unzip the placeholder file to given directory
        unzip(hldr, exdir = "inst/extdata/ces2019_web")
        # assign data file to data object
        ces2019_web <<- haven::read_dta(hldr)
        # unlink the temporary placeholder
        unlink(hldr, recursive = TRUE)
        # print out a concatenation of the survey citation
        cat(ref2019web)
      }
      else{
        # if the file does exist stop process and print this message
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2019_phone"){
      if(!file.exists("inst/extdata/ces2019_phone/ces2019_phone.dta")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2019-phone.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2019_phone")
        ces2019_phone <<- haven::read_dta(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2019phone)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2015_web"){
      if(!file.exists("inst/extdata/ces2015_web/CES15_CPS+PES_Web_SSI Full.SAV")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES15_CPSPES_Web_SSI-Full-SPSS.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2015_web")
        ces2015_web <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2015web)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2015_phone"){
      if(!file.exists("inst/extdata/ces2015_phone/CES2015_CPS-PES-MBS_complete-v2.dta")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2015-phone-SPSS.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2015_phone")
        ces2015_phone <<- haven::read_dta(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2015phone)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2015_combo"){
      if(!file.exists("inst/extdata/ces2015_combined/CES2015_Combined_SPSS.SAV")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2015_Combined_SPSS.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2015_combined")
        ces2015_combo <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2015combo)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2011"){
      if(!file.exists("inst/extdata/ces2011/CPS&PES&MBS&WEB_2011_final.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2011-final-1.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2011")
        ces2011 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2011)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2008"){
      if(!file.exists("inst/extdata/ces2008/CES-E-2008_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2008.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2008")
        ces2008 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2008)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2004"){
      if(!file.exists("inst/extdata/ces2008/CES-E-2004_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2004.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2004")
        ces2004 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2004)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces0411"){
      if(!file.exists("inst/extdata/ces0411/CES_04060811_final_without-geo-data.dta")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES_04060811_final_without-geo-data.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces0411")
        ces0411 <<- haven::read_dta(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref0411)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces0406"){
      if(!file.exists("inst/extdata/ces0406/CES-E-2004-2006_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2004-2006.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces0406")
        ces0406 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref0406)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces2000"){
      if(!file.exists("inst/extdata/ces2000/CES-E-2000_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2000.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2000")
        ces2000 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref2000)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1997"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1997_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1997.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1997")
        ces1997 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1997)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1993"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1993_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1993.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1993")
        ces1993 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1993)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1988"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1988_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1988.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1988")
        ces1988 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1988)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1984"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1984_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1984.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1984")
        ces1984 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1984)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1974"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1974_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1974.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1974")
        ces1974 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1974)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces7480"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1974-1980_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1974-1980.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces7480")
        ces7480 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref7480)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces72_jnjl"){
      if(!file.exists("inst/extdata/ces72_jnjl/CES-E-1972-jun-july_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-jun-july.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces72_jnjl")
        ces72_jnjl <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref72jnjl)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces72_sep"){
      if(!file.exists("inst/extdata/ces72_sep/CES-E-1972-sept_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-sept.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces72_sep")
        ces72_sep <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref72sep)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces72_nov"){
      if(!file.exists("inst/extdata/ces72_nov/CES-E-1972-nov_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-nov.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces72_nov")
        ces72_nov <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref72nov)
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1968"){
      if(!file.exists("inst/extdata/ces1968/CES-E-1968_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1968.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1968")
        ces1968 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1968)
        cat("\n\nMESSAGE: It is recommended to download the codebook for this dataset to better understand the column names.")
      }
      else{
        stop("Warning: File already exists.")
      }
    }
    else if(srvy == "ces1965"){
      if(!file.exists("inst/extdata/ces1968/CES-E-1965_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1965.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1965")
        ces1965 <<- haven::read_sav(hldr)
        unlink(hldr, recursive = TRUE)
        cat(ref1965)
        cat("\n\nMESSAGE: It is recommended to download the codebook for this dataset to better understand the column names.")
      }
      else{
        stop("Warning: File already exists.")
      }
    }
  }
  else{
    # if the provided code is not in the 'ces_codes' vector then stop process and print this message
    stop("Warning: Code not in table.")
  }
}
