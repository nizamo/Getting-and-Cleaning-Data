# Peer Review Project- Module 3: Getting and cleaning data
# 
# Create one R script called run_analysis.R that does the following TASKS:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
#
###################################################################################
#Loading libraries
install.packages("data.table")
library(data.table)
library(dplyr)

#Read Supporting Metadata
featureNames <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt", header = FALSE)

#Folder train data: the data is split up into subject, activity and features.
#Read train data
subjectTrain <- read.table("train/subject_train.txt", header = FALSE)
activityTrain <- read.table("train/y_train.txt", header = FALSE)
featuresTrain <- read.table("train/X_train.txt", header = FALSE)

#Read test data
subjectTest <- read.table("test/subject_test.txt", header = FALSE)
activityTest <- read.table("test/y_test.txt", header = FALSE)
featuresTest <- read.table("test/X_test.txt", header = FALSE)

#Task 1 - Merge the training and the test sets to create one data set
subject  <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#Name the column names from the features file in variable featureNames
colnames(features) <- t(featureNames[2])

#Add activity and subject as a column to features
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features,activity,subject)


#Task 2 - Extracts only the measurements on the mean and standard deviation for each measurement
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)

#Adding activity and subject columns
requiredColumns <- c(columnsWithMeanSTD, 562, 563)

#Look at the number of variables in completeData
dim(completeData)
extractedData <- completeData[,requiredColumns]

#Look at the number of variables in extractedData
dim(extractedData)


#Task 3 - Uses descriptive activity names to name the activities in the data set

extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}

#Set the activity variable in the data as a factor
extractedData$Activity <- as.factor(extractedData$Activity)


#Task 4 - Appropriately labels the data set with descriptive variable names. 
#Look at variable names 
names(extractedData)

#Task 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Set the subject variable in the data as a factor

extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)

#Create tidyData as a set with average for each activity and subject
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)

#Order tidyData according to subject and activity
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

#Write tidyData into a text file
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
