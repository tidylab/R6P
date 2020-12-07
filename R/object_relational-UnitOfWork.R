#' @title Unit Of Work Pattern
#' @description \insertCite{Fowler2002;textual}{R6P}, p. 184.
#' @references {
#' \insertAllCited{}
#' }
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
