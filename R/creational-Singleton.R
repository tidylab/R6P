#' @title Singleton Pattern
#' @description Restricts the instantiation of a class to one "single" instance.
#'   Singleton takes the control of object creation out of the hands of the
#'   programmer. If the object doesn't exist, then Singleton instantiate an
#'   object. Else, Singleton retrieves the existing object instance.
#' @examples
#' # Example: A Counter Implementation
#' Counter <- R6::R6Class(inherit = Singleton, public = list(
#'     count = 0,
#'     add_1 = function(){self$count = self$count + 1; invisible(self)}
#' ))
#'
#' counter <- Counter$new()
#' counter$count
#' counter$add_1()$count
#' counter$add_1()$count
#'
#' retrieved_conter <- Counter$new()
#' retrieved_conter$count
#'
#' rm(retrieved_conter)
#' @family software design patterns
#' @export
Singleton <- R6::R6Class("Singleton", public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        private$name <- gsub("\\$new\\(.*\\)", "", deparse(sys.calls()[[sys.nframe()-1]]))
        if(!private$exists()) private$set()
    },
    #' @description Remove an object
    finalize = function() while(private$exists()) private$del()
), private = list(
    name = NULL,
    exists = function() private$name %in% search(),
    del = function() eval(parse(
        text = paste0("detach('", private$name, "', unload = TRUE, force = TRUE, character.only = TRUE)")
    )),
    set = function() eval(parse(
        text = paste0("attach(new.env(), name = '", private$name, "', warn.conflicts = FALSE)")
    ))
))
#nocov end
