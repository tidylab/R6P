#' @title Value Object Pattern
#' @includeRmd vignettes/details/ValueObject.Rmd
#' @description Model a domain concept using natural lingo of the domain
#'   experts, such as “Passenger”, “Address”, and “Money”.
#' @param given (`character`) A character vector with the given name.
#' @param family (`character`) A character vector with the family name.
#' @param birthdate (`Date`) A date vector with birth date.
#' @family base design patterns
#' @importFrom lubridate NA_Date_ is.Date
#' @export
#' @examples
#' # See more examples at <https://tidylab.github.io/R6P/articles>
ValueObject <- function(
    given = NA_character_,
    family = NA_character_,
    birthdate = NA_Date_
){
    stopifnot(is.character(given), is.character(family), is.Date(birthdate))
    stopifnot(length(given) == length(family)    | all(is.na(family)))
    stopifnot(length(given) == length(birthdate) | all(is.na(birthdate)))

    tibble::tibble(
        given = given %>% stringr::str_to_title(),
        family = family %>% stringr::str_to_title(),
        birthdate = birthdate
    ) %>% tidyr::drop_na(given)
}


