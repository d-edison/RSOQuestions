#' Run A Question's Code
#'
#' This function takes all formatted code blocks and attempts to run them in the
#' global environment.
#'
#' @param q An object of class \code{SOQuestion}
#'
#' @return results and errors, invisibly
#' @export
#'
#' @examples
#' q <- get_question(54028838)
#' run_code(q)
run_code <- function(q){
  UseMethod("run_code")
}

#' @export
run_code.SOQuestion <- function(q){
  res <- purrr::map(q$code, purrr::safely(eval), envir = .GlobalEnv)
  for (i in seq_along(res)){
    res[[i]]$call <- q$code[[i]]
  }
  res <- res %>% purrr::map(purrr::compact)
  invisible(res)
}
