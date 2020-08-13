#' Creates a non-exhaustive dataframe of 21 variables with renamed columns.
#'
#' @description
#' get_decon() creates a non-exhaustive dataset consisting of 21 variables with renamed columns
#' from the demographics, ideology, and economy sections of the 2019 CES online survey.
#'
#' @details
#' NAs have not been removed, birth year (yob) has been recoded from the survey code to the actual year.
#' The politically left/right question variables (lr_bef and lr_aft) have also been provided in one column together under the name lr.
#' Variables are citizenship, yob (year of birth), gender, province_territory, education, lr, lr_bef, lr_aft,
#' religion, sexuality, sexuality_other (written answers), language_eng (English language speakers),
#' language_fr (French language speakers), language_abgl (Aboriginal language speakers), employment,
#' income, income cat (category), marital, econ_retro (past economic effects), econ_fed (effect of federal policies),
#' and econ_self (personal economic situation)
#' \describe{
#' \item{\code{citizenship}}{Canadian citizenship status}
#' \item{\code{yob}}{year of birth}
#' \item{\code{gender}}{identified gender of the respondent}
#' \item{\code{province_territory}}{Province or Territory of current residence}
#' \item{\code{education}}{highest level of education completed}
#' \item{\code{lr}}{united column of lr_bef and lr_aft values; whether the respondent identifies on the political spectrum}
#' \item{\code{lr_bef}}{where the respodent identifies on the political spectrum; asked before party identification questions}
#' \item{\code{lr_aft}}{where the respondent identifies on the political spectrum; asked after party identification questions}
#' \item{\code{religion}}{religion of respondent}
#' \item{\code{sexuality}}{sexual identity}
#' \item{\code{sexuality_other}}{sexual identity; written answers}
#' \item{\code{language_eng}}{language learned as child and still understand; selected response English}
#' \item{\code{language_fr}}{language learned as a child and still understand; selected response French}
#' \item{\code{language_abgl}}{langauge learned as a child and still understand; specified Aboriginal language}
#' \item{\code{employment}}{employment status}
#' \item{\code{income}}{total household income, before taxes, for the year 2018}
#' \item{\code{income_cat}}{selected household income category}
#' \item{\code{marital}}{marital status}
#' \item{\code{econ_retro}}{response to question, 'over the past year, has Canada's economy:'}
#' \item{\code{econ_fed}}{response to question, 'have the policies of the federal government made Canada's economy...'}
#' \item{\code{econ_self}}{response to question, have the policies of the federal government made your financial situation...'}
#' }
#'
#' @example
#' get_decon()

#library(dplyr)
#library(labelled)

#'@export
# function to create 'decon' dataset
# does not use any variable calls
get_decon <- function(){
    # if object does not exist in global environment
    if(exists("decon") == FALSE){
       # assign url to 'cesfile'
       cesfile <- "https://raw.github.com/hodgettsp/ces_data/master/extdata/CES2019-web.zip"
       # assign temporary file with .zip extension to placeholder variable
       hldr <- tempfile(fileext = ".zip")
       # download the file from url assigned to 'cesfile' with file extension from the temporary placeholder
       download.file(cesfile, hldr, quiet = TRUE)
       # unzip the placeholder file to given directory
       unzip(hldr, exdir = "inst/extdata/ces2019_hldr")
       # assign data file to temporary data object
       ces2019_hldr <- haven::read_dta(hldr)
       # create new data object with selected columns from temporary data object
       decon <- dplyr::select(ces2019_hldr, c(5:6, 8:10, 69,76, 194, 223:227, 245, 250:251, 258, 123:125))
       # rename columns in new data object
       decon <- dplyr::rename(decon,
                              citizenship = 1,                                                        # rename column 1 to citizenship
                              yob = 2,                                                                # rename column 2 to yob
                              gender = 3,                                                             # rename column 3 to gender
                              province_territory = 4,                                                 # rename column 4 to province_territory
                              education = 5,                                                          # rename column 5 to education
                              lr_bef = 6,                                                             # rename column 6 to lr_bef
                              lr_aft = 7,                                                             # rename column 7 to lr_aft
                              religion = 8,                                                           # rename column 8 to religion
                              sexuality = 9,                                                          # rename column 9 to sexuality
                              sexuality_other = 10,                                                   # rename column 10 to sexuality_other
                              language_eng = 11,                                                      # rename column 11 to language_eng
                              language_fr = 12,                                                       # rename column 12 to language_fr
                              language_abgl = 13,                                                     # rename column 13 to language_abgl
                              employment = 14,                                                        # rename column 14 to employment
                              income = 15,                                                            # rename column 15 to income
                              income_cat = 16,                                                        # rename column 16 to income_cat
                              marital = 17,                                                           # rename column 17 to marital
                              econ_retro = 18,                                                        # rename column 18 to econ_retro
                              econ_fed = 19,                                                          # rename column 19 to econ_fed
                              econ_self = 20)                                                         # rename column 20 to econ_self
       decon <- labelled::to_factor(decon)                                                           # convert variables to factors
       decon <- dplyr::mutate(decon, lr_bef = as.character(lr_bef))                                  # reassign values in lr_bef column as characters for uniting
       decon <- dplyr::mutate(decon, lr_aft = as.character(lr_aft))                                  # reassign values in lr_aft column as characters for uniting
       decon <- tidyr::unite(decon, "lr", lr_bef:lr_aft, na.rm = TRUE, remove = FALSE)               # unite lr_bef and lr_aft columns into new column lr
       decon <- dplyr::mutate_if(decon, is.character, list(~dplyr::na_if(., "")))                    # replaces empty cells in new lr column with NA
       assign("decon", dplyr::mutate(decon, ces_code = "ces2019_web", .before = 1), envir = .GlobalEnv)
       # remove temporary data object
       rm(ces2019_hldr)
       # remove the temporary placeholder
       unlink(hldr, recursive = TRUE, force = TRUE)
       # remove temporary directory
       unlink("inst/extdata/ces2019_hldr", recursive = TRUE, force = TRUE)
       # print out a concatenation of the survey citation
       cat(ref2019web)
    }
    else{
        # if the file does exist stop process and print this message
        stop("Warning: File already exists.")
    }
}

ref2019web <- "MESSAGE: TO CITE THIS SURVEY FILE: Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, '2019 Canadian Election Study - Online Survey', https://doi.org/10.7910/DVN/DUS88V, Harvard Dataverse, V1"
