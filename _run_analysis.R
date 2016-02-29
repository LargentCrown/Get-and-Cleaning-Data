## This run_analysis.R script does the following:
## 1. Merges the training and the test to create one data set.
## 2. Extracts only the measurements on the mean & the standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a 2nd, independent tidy data set with the mean for each variable for each activity and each subject.

## Download the complete dataset from the link


## Install if needed and library for performance of this script

library(reshape2)
library(tidyr)
library(data.table)
library(dplyr)

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "Dataset.zip", mode = "wb") 
dateDownloaded = date()
unzip("Dataset.zip", exdir = "UCI HAR Dataset")

## Load activity labels and names for columns
activity.labels = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity_name"))

## Load the dataframe's column names
features = read.table("UCI HAR Dataset/features.txt")
feature.names = features[,2]

## Load test data and label the data frame's columns
test_data = read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test_data) = feature.names

## Load the training data and label the columns
train_data = read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train_data) = feature.names

## Load the id's and of the test subjects and label the dataframe's columns
test.subject.id = read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test.subject.id) = "SubId"

## Load the activity id's of the training data and label the dataframe's columns
train.activity.id = read.table("UCI HAR Dataset/train/y_train.txt")
colnames(train.activity.id) = "Activity_Id"

## Load the the test subjects and label the dataframe's columns 
test.activity.id = read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test.activity.id) = "Activity_Id"

## Load the ids of the test subject and label the dataframe's columns
train.subject.id = read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(train.subject.id) = "SubId"

## Merge all data
test.data = cbind(test.subject.id, test.activity.id, test_data)
train.data = cbind(train.subject.id, train.activity.id, train_data)

## Complete data set is made
data = rbind(test.data, train.data)
write.table(data, "merged_data.txt")

## Extract all other columns to calculate mean() or std() values

mean.col.id = grep("mean", names(data), ignore.case = T)
mean.col.names = names(data)[mean.col.id]
std.col.id = grep("std", names(data), ignore.case = T)
std.col.names = names(data)[std.col.id]
mean.std.data = data[,c("SubId", "Activity_Id", mean.col.names, std.col.names)]
detlnames = merge(activity.labels, mean.std.data, by.x = "activity_id", by.y = "Activity_Id", all = T)
melt.data = melt(detlnames, id = c("activity_id", "activity_name", "SubId"))
data.mean = dcast(melt.data, activity_id + activity_name + SubId ~ variable, mean)
write.table(data.mean, "./tidy.data.txt") 

