
<!-- README.md is generated from README.Rmd. Please edit that file -->
RSOQuestions
============

RSOQuestions is a way to easily view / run the code of questions on the `r` tag on stackoverflow.

Installation
------------

You can install RSOQuestions from GitHub with:

``` r
devtools::install_github("d-edison/RSOQuestions")
```

Example
-------

You can grab a question from stackoverflow by using the `get_question` function:

``` r
library(RSOQuestions)

# only argument is ID, this ID corresponds to a popular question on the differences between <- and = for assignment
q <- get_question(1741820) 
```

If no arguments are provided to `get_question`, the most recent question on the `r` tag will be used by default. RSOQuestion also provides a convenience function `get_recent_ids` to grab the 30 most recent IDs on the `r` tag:

``` r
get_recent_ids()
#>  [1] 55618228 55618058 55618054 55618052 55618040 55617819 55617776
#>  [8] 55617775 55617683 55617539 55617437 55617425 55617360 55617289
#> [15] 55617283 55617232 55617205 55617136 55617090 55617044 55617015
#> [22] 55616992 55616909 55616854 55616847 55616697 55616615 55616557
#> [29] 55616544 55616449
```

To view the question in the RStudio Viewer pane, use `view_question`:

``` r
view_question(q)
```

You run anything formatted as code with `run_code`. This function will run all expressions in the global environment and capture all results and error. By default the output with the calls and results errors is returned invisibly.

``` r
#run all code in global environment
res <- run_code(q) 

#see results
res
#> [[1]]
#> [[1]]$`result`
#> [1] 5
#> 
#> [[1]]$call
#> x <- y <- 5
#> 
#> 
#> [[2]]
#> [[2]]$`result`
#> [1] 5
#> 
#> [[2]]$call
#> x = y = 5
#> 
#> 
#> [[3]]
#> [[3]]$`result`
#> [1] 5
#> 
#> [[3]]$call
#> x = y <- 5
#> 
#> 
#> [[4]]
#> [[4]]$`error`
#> <simpleError in x <- y = 5: could not find function "<-<-">
#> 
#> [[4]]$call
#> x <- y = 5
```
