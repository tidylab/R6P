################################################################################
## Example: Data Transfer Object Implementation
################################################################################
pkgload::load_all()


# Implementation ----------------------------------------------------------
DTO <- R6::R6Class(classname = "DTO", inherit = Singleton, public = list(
    con = NULL,
    initialize = function(){
        super$initialize()
        self$establish_connection()
    },
    establish_connection = function(){
        self$con <- DBI::dbConnect(RSQLite::SQLite(), dbname = ":memory:")
        return(self)
    },
    dbSendQuery = function(statement){
        res <- DBI::dbSendQuery(self$con, statement)
        return(res)
    }
))


# Instantiation -----------------------------------------------------------
database_A <- DTO$new()
database_B <- DTO$new()
identical(database_A, database_B)
