# Produces a non-exhaustive dataframe of 21 variables with renamed columns
# NAs have not been removed, birth year (yob) has been recoded from the survey code to the actual year.
# Other variables have not been recoded so as to not interfere with languages.
# The politically left/right question variables (lr_bef and lr_aft) have also been provided in one column together under the name lr.
# Variables are citizenship, yob (year of birth), gender, province_territory, education, lr, lr_bef, lr_aft,
# religion, sexuality, sexuality_other (written answers), language_eng (English language speakers),
# language_fr (French language speakers), language_abgl (Aboriginal language speakers), employment,
# income, income cat (category), marital, econ_retro (past economic effects), econ_fed (effect of federal policies),
# and econ_self (personal economic situation)

library(tidyverse)

decon <- dplyr::select(onlinesurvey, c(5:6, 8:10, 69,76, 194, 223:227, 245, 250:251, 258, 123:125))
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
decon <- dplyr::mutate(decon, lr_bef = as.character(lr_bef))                                 # reassign values in lr_bef column as characters for uniting
decon <- dplyr::mutate(decon, lr_aft = as.character(lr_aft))                                 # reassign values in lr_aft column as characters for uniting
decon <- tidyr::unite(decon, "lr", lr_bef:lr_aft, na.rm = TRUE, remove = FALSE)              # unite lr_bef and lr_aft columns into new column lr
decon <- dplyr::mutate_if(decon, is.character, list(~dplyr::na_if(., "")))                   # replaces empty cells in new lr column with NA
decon <- dplyr::mutate(decon, yob = as.integer(yob))                                         # reassign values in yob as integers for recoding
decon <- dplyr::mutate(decon, yob = dplyr::recode(yob,                                       # recode survey code years for actual year of birth
                                             `1` =  "1920", `2` =  "1921", `3` =  "1922", `4` =  "1923", `5` =  "1924",
                                             `6` =  "1925", `7` =  "1926", `8` =  "1927", `9` =  "1928", `10` = "1929",
                                             `11` = "1930", `12` = "1931", `13` = "1932", `14` = "1933", `15` = "1934",
                                             `16` = "1935", `17` = "1936", `18` = "1937", `19` = "1938", `20` = "1939",
                                             `21` = "1940", `22` = "1941", `23` = "1942", `24` = "1943", `25` = "1944",
                                             `26` = "1945", `27` = "1946", `28` = "1947", `29` = "1948", `30` = "1949",
                                             `31` = "1950", `32` = "1951", `33` = "1952", `34` = "1953", `35` = "1954",
                                             `36` = "1955", `37` = "1956", `38` = "1957", `39` = "1958", `40` = "1959",
                                             `41` = "1960", `42` = "1961", `43` = "1962", `44` = "1963", `45` = "1964",
                                             `46` = "1965", `47` = "1966", `48` = "1967", `49` = "1968", `50` = "1969",
                                             `51` = "1970", `52` = "1971", `53` = "1972", `54` = "1973", `55` = "1974",
                                             `56` = "1975", `57` = "1976", `58` = "1977", `59` = "1978", `60` = "1979",
                                             `61` = "1980", `62` = "1981", `63` = "1982", `64` = "1983", `65` = "1984",
                                             `66` = "1985", `67` = "1986", `68` = "1987", `69` = "1988", `70` = "1989",
                                             `71` = "1990", `72` = "1991", `73` = "1992", `74` = "1993", `75` = "1994",
                                             `76` = "1995", `77` = "1996", `78` = "1997", `79` = "1998", `80` = "1999",
                                             `81` = "2000", `82` = "2001", `83` = "2002", `84` = "2003", `85` = "2004",
                                             `86` = "2005", `87` = "2006", `88` = "2007", `89` = "2008", `90` = "2009",
                                             `91` = "2010"))
decon <- dplyr::mutate(decon, income_cat = as.integer(income_cat))                           # reassign values in income_cat as integers for recoding
decon <- dplyr::mutate(decon, income_cat = dplyr::recode(income_cat,                         # recode survey code income categories for actual income categories
                                                           `1` = "No Income", `2` = "$1 - $30,000", `3` = "$30,001 - $60,000",
                                                           `4` = "$60,0001 - $90,000", `5` = "$90,001 - $110,000", `6` = "$110,001 - $150,000",
                                                           `7` = "$150,001 - $200,000", `8` = "> $200,000", `9` = "NA"))
decon <- dplyr::mutate(decon, province_territory = as.character(province_territory))         # reassign values in province_territory as characters for recoding
decon <- dplyr::mutate(decon, province_territory = dplyr::recode(province_territory,         # recode survey code province and territory categories to internationally approved codes
                                                                   `14` = "AB", `15` = "BC", `16` = "NB", `18` = "NL", `19` = "NT", `20` = "NS",
                                                                   `21` = "NU", `22` = "ON", `23` = "PE", `24` = "QC", `25` = "SK", `26` = "YT"))

