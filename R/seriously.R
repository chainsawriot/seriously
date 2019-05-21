#' @import stringr
#' @importFrom utils install.packages
NULL

#' Correct your previous console command
#'
#' This function guesses how to correct the error from your previous command during interactive usage.
#' Currently it can fix "There is no package called..." error.
#' @param require_pkg boolean, load the newly installed package or not.
#' @return Nothing, use it for the side-effect.
#' @export
seriously <- function(require_pkg = TRUE) {
    error_msg <- names(last.warning)
    if (stringr::str_detect(error_msg, "^there is no package called")) {
        pkg <- stringr::str_replace_all(stringr::str_extract(error_msg, "‘.+"), "[‘’]", "")
        install.packages(pkg)
        if (require_pkg) {
            require(pkg, character.only = TRUE)
        }
    }
}
