#'@importFrom tibble tibble
NULL

#' 2019 Canadian Election Online Survey.
#'
#' The online survey dataset from the 2019 Canadian Election Study (CES)
#'
#' @format A data frame with 620 variables and 37822 observations.
#'
#' For further details, see \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DUS88V}
#' Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Online Survey",
#' \url{https://doi.org/10.7910/DVN/DUS88V}, Harvard Dataverse, V1
"onlinesurvey"

#' 2019 Canadian Election Phone Survey.
#'
#' The phone survey dataset from the 2019 Canadian Election Study (CES)
#'
#' @format A data frame with 273 variables and 4021 observations.
#'
#' For further details, see \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/8RHLG1}
#' Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Phone Survey",
#' \url{https://doi.org/10.7910/DVN/8RHLG1}, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF]
"phonesurvey"

#' Decon.
#'
#' A non-exhaustive dataset consisting of 21 variables with renamed columns
#' from the demographics, ideology, and economy sections of the 2019 CES online survey
#'
#' @format A data frame with 21 variables and 37822 observations
#' \describe{
#' \item\code{citizenship}{Canadian citizenship status}
#' \item\code{yob}{year of birth}
#' \item\code{gender}{identified gender of the respondent}
#' \item\code{province_territory}{Province or Territory of current residence}
#' \item\code{education}{highest level of education completed}
#' \item\code{lr}{united column of lr_bef and lr_aft values; whether the respondent identifies on the political spectrum}
#' \item\code{lr_bef}{where the respodent identifies on the political spectrum; asked before party identification questions}
#' \item\code{lr_aft}{where the respondent identifies on the political spectrum; asked after party identification questions}
#' \item\code{religion}{religion of respondent}
#' \item\code{sexuality}{sexual identity}
#' \item\code{sexuality_other}{sexual identity; written answers}
#' \item\code{language_eng}{language learned as child and still understand; selected response English}
#' \item\code{language_fr}{language learned as a child and still understand; selected response French}
#' \item\code{language_abgl}{langauge learned as a child and still understand; specified Aboriginal language}
#' \item\code{employment}{employment status}
#' \item\code{income}{total household income, before taxes, for the year 2018}
#' \item\code{income_cat}{selected household income category}
#' \item\code{marital}{marital status}
#' \item\code{econ_retro}{response to question, 'over the past year, has Canada's economy:'}
#' \item\code{econ_fed}{response to question, 'have the policies of the federal government made Canada's economy...'}
#' \item\code{econ_self}{response to question, have the policies of the federal government made your financial situation...'}
#' }
#' For further details, see \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DUS88V}
#' Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Online Survey",
#' \url{https://doi.org/10.7910/DVN/DUS88V}, Harvard Dataverse, V1
"decon"
