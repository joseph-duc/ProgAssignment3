rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    for(i in c(11, 17, 23)) {
        data[, i] <- suppressWarnings(as.numeric(data[, i]))
    }
    
    ## Check that outcome is valid
    if (!is.element(outcome, c("heart attack", "heart failure", "pneumonia"))) { 
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
