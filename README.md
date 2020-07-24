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

* `phonesurvey`:

Stephenson, Laura B; Harell, Allison; Rubenson, Daniel; Loewen, Peter John, 2020, "2019 Canadian Election Study - Phone Survey",
https://doi.org/10.7910/DVN/8RHLG1, Harvard Dataverse, V1, UNF:6:eyR28qaoYlHj9qwPWZmmVQ== [fileUNF]

Documentation for the 2019 CES Phone Survey can be accessed from here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/8RHLG1


## Using the Package

The 'ces' package provides access to the 2019 CES Phone Survey and 2019 Online Survey by loading in both survey datasets under the names 'phonesurvey' and 'onlinesurvey' respectively. The datasets have not automatically been assigned to variable names to avoid possible confusion with other variable names.

To load in either dataset, assign the desired dataset a variable name, e.g.:
`online_ces <- onlinesurvey`
`phone_ces <- phonesurvey`

Alternatively, specific variables can be accessed without having to assign the whole dataset via the format below:
datasetname$variablename, e.g. 
`onlinesurvey$cps19_imp_iss_party`



## Installation

You can install the current version of this package using:

``` r
devtools::install_github("hodgettsp/ces")
```



