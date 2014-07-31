source("rankhospital.R")

rankhospital("TX", "heart failure", 4)
#Expect: [1] "DETAR HOSPITAL NAVARRO"


rankhospital("MD", "heart attack", "worst")
#Expect: [1] "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)
#Expect: [1] NA
