give.n1 <- function(x){
  return(c(y = median(x)+100, label = length(x)))
}

give.n2 <- function(x){
  return(c(y = mean(fivenum(x)[3:4]), label = length(x)))
}