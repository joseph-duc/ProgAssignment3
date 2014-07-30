source("best.R")

try2 <- function(code, silent = FALSE) {
    tryCatch(code, error = function(c) {
        msg <- conditionMessage(c)
        if (!silent) message(c)
        invisible(structure(msg, class = "try-error"))
    })
}

print("This is test cases for function best + expected output")
best("TX", "heart attack")
# "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome


