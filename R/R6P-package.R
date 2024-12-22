#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

# Missing Packages Workaround
.workaround <- function() {
  R6::R6Class
  collections::queue
  dplyr::.data
}
