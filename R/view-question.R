#' View a Question
#'
#' This function opens up the stackoverflow question in the Viewer pane in
#' RStudio.
#'
#' @param q An object of class \code{SOQuestion}
#'
#' @export
#'
#' @examples
#' q <- get_question(54028838)
#' view_question(q)
view_question <- function(q){
  UseMethod("view_question")
}

#' @export
view_question.SOQuestion <- function(q){
  dir <- tempfile()
  dir.create(dir)
  html_file <- file.path(dir, "file.html")
  write(q[[1]], html_file)
  rstudioapi::viewer(html_file)
}
