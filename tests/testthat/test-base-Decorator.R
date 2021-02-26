# time_tk -----------------------------------------------------------------
time_tk <- function(func){
    wrapper <- function(...){
        start_time <- Sys.time()
        output <- withVisible(func(...))
        end_time <- Sys.time()

        print(difftime(end_time, start_time))
        ifelse(output$visible, return(output$value), return(invisible(output$value)))
    }

    return(wrapper)
}


test_that("decorating a function with time_tk extends another function abilities", {
    expect_silent(Sys.sleep(0.01))
    expect_type(Sys.sleep <- time_tk(base::Sys.sleep), "closure")
    expect_output(Sys.sleep(0.01), "Time difference of")
})


# -------------------------------------------------------------------------


