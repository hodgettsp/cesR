#' Print a dataset of the CES survey codes and their associated calls.
#'
#' @description
#' `get_cescodes()` prints out a data frame of the CES survey codes and the associated calls.
#' Provides a quick way of looking up a CES survey code and the associated calls.
#'
#' @details
#' Items under the *Survey Code Calls* and *Index Code Calls* can be copied and used with the `get_ces()` function.
#'
#' ## Survey Codes
#' * `ces2019_web` 2019 CES online survey dataset.
#' * `ces2019_phone` 2019 CES phone survey dataset.
#' * `ces2015_web` 2015 CES online survey dataset.
#' * `ces2015_phone` 2015 CES phone survey dataset.
#' * `ces2015_combo` 2015 CES combined (online/phone) dataset.
#' * `ces2011` 2011 CES survey dataset.
#' * `ces2008` 2008 CES survey dataset.
#' * `ces2004` 2004 CES survey dataset.
#' * `ces0411` 2004-2011 CES survey dataset.
#' * `ces0406` 2004-2006 CES survey dataset.
#' * `ces2000` 2000 CES survey dataset.
#' * `ces1997` 1997 CES survey dataset.
#' * `ces1993` 1993 CES survey dataset.
#' * `ces1988` 1988 CES survey dataset.
#' * `ces1984` 1984 CES survey dataset.
#' * `ces1974` 1974 CES survey dataset.
#' * `ces7480` 1974-1980 CES survey dataset.
#' * `ces72_jnjl` 1972 June-July CES survey dataset.
#' * `ces72_sep` 1972 September CES survey dataset.
#' * `ces72_nov` 1972 November CES survey dataset.
#' * `ces1968` 1968 CES survey dataset.
#' * `ces1965` 1965 CES survey dataset.
#'
#' ## Survey Code Calls
#' * `"ces2019_web"` calls 2019 CES online survey dataset.
#' * `"ces2019_phone"` calls 2019 CES phone survey dataset.
#' * `"ces2015_web"` calls 2015 CES online survey dataset.
#' * `"ces2015_phone"` calls 2015 CES phone survey dataset.
#' * `"ces2015_combo"` calls 2015 CES combined (online/phone) dataset.
#' * `"ces2011"` calls 2011 CES survey dataset.
#' * `"ces2008"` calls 2008 CES survey dataset.
#' * `"ces2004"` calls 2004 CES survey dataset.
#' * `"ces0411"` calls 2004-2011 CES survey dataset.
#' * `"ces0406"` calls 2004-2006 CES survey dataset.
#' * `"ces2000"` calls 2000 CES survey dataset.
#' * `"ces1997"` calls 1997 CES survey dataset.
#' * `"ces1993"` calls 1993 CES survey dataset.
#' * `"ces1988"` calls 1988 CES survey dataset.
#' * `"ces1984"` calls 1984 CES survey dataset.
#' * `"ces1974"` calls 1974 CES survey dataset.
#' * `"ces7480"` calls 1974-1980 CES survey dataset.
#' * `"ces72_jnjl"` calls 1972 June-July CES survey dataset.
#' * `"ces72_sep"` calls 1972 September CES survey dataset.
#' * `"ces72_nov"` calls 1972 November CES survey dataset.
#' * `"ces1968"` calls 1968 CES survey dataset.
#' * `"ces1965"` calls 1965 CES survey dataset.
#'
#' #' ## Index Code Calls
#' * `ces_codes[1]` calls 2019 CES online survey dataset.
#' * `ces_codes[2]` calls 2019 CES phone survey dataset.
#' * `ces_codes[3]` calls 2015 CES online survey dataset.
#' * `ces_codes[4]` calls 2015 CES phone survey dataset.
#' * `ces_codes[5]` calls 2015 CES combined (online/phone) dataset.
#' * `ces_codes[6]` calls 2011 CES survey dataset.
#' * `ces_codes[7]` calls 2008 CES survey dataset.
#' * `ces_codes[8]` calls 2004 CES survey dataset.
#' * `ces_codes[9]` calls 2004-2011 CES survey dataset.
#' * `ces_codes[10]` calls 2004-2006 CES survey dataset.
#' * `ces_codes[11]` calls 2000 CES survey dataset.
#' * `ces_codes[12]` calls 1997 CES survey dataset.
#' * `ces_codes[13]` calls 1993 CES survey dataset.
#' * `ces_codes[14]` calls 1988 CES survey dataset.
#' * `ces_codes[15]` calls 1984 CES survey dataset.
#' * `ces_codes[16]` calls 1974 CES survey dataset.
#' * `ces_codes[17]` calls 1974-1980 CES survey dataset.
#' * `ces_codes[18]` calls 1972 June-July CES survey dataset.
#' * `ces_codes[19]` calls 1972 September CES survey dataset.
#' * `ces_codes[20]` calls 1972 November CES survey dataset.
#' * `ces_codes[21]` calls 1968 CES survey dataset.
#' * `ces_codes[22]` calls 1965 CES survey dataset.
#'
#' @examples
#' devtools::install_github("hodgettsp/ces)
#'
#' library(ces)
#'
#' get_cescodes()
#' index ces_dataframe_code get_ces_call_char get_ces_call_index
#'1      1        ces2019_web     "ces2019_web"       ces_codes[1]
#'2      2      ces2019_phone   "ces2019_phone"       ces_codes[2]
#'3      3        ces2015_web     "ces2015_web"       ces_codes[3]
#'4      4      ces2015_phone   "ces2015_phone"       ces_codes[4]
#'5      5      ces2015_combo   "ces2015_combo"       ces_codes[5]
#'6      6            ces2011         "ces2011"       ces_codes[6]
#'7      7            ces2008         "ces2008"       ces_codes[7]
#'8      8            ces2004         "ces2004"       ces_codes[8]
#'9      9            ces0411         "ces0411"       ces_codes[9]
#'10    10            ces0406         "ces0406"      ces_codes[10]
#'11    11            ces2000         "ces2000"      ces_codes[11]
#'12    12            ces1997         "ces1997"      ces_codes[12]
#"13    13            ces1993         "ces1993"      ces_codes[13]
#'14    14            ces1988         "ces1988"      ces_codes[14]
#'15    15            ces1984         "ces1984"      ces_codes[15]
#'16    16            ces1974         "ces1974"      ces_codes[16]
#'17    17            ces7480         "ces7480"      ces_codes[17]
#'18    18         ces72_jnjl      "ces72_jnjl"      ces_codes[18]
#'19    19          ces72_sep       "ces72_sep"      ces_codes[19]
#'20    20          ces72_nov       "ces72_nov"      ces_codes[20]
#'21    21            ces1968         "ces1968"      ces_codes[21]
#'22    22            ces1965         "ces1965"      ces_codes[22]
#'
#' @seealso `get_ces()` function help


#'@export
# get_cescodes function
# creates three vectors of the ces survey codes and associated calls
# converts those vectors to data frames with associated index number for call
# merges the three data frames and renames the columns
# removes the data frame items and prints merged results
# can be used to lookup a survey code and the associated calls.
get_cescodes <- function(){
  ces1 <- (c("ces2019_web", "ces2019_phone", "ces2015_web", "ces2015_phone", "ces2015_combo",
                "ces2011", "ces2008", "ces2004", "ces0411", "ces0406", "ces2000", "ces1997", "ces1993",
                "ces1988", "ces1984", "ces1974", "ces7480", "ces72_jnjl", "ces72_sep", "ces72_nov",
                "ces1968", "ces1965"))
  ces2 <- c('"ces2019_web"', '"ces2019_phone"', '"ces2015_web"', '"ces2015_phone"', '"ces2015_combo"',
                '"ces2011"', '"ces2008"', '"ces2004"', '"ces0411"', '"ces0406"', '"ces2000"', '"ces1997"', '"ces1993"',
                '"ces1988"', '"ces1984"', '"ces1974"', '"ces7480"', '"ces72_jnjl"', '"ces72_sep"', '"ces72_nov"',
                '"ces1968"', '"ces1965"')
  ces3 <- c('ces_codes[1]', 'ces_codes[2]', 'ces_codes[3]', 'ces_codes[4]', 'ces_codes[5]', 'ces_codes[6]', 'ces_codes[7]',
            'ces_codes[8]', 'ces_codes[9]', 'ces_codes[10]', 'ces_codes[11]', 'ces_codes[12]', 'ces_codes[13]', 'ces_codes[14]',
            'ces_codes[15]', 'ces_codes[16]', 'ces_codes[17]', 'ces_codes[18]', 'ces_codes[19]', 'ces_codes[20]', 'ces_codes[21]',
            'ces_codes[22]')
  ces1 <- data.frame(ces1)
  ces1$index <- seq.int(nrow(ces1))
  ces2 <- data.frame(ces2)
  ces2$index <- seq.int(nrow(ces2))
  ces3 <- data.frame(ces3)
  ces3$index <- seq.int(nrow(ces3))
  ces_calltable <- merge(ces1, ces2, by = "index")
  ces_calltable <- merge(ces_calltable, ces3, by = "index")
  ces_calltable <- dplyr::rename(ces_calltable, ces_survey_code = ces1, get_ces_call_char = ces2, get_ces_call_index = ces3)
  rm(ces1)
  rm(ces2)
  rm(ces3)
  print(ces_calltable)
}
