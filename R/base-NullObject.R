#' @title Null Object Pattern
#'
#' @description Model a domain concept using natural lingo of the domain
#'   experts, such as "Passenger", "Address", and "Money".
#'
#' @details
#' ```{r child = "vignettes/details/NullObject.Rmd"}
#' ````
#'
#' @family base design patterns
#' @export
#' @examples
#' # See more examples at <https://tidylab.github.io/R6P/articles>
#'
#' colnames(NullObject())
#' nrow(NullObject())
NullObject <- function() tibble::tibble(given = NA_character_, family = NA_character_)[0,]


