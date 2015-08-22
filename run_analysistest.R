# Peer Review Project- Module 3: Getting and cleaning data
# 
# Create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
#
########################################################################################
# TASKS
# 1. Merges the training and the test sets to create one data set.

x1 <- read.table("train/X_train.txt")
x2 <- read.table("test/X_test.txt")
X  <- rbind(x1, x2)

y1 <- read.table("train/y_train.txt")
y2 <- read.table("test/y_test.txt")
Y  <- rbind(y1, y2)

z1 <- read.table("train/subject_train.txt")
z2 <- read.table("test/subject_test.txt")
Z  <- rbind(z1, z2)


# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement.

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(Z) <- "subject"
cleaned <- cbind(Z, Y, X)
write.table(cleaned, "merged_clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for 
# each activity and each subject.

uniqueSubjects = unique(Z)[,1]
numSubjects = length(unique(Z)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (Z in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[Z]
        result[row, 2] = activities[a, 2]
        tmp <- cleaned[cleaned$subject==Z & cleaned$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "tidydata.txt")
