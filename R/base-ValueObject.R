#' @title Value Object Pattern
#'
#' @description Model a domain concept using natural lingo of the domain
#'   experts, such as "Passenger", "Address", and "Money".
#'
#' @param given (`character`) A character vector with the given name.
#' @param family (`character`) A character vector with the family name.
#'
#' @details
#' ```{r child = "vignettes/details/ValueObject.Rmd"}
#' ````
#'
#' @family base design patterns
#' @export
#' @examples
#' # See more examples at <https://tidylab.github.io/R6P/articles>
#'
#' # In this example we are appointing elected officials to random ministries, just
#' # like in real-life.
#' Person <- ValueObject
#' Person()
#'
#' # Create a test for objects of type Person
#' # * Extract the column names of Person by using its Null Object (returned by Person())
#' # * Check that the input argument has all the columns that a Person has
#' is.Person <- function(x) all(colnames(x) %in% colnames(Person()))
#'
#' # A 'Minister' is a 'Person' with a ministry title. We capture that information
#' # in a new Value Object named 'Minister'.
#
#' # The Minister constructor requires two inputs:
#' # 1. (`Person`) Members of parliament
#' # 2. (`character`) Ministry titles
#' Minister <- function(member = Person(), title = NA_character_){
#'     stopifnot(is.Person(member), is.character(title))
#'     stopifnot(nrow(member) == length(title) | all(is.na(title)))
#'
#'     member %>% dplyr::mutate(title = title)
#'}
#'
#' # Given one or more parliament members
#' # When appoint_random_ministries is called
#' # Then the parliament members are appointed to an office.
#' appoint_random_ministries <- function(member = Person()){
#'     positions <- c(
#'         "Arts, Culture and Heritage", "Finance", "Corrections",
#'         "Racing", "Sport and Recreation", "Housing", "Energy and Resources",
#'         "Education", "Public Service", "Disability Issues", "Environment",
#'         "Justice", "Immigration", "Defence", "Internal Affairs", "Transport"
#'     )
#'
#'    Minister(member = member, title = sample(positions, size = nrow(member)))
#' }
#'
#' # Listing New Zealand elected officials in 2020, we instantiate a Person Object,
#' # appoint them to random offices and return a Member value object.
#' set.seed(2020)
#'
#' parliament_members <- Person(
#'     given = c("Jacinda", "Grant",     "Kelvin", "Megan", "Chris",   "Carmel"),
#'     family = c("Ardern", "Robertson", "Davis",  "Woods", "Hipkins", "Sepuloni")
#' )
#'
#' parliament_members
#'
#' appoint_random_ministries(member = parliament_members)
ValueObject <- function(
    given = NA_character_,
    family = NA_character_
){
    stopifnot(is.character(given), is.character(family))
    stopifnot(length(given) == length(family)    | all(is.na(family)))

    tibble::tibble(
        given = given %>% stringr::str_to_title(),
        family = family %>% stringr::str_to_title()
    ) %>% tidyr::drop_na(given)
}


