#######################################################################################
#                              CODE USED AT HACKATHON                                 #
#######################################################################################

# read in confusion matrix
confmat <- read.csv('Documents/Columbia/CDSS Hackathon 2016/confusionmatrix.csv')

# clean
confmat <- confmat[order(confmat$Class),]
row.names(confmat) <- confmat$Class
confmat <- confmat[,2:ncol(confmat)]
colnames(confmat) <- str(1:ncol(confmat))
confmat <- apply(confmat, 2, rev)

# make heatmap
conf_matrix <- data.matrix(confmat)
walmart_heatmap <- heatmap(conf_matrix, Rowv=NA, Colv=NA, scale="column", col=heat.colors(10)[-1])

#######################################################################################
#                              NEW CODE FOR d3 HEATMAP                                #
#######################################################################################

# load libraries
library(dplyr)
library(reshape2)

# read in confusion matrix
confmat_10.21 <- read.csv('Documents/Columbia/CDSS Hackathon 2016/confusion_matrix_10.21_3.csv', header=TRUE)

# format column names
new_cols = c('Popular_Product')
for (idx in 2:length(colnames(confmat_10.21))) {
  c <- colnames(confmat_10.21)[idx]
  length <- nchar(c)
  c2 <- substr(c, 2, length)
  new_cols <- append(new_cols, c2)
}
colnames(confmat_10.21) <- new_cols

# melt data for csv formatting
confmat_10.21.m <- melt(confmat_10.21, id='Popular_Product')
colnames(confmat_10.21.m) <- c('Popular_Product', 'Predicted_Product', 'Frequency')

# output csv
write.csv(confmat_10.21.m, 'Documents/Columbia/CDSS Hackathon 2016/conf_matrix_melt_10.21_3.csv')




