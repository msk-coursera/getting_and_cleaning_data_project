if (!require("data.table")) install.packages("data.table")
if (!require("reshape2"))   install.packages("reshape2")

require("data.table")
require("reshape2")

# Loading metadata
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("UCI HAR Dataset/features.txt")[,2]
# Extract only the measurements on the mean and standard deviation for each measurement.
extracted_features <- grepl("mean|std", features)

get_data <- function(type){
  subject_file <- paste("UCI HAR Dataset/",type,"/subject_",type,".txt", sep = "")
  X_file <- paste("UCI HAR Dataset/",type,"/X_",type,".txt", sep = "")
  Y_file <- paste("UCI HAR Dataset/",type,"/y_",type,".txt", sep = "")
  
  subjects <- read.table(subject_file, col.names = "Subject")
  
  X <- read.table(X_file, col.names = features)
  X <- X[,extracted_features]
  
  Y <- read.table(Y_file, col.names = "Activity_ID")
  Y$Activity_Label <- activity_labels[Y$Activity_ID]

  cbind(as.data.table(subjects), Y, X)
}

# 1. Merge test and train data
data <- rbind(get_data("test"), get_data("train"))

ids <- c("Subject", "Activity_ID", "Activity_Label")
data <- melt(data, id = ids, measure.vars = setdiff(colnames(data), ids))

# Apply mean function to dataset using dcast function
data <- dcast(data, Subject + Activity_Label ~ variable, mean)
write.table(data, file = "tidy_data.txt", row.name=FALSE)