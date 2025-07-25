# WARNING - Generated by {fusen} from dev/flat_packages_management.Rmd: do not edit by hand # nolint: line_length_linter.


#' Install package if needed and load
#' 
#' Install all the non installed packages from a vector of package names
#' and load them all.
#' 
#' @param pkgs character vector of the names of packages whose current versions should be downloaded from the repositories.
#' @importFrom utils install.packages installed.packages
#' @return invisible NULL.
#'
#' @export
#'
#' @examples
#' install_packages_if_needed_and_load(c("rlang", "lobstr"))
install_packages_if_needed_and_load <- function(pkgs) {
  
  if (!(inherits(pkgs, "character"))) stop("this is not a character vector")
  install_packages_not_installed(pkgs)
  load_packages(pkgs)
  
}


#' Install packages not installed if needed
#'
#' Install all the packages which are not installed.
#' 
#' @param pkgs character vector of the names of packages whose current versions should be downloaded from the repositories.
#' @return nothing
#' 
#' @noRd
#' @keywords internal
install_packages_not_installed <- function(pkgs) {
  
  pkgs_not_installed <- 
    pkgs[!(pkgs %in% rownames(installed.packages()))]
  install.packages(pkgs_not_installed,
                   repos = "https://mirror.ibcp.fr/pub/CRAN/")

}

#' Load packages
#' 
#' Load all the packages
#' @param pkgs character vector of the names of packages whose current versions should be downloaded from the repositories.
#' 
#' @return nothing
#' @noRd
#' @keywords internal
load_packages <- function(pkgs) {

  invisible(lapply(pkgs, FUN = library, character.only = TRUE))

}
