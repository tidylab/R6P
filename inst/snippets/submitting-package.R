withr::with_envvar(list(
    "_R_CHECK_CRAN_INCOMING_" = "false",
    "_R_CHECK_CRAN_INCOMING_REMOTE_" = "false"
), devtools::check(remote = TRUE, manual = TRUE))

devtools::check_win_devel()

devtools::build_manual()

utils::maintainer(pkgload::pkg_name())
