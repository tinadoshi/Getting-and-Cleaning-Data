# **Codebook**

Data for this project is from the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository:

## [UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones){style="font-size: 11pt;"}

## **Source Data**

-   activity_labels: describes activity associated with each activity number

-   features: label of each test feature

-   subject_test and subject_train: ID of subject for test and train data sets, respectively

-   feature_test and feature_train: measurement for each test feature for test and train data sets, respectively (from "X_test.txt" and "X_train.txt")

-   activity_test and activity_train : activity for each measurement for test and train data sets, respectively (from "y_test.txt" and "y_train.txt")

## **Merged Data**

-   subjectdata: merges subject_test and subject_train

-   featuredata: merges feature_test and feature_train

-   activitydata: merges activity_test and activity_train : activity for each measurement for test and train data sets, respectively (from "y_test.txt" and "y_train.txt")

-   mergedset: combines all data, with columns for subject, activity, and the measurement for each test feature

## **Selected Data**

-   features_meanstd: list of only tests containing mean or standard deviation

-   selected_features: list of columns for selected_data (i.e., subject, activity, and features_meanstd)

-   selected_data: subset of data containing only subject, activity, and measurements with mean or standard deviation

## **Output Data**

-   tidyData: tidy data set containing averages of mean and std for each subject for each activity
