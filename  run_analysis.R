if(!file.exists('data.zip')) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                  'data.zip')
    downldTime <- Sys.time()
    unzip('data.zip')
}

testData <- read.table('UCI HAR Dataset/test/X_test.txt')
testLabs <- read.table('UCI HAR Dataset/test/y_test.txt')
trainData <- read.table('UCI HAR Dataset/train/X_train.txt')
trainLabs <- read.table('UCI HAR Dataset/train/y_train.txt')
dataName <- read.table('UCI HAR Dataset/features.txt')

# Merges the training and the test sets to create one data set.
mergedData <- rbind(cbind(trainData, trainLabs), cbind(testData, testLabs))

# Appropriately labels the data set with descriptive variable names. 
colnames(mergedData) <- make.names(dataName$V2)
names(mergedData) <- gsub( ".",  "", names(mergedData), fixed = TRUE)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
colnames(mergedData)[562] <- 'ActivityNumber'
mergedData <- mergedData[, grepl('mean|std|ActivityNumber', names(mergedData))]

# Uses descriptive activity names to name the activities in the data set.
activities <- read.table('UCI HAR Dataset/activity_labels.txt')
colnames(activities) <- c('ActivityNumber', 'DescriptiveActivity')
mergedData <- merge(activities, mergedData, by='ActivityNumber')

# From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

tidyData <- aggregate(mergedData[ , 3:81], list(mergedData$DescriptiveActivity), mean)

write.table(tidyData, 'TidyData.txt', row.name=FALSE) 
