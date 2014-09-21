Repo to answer the 'GettingAndCleaningData' Assignement from Coursera
=====================================================================


Information on run_analysis.R 
-----------------------------

1. The first part concentrates on uploading the different raw dataset into 6 different data frames:
  - subject_test is the data frame created from 'subject_test.txt' which represents the subject who performes the activity and is assigned to the test group
  - xtest is the data frame created from 'x_text.txt' which represents the Test set
  - ytest is the data frame created from 'y_test.txt' which represents the Test labels
  - subject_train is the data frame created from 'subject_train.txt' which represents the subject who performes the activity and is assigned to the training group
  - xtrain is the data frame created from 'x_train.txt' which represents the Training set
  - ytrain is the data frame created from 'y_train.txt which represents the Training labels
 
For more information on the different datasets, please open README.text in the UCI HAR Dataset folder.

In order to do that the 'getdata-projectfiles-UCI HAR Dataset.zip' file should be uploaded
in the working directory.

2. Assignment of the label to the column names of the different objects. 
  - For the two subject_* data frames the label "subject" is added to their only columns. (* = test or train) 
  - For the two y* data frames the label "activity" is added to their only columns
  - For the two x* data frames it is a little more complicated:
        First, the 'features.txt' raw data is uploaded into featurestest object. The 'features.txt' represents the list of all the features corresponding to the columns of the x* data frames. It is important here to make sure the stringsAsFactors is set to FALSE to make sure that the data fram is a character vector vector and not a factor.
        Then replace the names of the two x* by featurestest
        
3. Merge the different data frames. 
  - Before merging the train (subject_train, ytrain, ytrain) and test (subject_test, ytest, xtest) together through their columns, two character vector are created (colTrain, colTrain) are created with either a repetition of the string "train" or "test", respectively to make a new variable 'repartition' which represents the set in which the subject was assigned (training or test)
  - The merging is done by column binding col*, subject_*, y* and x* together. The two data frames obtained are called train and test.
  - The final merged data is obtained by row binding the previous two test and train data frames.
  
4. The next part is focused on extracting all the data that represent a mean or a standard deviation of one of the measurments.
After looking at features_info.txt, it is assumed that only the features with labels containg mean() or std() qualifies.
In order to select the columns which contain mean() or std(), the grep function is used.
        - First two vectors, featureMean and featureStd are created, They are formed of the indexes of the column of data where the label contains either the string of character "mean()" or "std()", respectively.
        - 3 is added to the indexes in the previous two vectors (to account for three columns added in data when merging in the previous part) before inputing them into data to create dataMean and dataStd. Those two vectors contain all the observation of the data frame, data, where the mean value or the standard deviation is measured, respectively.
        - Finally, data is rewritten as the previous data first 3 columns (which are repartition, subject and activity) followed by all the observations of data which are mean value and closed by all the observations of data which are std dev.
        
5. Replace activity numerical categories by explicit activity.
The table to corolate the activity class labels with their activity name is given by 'activity_labels.txt' in the raw dataset.
Data is subsetted depending on the activity class label which is replaced by its name.

6. Part 4 of the assignement was fulfilled when labeling the columns of xtest and xtrain in part 2

7. Finally, the tidy dataset, tidyData, is obtianed by applying the ddply to data with activity and subject as variables to split the data frame and numcolwise applied to mean as the function to apply to each piece.

The tidydata data frame is saved and exported to the file tidyData.txt in the working directory using the write.table function with row.name set to FALSE.