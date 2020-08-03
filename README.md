# ces
#### Makes Accessing the 2019 CES Datasets a Little Easier. 

<!-- badges: start -->
<!-- badges: end -->

This package contains both the phone and online datasets from the 2019 Canadian Election Survey:

* `onlinesurvey`:

Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Online Survey",
https://doi.org/10.7910/DVN/DUS88V, Harvard Dataverse, V1

Documentation for the 2019 CES Online Survey can be accessed from here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DUS88V

---

* `phonesurvey`:

Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Phone Survey",
https://doi.org/10.7910/DVN/8RHLG1, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF]

Documentation for the 2019 CES Phone Survey can be accessed from here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/8RHLG1

---

## Using the Package

The `ces package` provides access to the 2019 CES Phone Survey and 2019 Online Survey by loading in both survey datasets under the names `phonesurvey` and `onlinesurvey` respectively. The datasets have not automatically been assigned to variable names to avoid possible confusion with other variable names.

To call either dataset, assign the desired dataset a variable name, e.g.
```
onlinesurvey <- onlinesurvey
phonesurvey <- phonesurvey
```

Alternatively, specific variables can be accessed without having to assign the whole dataset via the format datasetname$variablename, e.g. 
```
onlinesurvey$cps19_imp_iss_party
```

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


---

## Installation

You can install the current version of this package using:

``` r
devtools::install_github("hodgettsp/ces")
```



