# Produces a non-exhaustive dataframe of 21 variables with renamed columns
# NAs have not been removed, birth year (yob) has been recoded from the survey code to the actual year.
# Other variables have not been recoded so as to not interfere with languages.
# The politically left/right question variables (lr_bef and lr_aft) have also been provided in one column together under the name lr.
# Variables are citizenship, yob (year of birth), gender, province_territory, education, lr, lr_bef, lr_aft,
# religion, sexuality, sexuality_other (written answers), language_eng (English language speakers),
# language_fr (French language speakers), language_abgl (Aboriginal language speakers), employment,
# income, income cat (category), marital, econ_retro (past economic effects), econ_fed (effect of federal policies),
# and econ_self (personal economic situation)

#library(dplyr)
#library(labelled)

decon <- dplyr::select(ces::onlinesurvey, c(5:6, 8:10, 69,76, 194, 223:227, 245, 250:251, 258, 123:125))
decon <- dplyr::rename(decon,
                       citizenship = 1,                                                       # rename column 1 to citizenship
                       yob = 2,                                                               # rename column 2 to yob
                       gender = 3,                                                            # rename column 3 to gender
                       province_territory = 4,                                                # rename column 4 to province_territory
                       education = 5,                                                         # rename column 5 to education
                       lr_bef = 6,                                                            # rename column 6 to lr_bef
                       lr_aft = 7,                                                            # rename column 7 to lr_aft
                       religion = 8,                                                          # rename column 8 to religion
                       sexuality = 9,                                                         # rename column 9 to sexuality
                       sexuality_other = 10,                                                  # rename column 10 to sexuality_other
                       language_eng = 11,                                                     # rename column 11 to language_eng
                       language_fr = 12,                                                      # rename column 12 to language_fr
                       language_abgl = 13,                                                    # rename column 13 to language_abgl
                       employment = 14,                                                       # rename column 14 to employment
                       income = 15,                                                           # rename column 15 to income
                       income_cat = 16,                                                       # rename column 16 to income_cat
                       marital = 17,                                                          # rename column 17 to marital
                       econ_retro = 18,                                                       # rename column 18 to econ_retro
                       econ_fed = 19,                                                         # rename column 19 to econ_fed
                       econ_self = 20)                                                        # rename column 20 to econ_self
decon <- labelled::to_factor(decon)                                                           # convert table to factors
decon <- dplyr::mutate(decon, lr_bef = as.character(lr_bef))                                  # reassign values in lr_bef column as characters for uniting
decon <- dplyr::mutate(decon, lr_aft = as.character(lr_aft))                                  # reassign values in lr_aft column as characters for uniting
decon <- tidyr::unite(decon, "lr", lr_bef:lr_aft, na.rm = TRUE, remove = FALSE)               # unite lr_bef and lr_aft columns into new column lr
decon <- dplyr::mutate_if(decon, is.character, list(~dplyr::na_if(., "")))                    # replaces empty cells in new lr column with NA

expodir <- here::here("data")
setwd(expodir)
save(decon, file = "decon.RData")

