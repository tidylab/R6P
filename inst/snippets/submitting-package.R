devtools::check(remote = TRUE, manual = TRUE)

rhub::check_for_cran()

devtools::check_win_devel()

devtools::build_manual()

devtools::spell_check()

utils::maintainer(pkgload::pkg_name())
