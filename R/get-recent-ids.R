#' Get Recent [R] Question IDs
#'
#' This function grabs the most recent question ids for the [r] tag on
#' stackoverflow. These values can then be passed along to \code{get_question}
#' to retrieve the question that corresponds to the ID.
#'
#' @return An integer vector of length 30
#' @export
#'
#' @examples
#' ids <- get_recent_ids()
get_recent_ids <- function(){
  httr::GET("https://api.stackexchange.com/2.2/questions?order=desc&sort=creation&site=stackoverflow&tagged=r") %>%
    httr::content() %>%
    purrr::pluck("items") %>%
    purrr::map_int("question_id")
}
