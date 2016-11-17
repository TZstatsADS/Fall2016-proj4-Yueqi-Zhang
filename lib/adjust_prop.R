### Scan each label and recalculate ###
### associated propbablity with every ###
### single word ###

adjust_prob <- function(lyr, label, num_words = 5000) {
        new_lyr <- lyr[-237,]
        df <- cbind(label, new_lyr)
        result <- data.frame(matrix(seq(20), nrow = max(as.numeric(label)), ncol = num_words))
        for (lb in 1:max(as.numeric(label))) {
                holder <- subset(df, df[,1] == lb)
                holder <- colSums(holder[,3:5002])
                tot <- sum(holder)
                prop <- holder / tot
                result[lb,] <- prop
        }
        result <- t(result)
        result <- cbind(colnames(new_lyr)[2:5001], result)
        result <- result[-c(1,2,5:29),]
        return(result)
}
