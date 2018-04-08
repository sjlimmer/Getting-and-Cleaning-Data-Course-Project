## Getting-and-Cleaning-Data-Course-Project

This repo contains the analysis for the final course project of the Coursera class "Getting and Cleaning Data." The intent is to 
analyze data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site
where the data was [obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
[Here are the data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The file run_analysis.R contains all of the analysis code. The steps invloved were:

### Merges the training and the test sets to create one data set.
I have combined the two data sets (test and training), including both the data files (X_test.txt and X_train.txt)
and the labels (y_test.txt and y_train.txt). This was done by using cbind 
to join the data and labels for each set (test and train), then using rbind to join the test and train sets into a single
merged dataframe.

### Extracts only the measurements on the mean and standard deviation for each measurement.

All column names containing the substrings 'mean' or 'std' were subsetted out using grepl. The intent is that the 'mean' coulmns
contain the mean for each measurement and the 'std' columns contain the standard deviation for each measurement..

### Uses descriptive activity names to name the activities in the data set
The activities in this merged data set were given descriptive activity names based on the activity_labels.txt file. This file
was read into a second dataframe, which was then combined with the merged data above, merging on the activity number.

### Appropriately labels the data set with descriptive variable names.
Activity names were taken from the file features.txt. The included code book give a more detailed description of what
each variable means.

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The tidy data set was created by using aggregate to take the mean of each variable for each of the six activity types.
