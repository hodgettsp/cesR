# ces
#### Makes Accessing the CES Datasets a Little Easier. 

<!-- badges: start -->
<!-- badges: end -->

---

## Installation

You can install the current version of this package using:

``` r
devtools::install_github("hodgettsp/ces")
```

_**Warning:**_ *The current organization of the ces package makes it quite large and may lead to long install times.* 

---

## Using the Package

The `ces package` provides access to the CES Surveys by loading in each survey as data objects under the names listed above. 

The easiest way to call a dataset is to assign the desired dataset a variable name, e.g.

```
ces2019_web <- ces2019_web
ces2019_phone <- ces2019_phone
ces_1965 <- ces1965
```

Alternatively, specific variables can be accessed without having to assign the whole dataset via the format datasetname$variablename, e.g. 
```
ces2019_web$cps19_imp_iss_party
```

The datasets are loaded in the labelled format. The variables can be quickly converted to a factor type by using the `to_factor()` function from the `labelled` package.

---

The `ces package` also provides a non-exhuastive dataset consisting of 21 variables with renamed columns under the name `decon`.
The variables in this dataset have been converted to factors so that they display the actual values of the survey responses
and not just the survey code responses.

The `decon` dataset consists of the following variables:
* citzenship: Canadian citizenship status
* yob: year of birth 
* gender: identified gender of the respondent
* province_territory: Province or Territory of current residence
* education: highest level of education completed
* lr: united column of lr_bef and lr_aft values; whether the respondent identifies on the political spectrum
* lr_bef: where the respodent identifies on the political spectrum; asked before party identification questions
* lr_aft: where the respondent identifies on the political spectrum; asked after party identification questions
* religion: religion of respondent
* sexuality: sexual identity
* sexuality_other: sexual identity; written answers
* language_eng: language learned as child and still understand; selected response English
* language_fr: language learned as a child and still understand; selected response French
* language_abgl: langauge learned as a child and still understand; specified Aboriginal language
* employment: employment status
* income: total household income, before taxes, for the year 2018
* income_cat: selected household income category
* marital: marital status
* econ_retro: response to question, 'over the past year, has Canada's economy:'
* econ_fed: response to question, 'have the policies of the federal government made Canada's economy...'
* econ_self: response to question, have the policies of the federal government made your financial situation...'

The `decon` dataset can be called by assigning it to a variable name, e.g.
```
decon <- decon
```

Alternatively, a specific variable can be called without assigning the whole dataset with the format datasetname$variablename, e.g.
```
decon$education
```

|year  |  code         |  name                         | citation                    |   documentation  |
|:----:|:-------------:|:-----------------------------:|:---------------------------:|:----------------:|
|2019  | `ces2019_web`   |  2019  CES Online surveys     | Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Online Survey", https://doi.org/10.7910/DVN/DUS88V, Harvard Dataverse, V1 |[CES 2019 Web](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2019/Canadian%20Election%20Study%2C%202019%2C%20Online%20Survey.pdf) 
|2019  | `ces2019_phone` |  2019 CES Phone Survey        | Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Phone Survey", https://doi.org/10.7910/DVN/8RHLG1, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF] | [CES 2019 Phone](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2019/Canadian%20Election%20Study%2C%202019%2C%20Phone%20Survey.pdf) 
|2015  | `ces2015_web`   |  2015 CES Online Survey       |  Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]                     | [CES 2015 Combined](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2015web/CES2015_Combined_Data_Codebook.pdf)
|2015  | ces2015_phone |  2015 CES Phone Survey        |  Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]                       
|[CPS Phone Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2015phone/CES15_CPS_phone-clean.pdf)
[Mailback French](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2015phone/CES15_MBS_mailback-fre.pdf)
[Mailback English](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2015phone/CES15_MBS_mailback-eng.pdf)
[PES Phone Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2015phone/CES15_PES_phone-clean.pdf)
|2015  | ces2015_combo |  2015 CES Online/Phone Surveys|  Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]                      
|[CES 2015 Combined](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2015combined/CES2015_Combined_Data_Codebook.pdf)
|2011  | ces2011       |  2011 CES Survey              |  Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2011. The 2011 Canadian Election Study. [dataset]                       
|[2011 CPS Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_CPS-clean.pdf)
[2011 MBS French](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_MBS-fr.pdf)
[2011 MBS English](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_MBS-eng.pdf)
[2011 PES Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_PES-clean.pdf)
[2011 Web Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_WEB-clean.pdf)
[2011 Technical Documentation](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES2011-Documentation-final.pdf)
|2008  | ces2008       |  2008 CES Survey              |    Gidengil, E, Everitt, J, Fournier, P and Nevitte, N. 2009. The 2008 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                         |
[CES 2008](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2008/CES-E-2008.pdf)
|2004  | ces2004       |  2004 CES Survey              |     Blais, A, Everitt, J, Fournier, P, Gidengil, E and Nevitte, N. 2005. The 2004 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                 |
[CES 2004](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2004/CES-E-2004.pdf)
|2004-2011 | ces0411   |  2004-2011 CES Survey         |  Fournier, P, Stolle, D, Soroka, S, Cutler, F, Blais, A, Everitt, J, Gidengil, E and Nevitte, N. 2011. The 2004-2011 Merged Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].  |
[CES 2004](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2004/CES-E-2004.pdf)
[CES 2008](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2008/CES-E-2008.pdf)
[2011 CPS Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_CPS-clean.pdf)
[2011 MBS French](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_MBS-fr.pdf)
[2011 MBS English](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_MBS-eng.pdf)
[2011 PES Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_PES-clean.pdf)
[2011 Web Clean](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES11_WEB-clean.pdf)
[2011 Technical Documentation](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2011/CES2011-Documentation-final.pdf)
|2004-2006 | ces0406   |  2004-2006 CES Survey         |  Blais, A, Everitt, J, Fournier, P and Nevitte, N. 2011. The 2011 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                                    |
[CES 2004-2006](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces04-06/CES-E-2004-2006.pdf)
|2000  |  ces2000      |  2000 CES Survey              |     Blais, A, Gidengil, E, Nadeau, R and Nevitte, N. 2001. The 2000 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                          |
[CES 2000](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces2000/CES-E-2000.pdf)
|1997  |  ces1997      |  1997 CES Survey              |    Blais, A, Gidengil, E, Nadeau, R and Nevitte, N. 1998. The 1997 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                          |
[CES 1997](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1997/CES-E-1997.pdf)
|1993  |  ces1993      |  1993 CES Survey              |    Blais, A, Brady, H, Gidengil, E, Johnston, R and Nevitte, N. 1994. The 1993 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                 |
[CES 1993](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1993/CES-E-1993.pdf)
|1988  |   ces1988     |  1988 CES Survey              |    Johnston, R, Blais, A, Brady, H. E. and Crête, J. 1989. The 1988 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                          |
[CES 1988](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1988/CES-E-1988.pdf)
|1984  |   ces1984     |  1984 CES Survey              |  Lambert, R. D., Brown, S. D., Curtis, J. E., Kay, B. J. and Wilson, J. M. 1985. The 1984 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                          |
[CES 1984](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1984/CES-E-1984.pdf)
|1974  |   ces1974     |   1974 CES Survey             |   Clarke, H, Jenson, J, LeDuc, L and Pammett, J. 1975. The 1974 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                                    |
[CES 1974](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1974/CES-E-1974.pdf)
|1974-1980 | ces7480   |  1974-1980 CES Survey         |  Clarke, H, Jenson, J, LeDuc, L and Pammett, J. 1980. The 1974-1980 Merged Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].                                                          |
[CES 1974](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1974/CES-E-1974.pdf)
|1972 June-July | ces72_jnjl | 1972, June-July CES Curvey | Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001.   |
|1972 September | ces72_sep  | 1972, September CES Survey |  Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001.   |
|1972 November  | ces72_nov  | 1972, November CES Survey  |   Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001.   |
|1968 |  ces1968       |  1968 CES Survey              |    Meisel, J. 1968. The 1968 Canadian Election Study [dataset]. Inter-University Consortium for Political and Social Research, University of Michigan, Ann Arbor MI [Producer and distributor].                                                                        |
[CES 1968](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1968/CES-E-1968.pdf)
|1965 |   ces1965      |    1965 CES Survey            |  Converse, P, Meisel, J, Pinard, M, Regenstreif, P and Schwartz, M. 1966. Canadian Election Survey, 1965. [Microdata File]. Inter-University Consortium for Political and Social Research, University of Michigan, Ann Arbor MI [Producer].                              |
[CES 1965](https://github.com/hodgettsp/ces/blob/master/inst/survey_documentation/ces1965/CES-E-1965.pdf)



## Citations

---

* `ces2019_web`: 2019 CES Online Survey

**Citation**
Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Online Survey",
https://doi.org/10.7910/DVN/DUS88V, Harvard Dataverse, V1

Documentation for the 2019 CES Online Survey can be accessed from here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DUS88V

---

* `ces2019_phone`: 2019 CES Phone Survey

**Citation**:
Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Phone Survey",
https://doi.org/10.7910/DVN/8RHLG1, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF]

Documentation for the 2019 CES Phone Survey can be accessed from here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/8RHLG1

---

* `ces2015_web`: 2015 CES Online Survey

**Citation**:
Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]

Documentation for the 2015 CES Online Survey can be accessed from here:
https://ces-eec.arts.ubc.ca/english-section/surveys/

---

* `ces2015_phone`: 2015 CES Phone Survey

**Citation**:
Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]

Documentation for the 2015 CES Phone Survey can be accessed from here:
https://ces-eec.arts.ubc.ca/english-section/surveys/

---

* `ces2015_combo`: 2015 CES Online/Phone Surveys

**Citation**:
Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2015. The 2015 Canadian Election Study. [dataset]

Documentation for the 2015 CES Online/Phone Surveys can be accessed from here:
https://ces-eec.arts.ubc.ca/english-section/surveys/

---

* `ces2011`: 2011 CES Survey

**Citation**:
Fournier, Patrick, Fred Cutler, Stuart Soroka and Dietlind Stolle. 2011. The 2011 Canadian Election Study. [dataset]

Documentation for the 2011 CES Survey can be accessed from here:
https://ces-eec.arts.ubc.ca/english-section/surveys/

---

* `ces2008`: 2008 CES Survey

**Citation**:
Gidengil, E, Everitt, J, Fournier, P and Nevitte, N. 2009. The 2008 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces2004`: 2004 CES Survey

**Citation**:
Blais, A, Everitt, J, Fournier, P, Gidengil, E and Nevitte, N. 2005. The 2004 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces0411`: 2004-2011 CES Survey

**Citation**:
Fournier, P, Stolle, D, Soroka, S, Cutler, F, Blais, A, Everitt, J, Gidengil, E and Nevitte, N. 2011. The 2004-2011 Merged Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces0406`: 2004-2006 CES Survey

**Citation**:
Blais, A, Everitt, J, Fournier, P and Nevitte, N. 2011. The 2011 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces2000`: 2000 CES Survey

**Citation**:
Blais, A, Gidengil, E, Nadeau, R and Nevitte, N. 2001. The 2000 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces1997`: 1997 CES Survey

**Citation**:
Blais, A, Gidengil, E, Nadeau, R and Nevitte, N. 1998. The 1997 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces1993`: 1993 CES Survey

**Citation**:
Blais, A, Brady, H, Gidengil, E, Johnston, R and Nevitte, N. 1994. The 1993 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces1988`: 1988 CES Survey

**Citation**:
Johnston, R, Blais, A, Brady, H. E. and Crête, J. 1989. The 1988 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces1984`: 1984 CES Survey

**Citation**:
Lambert, R. D., Brown, S. D., Curtis, J. E., Kay, B. J. and Wilson, J. M. 1985. The 1984 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces1974`: 1974 CES Survey

**Citation**:
Clarke, H, Jenson, J, LeDuc, L and Pammett, J. 1975. The 1974 Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces7480`: 1974-1980 CES Survey

**Citation**:
Clarke, H, Jenson, J, LeDuc, L and Pammett, J. 1980. The 1974-1980 Merged Canadian Election Study [dataset]. Toronto, Ontario, Canada: Institute for Social Research [producer and distributor].

---

* `ces72_jnjl`: 1972, June-July CES Curvey

**Citation**:
Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001.

---

* `ces72_sep`: 1972, September CES Survey

**Citation**:
Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001.

---

* `ces72_nov`: 1972, November CES Survey

**Citation**:
Ruban, C. 1972. The 1972 Canadian Election Study [dataset]. 2nd ICPSR version. Toronto, Ontario, Canada: Market Opinion Research (Canada) Ltd. [producer], 1972. Ann Arbor, MI: Interuniversity Consortium for Political and Social Research [distributor], 2001.

---

* `ces1968`: 1968 CES Survey

**Citation**:
Meisel, J. 1968. The 1968 Canadian Election Study [dataset]. Inter-University Consortium for Political and Social Research, University of Michigan, Ann Arbor MI [Producer and distributor].

---

* `ces1965`: 1965 CES Survey

**Citation**:
Converse, P, Meisel, J, Pinard, M, Regenstreif, P and Schwartz, M. 1966. Canadian Election Survey, 1965. [Microdata File]. Inter-University Consortium for Political and Social Research, University of Michigan, Ann Arbor MI [Producer].



