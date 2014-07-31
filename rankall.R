source("rankhospital.R")

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that outcome is valid
    if (!is.element(outcome, c("heart attack", "heart failure", "pneumonia"))) { 
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    df <- data.frame(hospital = character(), state = character())
    
    states <- unique(data$State)
    for (state in states[order(unique(data$State))]) {
        hospital <- rankhospital(state, outcome, num)
        df <- rbind(df, data.frame(hospital = hospital, state = state))
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    df
}
