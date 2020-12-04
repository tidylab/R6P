#' @title Singleton Pattern
#' @description Ensure a class only has one instance, and provide a global point
#'   of access to it.
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
#' @references \href{Wikipedia}{https://en.wikipedia.org/wiki/Singleton_pattern}
#' @family creational design patterns
#' @export
Singleton <- R6::R6Class("Singleton", public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        if(is.null(private$instance)){
            Singleton$set("private", "instance", self, overwrite = TRUE)
            private$instance <- self
        } else {
            self <- private$instance
        }
    }
), private = list(
    instance = NULL
))
