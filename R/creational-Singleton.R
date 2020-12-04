#' @title Singleton Pattern
#' @description Ensure a class only has one instance, and provide a global point
#'   of access to it.
#' @references \href{Wikipedia}{https://en.wikipedia.org/wiki/Singleton_pattern}
#' @family creational design patterns
#' @export
Singleton <- R6::R6Class("Singleton", public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        classname  <- gsub("\\$new\\(.*\\)", "", deparse(sys.calls()[[sys.nframe()-1]]))

        if(is.null(private$instance)){
            command <- paste0(classname, "$set('private', 'instance', self, overwrite = TRUE)")
            eval(parse(text = command))
            private$instance <- self
        } else {
            self <- private$instance
        }
    }
), private = list(
    instance = NULL
))
