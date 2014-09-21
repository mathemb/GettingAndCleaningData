## Goals of run_anlaysis:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.


## PART 1 : Merge the training and the test sets to create one data set

library(plyr)
library(dplyr)
library(tidyr)
library(data.table)

## Read test and training data
subject_test <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE))
xtest <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE))
ytest <- tbl_df(read.table("./UCI HAR Dataset/test/Y_test.txt", stringsAsFactors = FALSE))

subject_train <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE))
xtrain <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE))
ytrain <- tbl_df(read.table("./UCI HAR Dataset/train/Y_train.txt", stringsAsFactors = FALSE))

## Add column names to the datasets before mergin
        ## Add column name to the subject of the volunteer number
names(subject_test) <- "subject"
names(subject_train) <- "subject"
        ## Add column name to the scolumn with the label of the activity
names(ytest) <- "activity"
names(ytrain) <- "activity"
        ## Add column name to the measurments
                ## Open list of all features 
featurestest <- tbl_df(read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE))
names(xtest) <- as.character(featurestest[,2])
names(xtrain) <- as.character(featurestest[,2])

## Merged the training set and add a column saying "train"
colTrain <- rep("train", length = dim(ytrain)[1])
train <- cbind(repartition = colTrain, subject = subject_train, activity = ytrain, xtrain)
train[,1] <- as.character(train[,1])
rm(colTrain)
## Merged the test set and add a column saying "training"
colTest <- rep("test", length = dim(ytest)[1])
test <- cbind(repartition = colTest, subject = subject_test, activity = ytest, xtest)
test[,1] <- as.character(test[,1])
rm(colTest)
## Merge test and train dataset
data <- rbind(test, train)
# ## Remove raw datasets
# rm(subject_train, ytrain, xtrain, subject_test, ytest, xtest)


## PART 2 : Extract only the measurements on the mean and standard deviation for each measurement

## Remove column in data which are not mean or standard deviation measures
        ## Get the indexes for which the feature has mean or std 
        ## in two different vectors 
featureMean <- grep(pattern = "mean()" , x = featurestest[,2], fixed = TRUE)
featureStd <- grep(pattern = "std()" , x = featurestest[,2], fixed = TRUE)
        ## Apply the vector indexes to narrow the dataset to mean and std dev measurments 
dataMean <- data[featureMean + 3] ## +3 to account for three columns added in merging
dataStd <- data[featureStd + 3]
        ## Recreate data by binding the first columns (repartition, subect and activity)
        ## with the two new vectors with measurments only of mean and std dev
data <- cbind(data[,1:3], dataMean, dataStd)
rm(featureMean, featureStd, dataMean, dataStd) ## remove unneeded objects     


## PART 3 : Use descriptive activity names to name the activities in the data set

data$activity[data$activity == 1] <- c("Walking")
data$activity[data$activity == 2] <- c("Walking_Upstairs")
data$activity[data$activity == 3] <- c("Walking_Downstairs")
data$activity[data$activity == 4] <- c("Sitting")
data$activity[data$activity == 5] <- c("Standing")
data$activity[data$activity == 6] <- c("Laying")


## PART 4 : Appropriately labels the data set with descriptive variable names

        ## Already done when naming columns in part 2
names(data) ## Print the labels of the dataset to check that they are correct


## PART 5 : From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

tidyData <- ddply(data, .(activity, subject), numcolwise(mean))

## Write tidyData in working directory as tidyData.txt
write.table(tidyData, file = "./tidyData.txt", row.name = FALSE)

## datatest <- read.table("./tidyData.txt", header = TRUE)
