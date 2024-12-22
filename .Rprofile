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
    Sys.setenv(`_R_CHECK_SYSTEM_CLOCK_` = 0)
}

# pkgdown -----------------------------------------------------------------
.Rprofile$pkgdown$browse <- function(name){
    if(missing(name)){
        path <- "./docs"
        name <- "index.html"
    } else {
        path <- "./docs/articles"
        name <- match.arg(name, list.files(path, "*.html"))
    }
    try(browseURL(stringr::str_glue('{path}/{name}', path = path, name = name)))
    invisible()
}

.Rprofile$pkgdown$create <- function(){
    path_script <- tempfile("system-", fileext = ".R")
    job_name <- "Rendering Package Website"

    writeLines(c(
        "devtools::document()",
        "rmarkdown::render('README.Rmd', 'md_document')",
        "unlink(usethis::proj_path('docs'), TRUE, TRUE)",
        paste0("try(detach('package:",read.dcf("DESCRIPTION", "Package")[[1]], "', unload = TRUE, force = TRUE))"),
        "pkgdown::build_site(devel = FALSE, lazy = FALSE)"
    ), path_script)

    .Rprofile$utils$run_script(path_script, job_name)
}

.Rprofile$pkgdown$update <- function(){
    path_script <- tempfile("system-", fileext = ".R")
    job_name <- "Rendering Package Website"

    writeLines(c(
        "devtools::document()",
        "rmarkdown::render('README.Rmd', 'md_document')",
        paste0("try(detach('package:",read.dcf("DESCRIPTION", "Package")[[1]], "', unload = TRUE, force = TRUE))"),
        "pkgdown::build_site(devel = TRUE, lazy = TRUE)"
    ), path_script)

    .Rprofile$utils$run_script(path_script, job_name)
}

# Utils -------------------------------------------------------------------
.Rprofile$utils$run_script <- function(path, name){
    withr::with_envvar(
        c(TESTTHAT = "true"),
        rstudioapi::jobRunScript(
            path = path,
            name = name,
            workingDir = ".",
            importEnv = FALSE,
            exportEnv = ""
        ))
    invisible()
}

# .Last -------------------------------------------------------------------
.Last <- function() {
    try(if (testthat::is_testing()) {
        return()
    })
}
