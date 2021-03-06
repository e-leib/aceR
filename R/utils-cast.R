
#' @importFrom magrittr %>%
#' @keywords internal

to_numeric <- function(x) {
  if (is.numeric(x)) {
    return (x)
  } else if ("correct" %in% unique(x) | "incorrect" %in% unique(x)) { # if it's an accuracy column
    # being more type-strict than plyr::mapvalues, this WILL return numeric every time
    vals = x %>%
      dplyr::na_if("") %>%
      dplyr::recode(correct = 1,
                    incorrect = 0,
                    no_response = NA_real_,
                    .missing = NA_real_)
    return (vals)
  } else { # if it's an RT column
    return(as.numeric(x))
  }
}

#' @keywords internal

to_na <- function (x) {
  return (NA)
}