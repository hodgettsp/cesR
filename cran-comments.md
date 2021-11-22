## 0.1.0 Resubmission

### Review 1 - 2021-11-22

This is a resubmission. In this version I have addressed the following comments.

#### First comment:
>Please do not start the description with "This package", package name,
>title or similar.

Edited description to begin with "[makes] accessing the Canadian Election Study..." instead of "[the] 'cesR' package..."

#### Second comment:
>Please provide a link to the used webservices to the description field
>of your DESCRIPTION file in the form
><http:...> or <[https:...]https:...>
>with angle brackets for auto-linking and no space after 'http:' and
>'https:'.

Added in the necessary URL links to the package description.

#### Third comment:
>Please add \value to .Rd files regarding exported methods and explain
>the functions results in the documentation. Please write about the
>structure of the output (class) and also what the output means. (If a
>function does not return a value, please document that too, e.g.
>\value{No return value, called for side effects} or similar)
>Missing Rd-tags:
>      get_ces.Rd: \value
>      get_cescodes.Rd: \arguments,  \value
>      get_decon.Rd: \value
>      get_preview.Rd: \value
>      get_question.Rd: \value

Added return value descriptions for each function and added param argument decription to `get_cescodes()`

#### Fourth comment:
>You write information messages to the console that cannot be easily
>suppressed. It is more R like to generate objects that can be used to
>extract the information a user is interested in, and then print() that
>object. Instead of print()/cat() rather use message()/warning() or
>if(verbose)cat(..) (or maybe stop()) if you really have to write text to
>the console. (except for print, summary, interactive functions)

Removed unnecessary `print()` calls and replaced `cat()` function calls with `message()` calls.

#### Fifth comment:
>Please ensure that your functions do not write by default or in your
>examples/vignettes/tests in the user's home filespace (including the
>package directory and getwd()). This is not allowed by CRAN policies. In
>your examples/vignettes/tests you can write to tempdir().

Adjusted functions so that they now download to the temporary directory instead of package directory.

### Test environments
* local R installation, R verions 4.1.1 (2021-08-10)
* R-hub windows-x86_64-devel (r-devel)
* R-hub ubuntu-gcc-release (r-release)
* R-hub fedora-clang-devel (r-devel)

### R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
