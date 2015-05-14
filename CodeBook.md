---
title: "CodeBook"
author: "Yonggang Jing"
date: "Thursday, May 14, 2015"
output: html_document
---


## Run

    Main file: run_analysis.R

* downloads the data file into working dir

* merges the training and test sets

* replaces activity values in the dataset with descriptive activity names

* extracts only the measurements on the mean and standard deviation for each measurement

* appropriately labels the columns with descriptive names

* creates a second, independent tidy dataset with an average of each variable for each each activity and each subject


## Dataset


The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Output


The final tidy dataset submitted is in the working dir:

tidy_dataset.txt

Read dataset in R. There are 180 obs. of 68 variables:

tidy_dataset <- read.table("tidy_dataset.txt",header=TRUE)
