

# Download and unzip the datafile if no exist
if (!file.exists("UCI HAR Dataset")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "getdata-projectfiles-UCI HAR Dataset.zip")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

# Read in and merge data
x_train<-read.table("UCI HAR Dataset/train/x_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
x_test<-read.table("UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
x_merged<-rbind(x_train,x_test)
y_merged<-rbind(y_train,y_test)
subject_merged<-rbind(subject_train,subject_test)

# Extract the mean and std of the data
features<-read.table("UCI HAR Dataset/features.txt")
themean<-sapply(features[,2],function(x) grepl("mean()",x,fixed=TRUE))
thestd<-sapply(features[,2], function(x) grepl("std()", x, fixed=TRUE))
x_meanstd<-x_merged[,(themean | thestd)]
colnames(x_meanstd)<-features[(themean | thestd),2]

# Naming the activities uses descriptive activity
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels<-activity_labels[y_merged[,1],2]
y_merged[,1]<-activity_labels
colnames(y_merged)<-"activity"
colnames(subject_merged)<-"subject"

# Combine to a dataset and get mean of each variable by activity and subject
combined<-cbind(subject_merged,y_merged,x_meanstd)
tidy_dataset<-aggregate(combined[,3:length(combined)], by=list(subject=combined$subject,activity=combined$activity), mean)

# Submit the second tidy dataset
write.table(tidy_dataset,"tidy_dataset.txt",row.names=FALSE)
message("Done!")
