#' @title Unit Of Work Pattern
#' @description Mediates between the domain and data mapping layers using a
#'   collection-like interface for accessing domain objects.
#' @references \url{https://martinfowler.com/eaaCatalog/repository.html}
#' @family object-relational patterns
#' @export
# nocov start
AbstractUnitOfWork <- R6::R6Class("Repository", inherit = Singleton, cloneable = FALSE, public = list(
    #' @description Instantiate an object
    initialize = function() exceptions$not_implemented_error(),
    #' @description Remove an object
    finalize = function(){self$exit(); invisible(self)},
    enter = function() exceptions$not_implemented_error(),
    exit = function() self$rollback(),
    commit = function() exceptions$not_implemented_error(),
    rollback = function() exceptions$not_implemented_error()
))
# nocov end
