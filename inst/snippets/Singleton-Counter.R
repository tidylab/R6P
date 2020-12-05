################################################################################
## Example: A Counter Implementation
################################################################################
pkgload::load_all()


# Implementation ----------------------------------------------------------
SingletonCounter <- R6::R6Class(inherit = Singleton, public = list(
    count = 0,
    add_1 = function(){self$count = self$count + 1; invisible(self)}
))

NonSingletonCounter <- R6::R6Class(public = list(
    count = 0,
    add_1 = function(){self$count = self$count + 1; invisible(self)}
))


# Instantiation -----------------------------------------------------------
## SingletonCounter
counter <- SingletonCounter$new()
counter$count
counter$add_1()$count


retrieved_conter <- SingletonCounter$new()
retrieved_conter$count

## NonSingletonCounter

counter <- NonSingletonCounter$new()
counter$count
counter$add_1()$count


retrieved_conter <- NonSingletonCounter$new()
retrieved_conter$count
