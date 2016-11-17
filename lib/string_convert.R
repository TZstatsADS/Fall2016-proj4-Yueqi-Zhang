string_convert <- function(lyr) {
  result <- data.frame()
  for (row in 1:(nrow(lyr))) {
    words <- NULL
    for (col in 2:(ncol(lyr)-1)) {
      if (lyr[row,col] != 0) {
        kw <- rep(colnames(lyr)[col],lyr[row,col])
        kw <- paste(kw, collapse=' ')
        words <- paste(words, kw)
      }
    }
    result[row,1] <- words
  }
  return(result)
}
