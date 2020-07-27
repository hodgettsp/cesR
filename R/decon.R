# Produces a non-exhaustive dataframe of 21 variables with renamed columns
# NAs have not been removed, birth year (yob) has been recoded from the survey code to the actual year.
# Other variables have not been recoded so as to not interfere with languages.
# The politically left/right question variables (lr_bef and lr_aft) have also been provided in one column together under the name lr.
# Variables are citizenship, yob (year of birth), gender, province_territory, education, lr, lr_bef, lr_aft,
# religion, sexuality, sexuality_other (written answers), language_eng (English language speakers),
# language_fr (French language speakers), language_abgl (Aboriginal language speakers), employment,
# income, income cat (category), marital, econ_retro (past economic effects), econ_fed (effect of federal policies),
# and econ_self (personal economic situation)

#library(tidyverse)

decon <- dplyr::select(ces::onlinesurvey, c(5:6, 8:10, 69,76, 194, 223:227, 245, 250:251, 258, 123:125))
