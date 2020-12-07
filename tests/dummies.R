#' @title Dummy Unit Of Work
#' @keywords internal
#' @noRd
DummyUnitOfWork <- R6::R6Class(classname = "UnitOfWork", inherit = AbstractUnitOfWork, public = list(
    initialize = function(){private$cars <- DummyRepository$new(); invisible(self)},
    enter = function(){NULL; invisible(self)},
    commit = function(){NULL; invisible(self)},
    rollback = function(){NULL; invisible(self)}
), private = list(cars = NULL))

#' @title Dummy Repository
#' @keywords internal
#' @noRd
DummyRepository <- R6::R6Class(classname = "Repository", inherit = AbstractRepository, public = list(
    initialize = function() private$cars <- collections::dict(),
    add = function(key, value){private$cars$set(key, value); return(self)},
    del = function(key){private$cars$remove(key); return(self)},
    get = function(key){return(private$cars$get(key, default = NULL))}
), private = list(cars = NULL))

