.onAttach <- function(lib, pkg,...){#nocov start
    options(
        usethis.quiet = TRUE
    )

    if(interactive()) packageStartupMessage(
        paste(
            "\n\033[44m\033[37m",
            "\nWelcome to R6P",
            "\nMore information, vignettes, and guides are available on the R6P project website:",
            "\nhttps://tidylab.github.io/R6P/",
            "\n\033[39m\033[49m",
            sep="")
    )
}#nocov end
