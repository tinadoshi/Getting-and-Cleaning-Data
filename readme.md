# Getting and Cleaning Data Course Project

This is the readme for the Coursera Getting and Cleaning Data course final project.

## Description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Data for this project is from the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository:

[UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Getting Started

### Prerequisites

This project requires the following packages:

-   dplyr

### Installing

This project can be found at <https://github.com/tinadoshi/Getting-and-Cleaning-Data.git>

### Executing program

-   Download "run_analysis.R" and run script.
-   Output file will include "tidyData.txt" that can be used for future data analysis.

### How the Script Works

1.  The run_analysis.R script calls the dplyr library.
2.  The necessary data files are downloaded and unzipped to the working directory.
3.  The activity labels, features, test, and train data are read.
4.  All of the test and train data are combined into a single merged data set, mergedset.
5.  Only measures of means or standard deviations are extracted from mergedset.
6.  For each activity, the number of the activity is updated with the appropriate label describing the activity.
7.  The label names are replaced with more descriptive variable names.
8.  A tidy data set is created, showing only the average of each variable for each activity for each subject.
9.  The data is exported to a TXT file.

## Author

Tina Doshi

<https://github.com/tinadoshi>
