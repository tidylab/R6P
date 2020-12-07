#' @title Unit Of Work Pattern
#' @description Maintains a list of objects affected by a business transaction
#'   and coordinates the writing out of changes and the resolution of
#'   concurrency problems. \insertCite{Fowler2002;textual}{R6P}, p. 184.
#' @references {\insertAllCited{}}
#' @family object-relational patterns
#' @export
# nocov start
AbstractUnitOfWork <- R6::R6Class("Repository", inherit = Singleton, cloneable = FALSE, public = list(
    #' @description Instantiate an object
    initialize = function() exceptions$not_implemented_error(),
    #' @description Remove an object
    finalize = function(){self$exit(); invisible(self)},
    #' @description Start keeping track of changes that affect a database.
    enter = function() exceptions$not_implemented_error(),
    #' @description Figure out everything that needs to be done to alter the
    #'   database as a result of your work.
    exit = function() self$rollback(),
    #' @description Register the object with the Unit of Work for changes.
    commit = function() exceptions$not_implemented_error(),
    #' @description Clear changes.
    rollback = function() exceptions$not_implemented_error()
))
# nocov end
