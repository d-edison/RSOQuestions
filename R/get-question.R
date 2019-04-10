#' Get A Question by ID
#'
#' @param id The ID of the question, which can be found in the URL (default to
#'   the most recent question on the [r] tag on stackoverflow).
#'
#' @return An object of class \code{SOQuestion}
#' @export
#'
#' @examples
#' q <- get_question(54028838)
get_question <- function(id = get_recent_ids()[1]){
  q <- httr::GET(paste0("https://api.stackexchange.com/2.2/questions/",id ,"?&site=stackoverflow&filter=withbody")) %>%
    httr::content() %>%
    purrr::pluck("items", 1, "body")
  code <- stringr::str_sub(
      q,
      stringr::str_locate_all(q, "<pre><code>")[[1]][, 2] + 1,
      stringr::str_locate_all(q, "</code></pre>")[[1]][, 1] - 1
    ) %>%
    stringr::str_replace_all("&amp;", "&") %>%
    stringr::str_replace_all("&lt;", "<") %>%
    stringr::str_replace_all("&gt;", ">") %>%
    purrr::map(
      purrr::possibly(rlang::parse_exprs, rlang::expr(stop("code could not be parsed as an expression")))
    ) %>%
    unlist()
  structure(list(question = q, code = code), class = "SOQuestion")
}

#' @export
print.SOQuestion <- function(q){
  cat(q[[1]])
  invisible(q)
}
