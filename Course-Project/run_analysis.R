#################################################################################
# Filename: run_analysis.R
# 
# run_analyis.R does the following:
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.



################################################################################

#set up environment
setwd("C:/work/training/Data Science Specialization Coursera/data cleaning/CourseProject/")

# load libraries
library(plyr)

# Download Data file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./Dataset.zip")
list.files()

#Unzip downloaded file
unzip("./Dataset.zip", list = FALSE, overwrite = TRUE) 

# Read Training and Test Dataset
dataFolder <- "./UCI HAR Dataset"

X_train <- read.table(paste(dataFolder,"train/X_train.txt",sep="/"))
X_test <- read.table(paste(dataFolder,"test/X_test.txt",sep="/"))


subject_train <- read.table(paste(dataFolder,"train/subject_train.txt",sep="/"))
subject_test <- read.table(paste(dataFolder,"test/subject_test.txt",sep="/"))

Y_train <- read.table(paste(dataFolder,"train/Y_train.txt",sep="/"))
Y_test <- read.table(paste(dataFolder,"test/Y_test.txt",sep="/"))

# Merge the train and test datasets 
X <- rbind(X_train, X_test)
subject <- rbind(subject_train, subject_test)
Y <- rbind(Y_train, Y_test)

#Assign appropriate feacture name to  the X variables 
feature_name <- read.table(paste(dataFolder,"features.txt",sep="/"))
names(X) <- feature_name$V2

names(subject) <- "SubjectID"
names(Y) <- "Activity"

har <- cbind(subject, Y,X)

# Extract measurements on mean and standard devaition of each measurements

col_MeanAndStd <- c(grep("std", colnames(har)), grep("mean", colnames(har)))
Measurements_MeanAndStd <- har[,c(1,2,col_MeanAndStd)]

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
activities <- read.table(paste(dataFolder,"activity_labels.txt",sep="/")) 
har$Activity <- factor(har$Activity, levels=activities$V1, labels=activities$V2) 

# Prepare tidy dataset with the average of each variable for each activity and each subject
tidyDataset <- ddply(Measurements_MeanAndStd, .(SubjectID, Activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(tidyDataset)[-c(1:2)] <- paste("Average_",colnames(tidyDataset)[-c(1:2)] , sep="") 

# save measurements on the mean and standard deviation
write.csv(Measurements_MeanAndStd,paste("./Output", "Measurements_MeanAndStd.csv" ,sep="/")) 
# save Tidy dataset
write.csv(tidyDataset,paste("./Output", "TidyDataset.csv" ,sep="/")) 

names(Measurements_MeanAndStd)
names(tidyDataset)
