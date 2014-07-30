best <- function(state, outcome) {
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    col <- switch(outcome,
                  "heart attack"=11, "heart failure"=17, "pneumonia"=23)
    
    statedata <- subset(data, data[,7]==state)
    #     statedata[, col] <- as.numeric(statedata[, col])
    statedata <- na.omit(statedata)
    min_val <- min(statedata[,col])
    hospitals <- statedata[statedata[,col]==min_val,][,2]

    hospitals
    
}
