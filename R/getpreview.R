#' Create a preview dataframe object of a CES survey.
#'
#' @description
#' `get_preview()` creates a truncated dataframe for a requested Canadian Election Study
#' survey using an associated code to call and download
#' the survey dataset.
#'
#' @param srvy A CES survey code call. See *Survey Code Calls* below.
#' `srvy` value must be a character string.
#' @param obs A numerical value that determines the number of observations returned.
#' If a value for `obs` is not given, then default value is 6 observations.
#' Variable must be given as a numerical value.
#' @param pos Environment assignment. Defaults to 1, which is an assignment to the global environment.
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
#'
#' get_preview("ces2019_phone", 10)



#library(haven)
#library(labelled)

#'@export
# function to call to create previews of the CES surveys
# code for the first section of the function is commented with how the function works,
# all following sections work in the same manner.
get_preview <- function(srvy, obs = 6, pos = 1){
  # if 'srvy' is in 'ces_codese' vector
  if(srvy %in% ces_codes){
    # if 'srvy' is equal to 'ces2019_web'
    if(srvy == "ces2019_web"){
      # if the file does not exist
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2019_web.dta"))){
        # assign download url
        cesfile <- "https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/DUS88V/RZFNOV"
        # create temporary file name holder
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2019_web.dta")
        # download the file from the url and assign file name from holder
        utils::download.file(cesfile, hldr, quiet = F, mode = "wb")
        # create a locally available variable
        survey_read <- haven::read_dta(hldr, encoding = "latin1")
        # assign the data file to a globally available variable
        assign("ces2019_web_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        # print the preview dataset
        print(utils::head(ces2019_web_preview, obs))
        # remove the temporary file
        unlink(hldr, recursive = T)
        # remove the local variable
        rm(survey_read)
      }
    }
    else if(srvy == "ces2019_phone"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2019_phone.tab"))){
        cesfile <- "https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/8RHLG1/DW4GZZ"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2019_phone.tab")
        utils::download.file(cesfile, hldr, quiet = F, mode = "wb")
        survey_read <- readr::read_tsv(hldr, show_col_types = F)
        assign("ces2019_phone_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2019_phone_preview, obs))
        unlink(hldr, recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2015_web"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2015_web.zip"))){
        cesfile <- "https://ces-eec.sites.olt.ubc.ca/files/2018/07/CES15_CPSPES_Web_SSI-Full-Stata-14.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2015_web.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        survey_read <- haven::read_dta(hldr)
        assign("ces2015_web_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2015_web_preview, obs))
        unlink(hldr, recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2015_phone"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2015_phone.zip"))){
        cesfile <- "https://ces-eec.sites.olt.ubc.ca/files/2018/08/CES2015-phone-Stata.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2015_phone.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces2015_phone"))
        datafile <- file.path(system.file("extdata/ces2015_phone", package = "cesR"), "CES2015_CPS-PES-MBS_complete-v2.dta")
        survey_read <- haven::read_dta(datafile, encoding = "latin1")
        assign("ces2015_phone_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2015_phone_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces2015_phone", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2015_combo"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2015_combo.zip"))){
        cesfile <- "https://ces-eec.sites.olt.ubc.ca/files/2017/04/CES2015_Combined_Stata14.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2015_combo.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        survey_read <- haven::read_dta(hldr)
        assign("ces2015_combo_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2015_combo_preview, obs))
        unlink(hldr, recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2011"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2011.zip"))){
        cesfile <- "https://ces-eec.sites.olt.ubc.ca/files/2014/07/CES2011-final-1.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2011.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces2011"))
        datafile <- file.path(system.file("extdata/ces2011", package = "cesR"), "CPS&PES&MBS&WEB_2011_final.dta")
        survey_read <- haven::read_dta(datafile)
        assign("ces2011_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2011_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces2011", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2008"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2008.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2008.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "cse2008.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces2008"))
        survey_read <- haven::read_sav(hldr)
        assign("ces2008_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2008_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces2008", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2004"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2004.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2004.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2004.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces2004"))
        survey_read <- haven::read_sav(hldr)
        assign("ces2004_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2004_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces2004", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces0411"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces0411.zip"))){
        cesfile <- "https://ces-eec.sites.olt.ubc.ca/files/2014/07/CES_04060811_final_without-geo-data.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces0411.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        survey_read <- haven::read_dta(hldr, encoding = "latin1")
        assign("ces0411_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces0411_preview, obs))
        unlink(hldr, recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces0406"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces0406.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2004-2006.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces0406.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces0406"))
        survey_read <- haven::read_sav(hldr)
        assign("ces0406_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces0406_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces0406", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces2000"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces2000.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-2000.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces2000.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces2000"))
        survey_read <- haven::read_sav(hldr)
        assign("ces2000_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces2000_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces2000", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1997"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1997.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1997.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1997.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1997"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1997_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1997_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1997", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1993"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1993.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1993.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1993.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1993"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1993_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1993_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1993", pacakge = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1988"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1988.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1988.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1988.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1988"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1988_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1988_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1988", pacakge = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1984"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1984.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1984.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1984.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1984"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1984_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1984_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1984", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1974"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1974.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1974.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1974.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1974"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1974_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1974_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1974", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces7480"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces7480.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1974-1980.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces7480.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces7480"))
        survey_read <- haven::read_sav(hldr)
        assign("ces7480_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces7480_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces7480", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces72_jnjl"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces72_jnjl.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-jun-july.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces72_jnjl.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces72_jnjl"))
        survey_read <- haven::read_sav(hldr)
        assign("ces72_jnjl_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces72_jnjl_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces72_jnjl", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces72_sep"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces72_sep.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-sept.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces72_sep.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces72_sep"))
        survey_read <- haven::read_sav(hldr)
        assign("ces72_sep_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces72_sep_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces72_sep", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces72_nov"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces72_nov.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1972-nov.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces72_nov.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces72_nov"))
        survey_read <- haven::read_sav(hldr)
        assign("ces72_nov_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces72_nov_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces72_nov", package= "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1968"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1968.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1968.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1968.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1968"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1968_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1968_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1968", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
    else if(srvy == "ces1965"){
      if(!file.exists(file.path(system.file("extdata", package = "cesR"), "ces1965.zip"))){
        cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES-E-1965.zip"
        hldr <- file.path(system.file("extdata", package = "cesR"), "ces1965.zip")
        utils::download.file(cesfile, hldr, quiet = F)
        utils::unzip(hldr, exdir = file.path(system.file("extdata", package = "cesR"), "ces1965"))
        survey_read <- haven::read_sav(hldr)
        assign("ces1965_preview", utils::head(labelled::to_factor(survey_read), obs), envir = as.environment(pos))
        print(utils::head(ces1965_preview, obs))
        unlink(hldr, recursive = T)
        unlink(file.path(system.file("extdata/ces1965", package = "cesR")), recursive = T)
        rm(survey_read)
      }
    }
  }
  else{
    # if the provided code is not in the 'ces_codes' vector then stop process and print this message
    stop("Incorrect CES dataset code provided. Use function get_cescodes() for a printout of useable code calls")
  }
}



### CES SURVEY CODE CALLS
ces_codes <- (c("ces2019_web", "ces2019_phone", "ces2015_web", "ces2015_phone", "ces2015_combo",
                "ces2011", "ces2008", "ces2004", "ces0411", "ces0406", "ces2000", "ces1997", "ces1993",
                "ces1988", "ces1984", "ces1974", "ces7480", "ces72_jnjl", "ces72_sep", "ces72_nov",
                "ces1968", "ces1965"))
