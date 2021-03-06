# CodeBook
This is a code book that describes the variables, the data, and any transformations or work 
that you performed to clean up the data.

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person
performed six activities which are 1. WALKING, 2.WALKING_UPSTAIRS, 3. WALKING_DOWNSTAIRS, 4.SITTING, 5. STANDING, 6.LAYING while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which
has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz
cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time
and frequency domain.

#The data

The dataset includes the following files:

'README.txt'
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.


The following files are available for the train and test data. Their descriptions are as below:

1. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
 Its range is from 1 to 30.

2. 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis
in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the
'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

3. 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity
from the total acceleration.

4. 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each
window sample. The units are radians/second.

# Raw Data transformation process

The raw data sets are processed with the script run_analysis.R script to create a tidy data set.

1. Merge the training and the test sets to create one data set.
   - Name the column names from the features file in variable featureNames
   - Add activity and subject as a column to features

2. Extracts only the measurements on the mean and standard deviation for each measurement.
   - Adding activity and subject columns
   - Look at the number of variables in completeData
   - Look at the number of variables in extractedData
 
3. Uses descriptive activity names to name the activities in the data set
   - Set the activity variable in the data as a factor

4. Appropriately labels the data set with descriptive variable names.
   - Look at variable names and labeling them.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   - Create tidyData as a set with average for each activity and subject
   - Order tidyData according to subject and activity
   - Write tidyData into a text file by using write.table with row.names = FALSE.


#Result of tidy dataset

The data in tidyData is written into Tidy.txt.

