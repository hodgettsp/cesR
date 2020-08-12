# function to call in CES survey from github repository

# citations for print calls
ref2019web <- "MESSAGE: TO CITE THIS SURVEY FILE: Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, '2019 Canadian Election Study - Online Survey', https://doi.org/10.7910/DVN/DUS88V, Harvard Dataverse, V1"
ref2019phone <- "MESSAGE: TO CITE THIS SURVEY FILE: Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, '2019 Canadian Election Study - Phone Survey', https://doi.org/10.7910/DVN/8RHLG1, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF]"
ref2015web <- "MESSAGE: TO CITE THIS SURVEY FILE: Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]"
ref2015phone <- "MESSAGE: TO CITE THIS SURVEY FILE: Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]"
ref2015combo <- "MESSAGE: TO CITE THIS SURVEY FILE: Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]"
ref2011 <- "MESSAGE: TO CITE THIS SURVEY FILE: Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2011. The 2011 Canadian Election Study. [dataset]"
ref2008 <- "MESSAGE: TO CITE THIS SURVEY FILE: Gidengil, E, Everitt, J, Fournier, P and Nevitte, N. 2009. The 2008 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref2004 <- "MESSAGE: TO CITE THIS SURVEY FILE: Blais, A, Everitt, J, Fournier, P, Gidengil, E and Nevitte, N. 2005. The 2004 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref0411 <- "MESSAGE: TO CITE THIS SURVEY FILE: Fournier, P, Stolle, D, Soroka, S, Cutler, F, Blais, A, Everitt, J, Gidengil, E and Nevitte, N. 2011. The 2004-2011 Merged Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref0406 <- "MESSAGE: TO CITE THIS SURVEY FILE: Blais, A, Everitt, J, Fournier, P and Nevitte, N. 2011. The 2011 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref2000 <- "MESSAGE: TO CITE THIS SURVEY FILE: Blais, A, Gidengil, E, Nadeau, R and Nevitte, N. 2001. The 2000 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref1997 <- "MESSAGE: TO CITE THIS SURVEY FILE: Blais, A, Gidengil, E, Nadeau, R and Nevitte, N. 1998. The 1997 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref1993 <- "MESSAGE: TO CITE THIS SURVEY FILE: Blais, A, Brady, H, Gidengil, E, Johnston, R and Nevitte, N. 1994. The 1993 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref1988 <- "MESSAGE: TO CITE THIS SURVEY FILE: Johnston, R, Blais, A, Brady, H. E. and Crête, J. 1989. The 1988 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref1984 <- "MESSAGE: TO CITE THIS SURVEY FILE: Lambert, R. D., Brown, S. D., Curtis, J. E., Kay, B. J. and Wilson, J. M. 1985. The 1984 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref1974 <- "MESSAGE: TO CITE THIS SURVEY FILE: Clarke, H, Jenson, J, LeDuc, L and Pammett, J. 1975. The 1974 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref7480 <- "MESSAGE: TO CITE THIS SURVEY FILE: Clarke, H, Jenson, J, LeDuc, L and Pammett, J. 1980. The 1974-1980 Merged Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor]."
ref72jnjl <- "MESSAGE: TO CITE THIS SURVEY FILE: Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001."
ref72sep <- "MESSAGE: TO CITE THIS SURVEY FILE: Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001."
ref72nov <- "MESSAGE: TO CITE THIS SURVEY FILE: Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001."
ref1968 <- "MESSAGE: TO CITE THIS SURVEY FILE: Meisel, J. 1968. The 1968 Canadian Election Study [dataset]. Inter-University Consortium for Political and Social Research, University of Michigan, Ann Arbor MI [Producer and distributor]."
ref1965 <- "MESSAGE: TO CITE THIS SURVEY FILE: Converse, P, Meisel, J, Pinard, M, Regenstreif, P and Schwartz, M. 1966. Canadian Election Survey, 1965. [Microdata File]. Inter-University Consortium for Political and Social Research, University of Michigan, Ann Arbor MI [Producer]."




# ces data frame codes
ces_codes <- (c("ces2019_web", "ces2019_phone", "ces2015_web", "ces2015_phone", "ces2015_combo",
                    "ces2011", "ces2008", "ces2004", "ces0411", "ces0406", "ces2000", "ces1997", "ces1993",
                    "ces1988", "ces1984", "ces1974", "ces7480", "ces72_jnjl", "ces72_sep", "ces72_nov",
                    "ces1968", "ces1965"))

# create data frame from ces code vector
#ces_codetable <- as.data.frame(ces_codes)



# 'get_ces' function, uses one variable 'srvy'
# code for function is commented here; all following else if statements work functionally the same as this if statement
#'@export
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
