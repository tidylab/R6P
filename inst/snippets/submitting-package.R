# Lint the package
(report = lintr::lint_package(show_progress = TRUE))
styler::style_pkg(
    filetype = c("R", "Rprofile", "Rmd", "Rmarkdown", "Rnw", "qmd")[c(1,3)],
    exclude_dirs = c("packrat", "renv", ".dev", ".git", ".github", ".Rproj.user", "docs", "inst"),
    include_roxygen_examples = TRUE,
)


devtools::check(remote = TRUE, manual = TRUE)

rhub::check(platform="windows-x86_64-devel", env_vars=c(R_COMPILE_AND_INSTALL_PACKAGES = "always"))
# rhub::rhub_setup()
# rhub::rhub_check(platforms = c("windows", "macos", "linux"), branch = "master")

# devtools::check_win_devel()
devtools::check_win_release()

devtools::build_manual()

devtools::spell_check()

utils::maintainer(pkgload::pkg_name())

# devtools::submit_cran()
