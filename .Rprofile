assign(".Rprofile", new.env(), envir = globalenv())

# .First ------------------------------------------------------------------
.First <- function() {
    try(if (testthat::is_testing()) {
        return()
    }, silent = TRUE)
    if (file.exists(".Renviron")) readRenviron(".Renviron")


    # Package Management System
    r_version_date <- gsub(".*\\((\\d{4}-\\d{2}-\\d{2}).*", "\\1", R.Version()$version.string)
    r_package_date <- as.character(read.dcf("DESCRIPTION", "Date"))
    r_cran_date <- ifelse(is.na(r_package_date), r_version_date, r_package_date)
    options(repos = c(CRAN = paste0("https://packagemanager.rstudio.com/cran/", r_cran_date)))

    # Options
    Sys.setenv(`_R_S3_METHOD_REGISTRATION_NOTE_OVERWRITES_` = "false")
}

# .Last -------------------------------------------------------------------
.Last <- function() {
    try(if (testthat::is_testing()) {
        return()
    })
}
