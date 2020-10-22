#! /usr/local/bin/Rscript

# Functions for rounding data values

good_round <- function(x, digits = 2, pval = FALSE){
    # just use round otherwise
    stopifnot(digits > 1)
    stopifnot(length(digits) == 1)
    if(pval){
        stopifnot(x >= 0 & x <= 1)
    }
    tmp <- sprintf(paste0("%.", digits, "f"), x)
    zero <- paste0("0.", paste0(rep("0", digits), collapse = ""))
    tmp[tmp == paste0("-", zero)] <- zero
    return(tmp)
}
