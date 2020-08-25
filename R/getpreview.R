#' Create a preview dataframe object of a CES survey.
#'
#' @description
#' `get_preview()` creates a truncated dataframe for a requested Canadian Election Study
#' survey using an associated survey code to call and download
#' the survey dataset.
#'
#' @param srvy A CES survey code call. See *Survey Code Calls* below.
#' `srvy` value must be a character string.
#' @param x A numerical value that determines the number of observations returned.
#' If `x` is not given, then default value is 6 observations.
#' Variable must be given as a numerical value.
#'
#' @details
#'
#' ## Datasets
#' Datasets are loaded using either .dta or .sav file types
#' and converted to factor type using the `to_factor()` function
#' from the `labelled` package.
#'
#' ## Survey Code Calls
#' `get_preview()` uses the same survey code calls as the `get_ces()` function.
#' These survey code calls are listed below.
#'
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
#' Incorrect (a non-existent survey code) will stop the function process and return associated error messages.
#' Repeated code calls will load in an unaltered version of the requested table.
#'
#' ## Extra Notes
#' Due to the naming of the columns in the 1965 and 1968 datasets it is recommended
#' to download the associated codebook for the requested dataset.
#'
#' #' @examples
#' devtools::install_github("hodgettsp/cesR")
#'
#' library(cesR)
#'
#' get_preview("ces2019_phone", 10)



#library(haven)
#library(labelled)

#'@export
# function to call to create previews of the CES surveys
# code for the first section of the function is commented with how the function works,
# all following sections work in the same manner.
get_preview <- function(srvy, x = 6){
  # if 'srvy' is in 'ces_codese' vector
  if(srvy %in% ces_codes){
    # if 'srvy' is equal to 'ces2019_web'
    if(srvy == "ces2019_web"){
      # if the file does not exist
      if(!file.exists("inst/extdata/ces2019_web/ces2019_web.dta")){
        # assign download url
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2019-web.zip"
        # create temporary file name holder with extension .zip
        hldr <- tempfile(fileext = ".zip")
        # download the file from the url and assign temporary name
        download.file(cesfile, hldr, quiet = TRUE)
        # unzip the compressed folder to the given directory
        unzip(hldr, exdir = "inst/extdata/ces2019_web")
        # create a locally available variable
        survey_read <- haven::read_dta(hldr)
        # assign the data file to a globally available variable
        assign("ces2019_web_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        # remove the temporary file
        unlink(hldr, recursive = TRUE)
        # remove the download directory
        unlink("inst/extdata/ces2019_web", recursive = TRUE)
        # remove the local variable
        rm(survey_read)
      }
    }
    else if(srvy == "ces2019_phone"){
      if(!file.exists("inst/extdata/ces2019_phone/CES-E-2019-phone_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2019-phone.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2019_phone")
        survey_read <- haven::read_sav(hldr)
        assign("ces2019_phone_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2019_phone", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2015_web"){
      if(!file.exists("inst/extdata/ces2015_web/CES15_CPS+PES_Web_SSI Full.SAV")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES15_CPSPES_Web_SSI-Full-SPSS.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2015_web")
        survey_read <- haven::read_sav(hldr)
        assign("ces2015_web_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2015_web", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2015_phone"){
      if(!file.exists("inst/extdata/ces2015_phone/CES2015_CPS-PES-MBS_complete-v2.dta")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2015-phone-SPSS.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2015_phone")
        survey_read <- haven::read_dta(hldr)
        assign("ces2015_phone_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2015_phone", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2015_combo"){
      if(!file.exists("inst/extdata/ces2015_combo/CES2015_Combined_SPSS.SAV")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2015_Combined_SPSS.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2015_combo")
        survey_read <- haven::read_sav(hldr)
        assign("ces2015_combo_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2015_combo", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2011"){
      if(!file.exists("inst/extdata/ces2011/CPS&PES&MBS&WEB_2011_final.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2011-final-1.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2011")
        survey_read <- haven::read_sav(hldr)
        assign("ces2011_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2011", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2008"){
      if(!file.exists("inst/extdata/ces2008/CES-E-2008_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2008.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2008")
        survey_read <- haven::read_sav(hldr)
        assign("ces2008_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2008", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2004"){
      if(!file.exists("inst/extdata/ces2008/CES-E-2004_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2004.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2004")
        survey_read <- haven::read_sav(hldr)
        assign("ces2004_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2004", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces0411"){
      if(!file.exists("inst/extdata/ces0411/CES_04060811_final_without-geo-data.dta")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES_04060811_final_without-geo-data.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces0411")
        survey_read <- haven::read_dta(hldr)
        assign("ces0411_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces0411", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces0406"){
      if(!file.exists("inst/extdata/ces0406/CES-E-2004-2006_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2004-2006.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces0406")
        survey_read <- haven::read_sav(hldr)
        assign("ces0406_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces0406", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2000"){
      if(!file.exists("inst/extdata/ces2000/CES-E-2000_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2000.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces2000")
        survey_read <- haven::read_sav(hldr)
        assign("ces2000_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces2000", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1997"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1997_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1997.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1997")
        survey_read <- haven::read_sav(hldr)
        assign("ces1997_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1997", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1993"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1993_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1993.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1993")
        survey_read <- haven::read_sav(hldr)
        assign("ces1993_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1993", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1988"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1988_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1988.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1988")
        survey_read <- haven::read_sav(hldr)
        assign("ces1988_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1988", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1984"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1984_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1984.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1984")
        survey_read <- haven::read_sav(hldr)
        assign("ces1984_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1984", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1974"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1974_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1974.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1974")
        survey_read <- haven::read_sav(hldr)
        assign("ces1974_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1974", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces7480"){
      if(!file.exists("inst/extdata/ces2000/CES-E-1974-1980_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1974-1980.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces7480")
        survey_read <- haven::read_sav(hldr)
        assign("ces7480_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces7480", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces72_jnjl"){
      if(!file.exists("inst/extdata/ces72_jnjl/CES-E-1972-jun-july_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-jun-july.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces72_jnjl")
        survey_read <- haven::read_sav(hldr)
        assign("ces72_jnjl_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces72_jnjl", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces72_sep"){
      if(!file.exists("inst/extdata/ces72_sep/CES-E-1972-sept_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-sept.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces72_sep")
        survey_read <- haven::read_sav(hldr)
        assign("ces72_sep_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces72_sep", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces72_nov"){
      if(!file.exists("inst/extdata/ces72_nov/CES-E-1972-nov_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-nov.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces72_nov")
        survey_read <- haven::read_sav(hldr)
        assign("ces72_nov_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces72_nov", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1968"){
      if(!file.exists("inst/extdata/ces1968/CES-E-1968_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1968.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1968")
        survey_read <- haven::read_sav(hldr)
        assign("ces1968_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1968", recursive = TRUE)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1965"){
      if(!file.exists("inst/extdata/ces1965/CES-E-1965_F1.sav")){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1965.zip"
        hldr <- tempfile(fileext = ".zip")
        download.file(cesfile, hldr, quiet = TRUE)
        unzip(hldr, exdir = "inst/extdata/ces1965")
        survey_read <- haven::read_sav(hldr)
        assign("ces1965_preview", head(labelled::to_factor(survey_read), x), envir = .GlobalEnv)
        unlink(hldr, recursive = TRUE)
        unlink("inst/extdata/ces1965", recursive = TRUE)
        rm(survey_read)
      }
    }
  }
  else{
    # if the provided code is not in the 'ces_codes' vector then stop process and print this message
    stop("Warning: Code not in table.")
  }
}



### CES SURVEY CODE CALLS
ces_codes <- (c("ces2019_web", "ces2019_phone", "ces2015_web", "ces2015_phone", "ces2015_combo",
                "ces2011", "ces2008", "ces2004", "ces0411", "ces0406", "ces2000", "ces1997", "ces1993",
                "ces1988", "ces1984", "ces1974", "ces7480", "ces72_jnjl", "ces72_sep", "ces72_nov",
                "ces1968", "ces1965"))
