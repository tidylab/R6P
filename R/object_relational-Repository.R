#' @title Repository Pattern
#' @description Mediates between the domain and data mapping layers using a
#'   collection-like interface for accessing domain objects.
#'   See \insertCite{Fowler2002;textual}{R6P}, p. 322.
#' @param key (`character`) Name of the element.
#' @param value (`?`) Value of the element. Note: The values in the
#'   \code{Repository} are not necessarily of the same type. That depends on the
#'   implementation of \code{AbstractRepository}.
#' @references {\insertAllCited{}}
#' @family object-relational patterns
#' @export
# nocov start
AbstractRepository <- R6::R6Class("Repository", cloneable = FALSE, public = list(
    #' @description Instantiate an object
    initialize = function() exceptions$not_implemented_error(),
    #' @description Add an element to the Repository.
    add = function(key, value) exceptions$not_implemented_error(),
    #' @description Delete an element from the Repository.
    del = function(key) exceptions$not_implemented_error(),
    #' @description Retrieve an element from the Repository.
    get = function(key) exceptions$not_implemented_error()
))
# nocov end

