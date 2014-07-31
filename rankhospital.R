rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    for(i in c(11, 17, 23)) {
        data[, i] <- suppressWarnings(as.numeric(data[, i]))
    }
    
    ## Check that state and outcome are valid
    if (!is.element(state, unique(data$State))) {
        stop("invalid state")
    }
    if (!is.element(outcome, c("heart attack", "heart failure", "pneumonia"))) { 
        stop("invalid outcome")
    }
    
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    # map outcome to column number in data
    col <- switch(outcome,
                  "heart attack"=11,
                  "heart failure"=17,
                  "pneumonia"=23)
    # get subset base on specific state
    statedata <- subset(data, data[,7]==state)
    # remove missing value
    statedata <- na.omit(statedata)
    # sort data base on column outcome.
    statedata <- statedata[order(statedata[,col], statedata[,2]),]
    
    # return hospital name
    if (num == "best") {
        num <- 1
    } else if (num == "worst") {
        num <- nrow(statedata)
    }
    hospital <- statedata[num,2]
    hospital

}
