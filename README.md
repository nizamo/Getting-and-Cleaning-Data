#Getting-and-Cleaning-Data#

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

#What is required to submit: 
1. a tidy data set as described below.
2. a link to a Github repository with your script for performing the analysis. 
3. a code book that describes the variables, the data, and any transformations or work that have been performed 
to clean up the data called CodeBook.md. 
4. a README.md in the repo with to explains how all of the scripts work and how they are connected.

#The data for the project can be retrieved from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Tasks
We need to create one R script called run_analysis.R that does the following tasks. 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average 
   of each variable for each activity and each subject.

#Steps to work on this course project

1. Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
2. Create a new R script file in RStudio and do the program that will do the TASKS above.Name this file as
   run_analysis.R.
2. Save run_analysis.R in the parent folder of UCI HAR Dataset, then set your R Studio working directory it as your 
   working directory by using setwd()function in RStudio.
3. Run source("run_analysis.R") from RStudio, then it will generate a new file named as tinydata.txt in your 
   working directory.
