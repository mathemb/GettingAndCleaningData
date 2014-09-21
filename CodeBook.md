---
title: "CodeBook"
author: "mathemb"
date: "21 Sep 2014"
output: html_document
---

DESCRIPTION OF THE tidyData.txt VARIABLES OBTAINED AFTER APPLYING run.analysis.R TO THE UCI HAR Dataset
=======================================================================================================

The first 2 variables of tidyData represent the activity and subject, respectively:

- Activity: identifies the activity performed by each subject wearing a smartphone (Samsung Galaxy S II) on the waist. There are six different activities - Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing and Laying.
- Subject: identifies the subject who performed the activity. Its range is from 1 to 30.

The next variables represents the average value of the different measurments obtained. The 'feature_info.txt' explains the different terminology used for the variables. 

 - Columns 3 to 35 represent the mean values of all the mean values of:
tBodyAcc-XYZ           ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions)
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

- Columns 36 to 69 represent the mean values of all the standard deviations of:
tBodyAcc-XYZ          ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions)
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Please refer to 'feature_info.txt' of the raw data set for more information about each variables.
