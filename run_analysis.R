# File download
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "project.zip")
unzip("project.zip")

library(dplyr)

# Read labels and features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Read test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
feature_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Read train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
feature_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Combine test and train into one data set
subjectdata <- rbind(subject_test, subject_train)
names(subjectdata) <- c("subject")

activitydata <- rbind(activity_test, activity_train)
names(activitydata) <- c("activity")

featuredata <- rbind(feature_test, feature_train)
names(featuredata) <- features$V2

mergedset <- cbind(subjectdata, activitydata, featuredata)

# Extract only measures on mean and standard deviation
features_meanstd <- features$V2[grep("[Mm]ean|std\\(\\)", features$V2)]
selected_features <- c("subject", "activity", as.character(features_meanstd))

selected_data <- subset(mergedset, select=selected_features)

# Name the activities
names(activity_labels) <- c("activity_number", "activity_name")
selected_data$activity <- activity_labels$activity_name[selected_data$activity]

# Label with descriptive variable names
selected_features <- gsub("^t", "Time", selected_features)
selected_features <- gsub("^f", "Frequency", selected_features)
selected_features <- gsub("Acc", "Accelerometer", selected_features)
selected_features <- gsub("Gyro", "Gyroscope", selected_features)
selected_features <- gsub("Mag", "Magnitude", selected_features)
selected_features <- gsub("mean\\(\\)", "Mean", selected_features)
selected_features <- gsub("std\\(\\)", "SD", selected_features)
selected_features <- gsub("meanFreq\\(\\)", "MeanFrequency", selected_features)
selected_features <- gsub("tB", "TimeB", selected_features)

names(selected_data) <- selected_features

# Create tidy data set with the average of each
# variable for each activity and each subject.
tidyData <- selected_data %>% group_by(subject, activity) %>%
     summarise_all(mean)

write.table(tidyData, file = "tidyData.txt", row.names = FALSE)