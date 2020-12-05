#' @title Repository Pattern
#' @description Mediates between the domain and data mapping layers using a
#'   collection-like interface for accessing domain objects.
#' @references \url{https://martinfowler.com/eaaCatalog/repository.html}
#' @family object-relational patterns
#' @export
AbstractRepository <- R6::R6Class("Repository", cloneable = FALSE, public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        stop()
    }
))

