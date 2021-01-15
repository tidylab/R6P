#' @title Dummy Repository
#' @keywords internal
#' @noRd
DummyRepository <- R6::R6Class(classname = "Repository", inherit = AbstractRepository, public = list(
    initialize = function() private$cars <- collections::dict(),
    add = function(key, value){private$cars$set(key, value); return(self)},
    del = function(key){private$cars$remove(key); return(self)},
    get = function(key){return(private$cars$get(key, default = NULL))}
), private = list(cars = NULL))

