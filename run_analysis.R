#1. Merges the training and the test sets to create one data set.
#read the data sets
activity_labels = read.table("activity_labels.txt", header = FALSE)
features = read.table("features.txt", header = FALSE)
xtrain = read.table("train/X_train.txt", header = FALSE)
ytrain = read.table("train/y_train.txt", header = FALSE)
xtest = read.table("test/X_test.txt", header = FALSE)
ytest = read.table("test/Y_test.txt", header = FALSE)
subject_train = read.table("train/subject_train.txt", header = FALSE)
subject_test = read.table("test/subject_test.txt", header = FALSE)

#assign column names to the data set
colnames(activity_labels) = c("activityID", "activity_name")
colnames(features) = c("feature")
colnames(xtrain) = features[,2]
colnames(ytrain) = c("activityID")
colnames(xtest) = features[,2]
colnames(ytest) = c("activityID")
colnames(subject_train) = c("subjectID")
colnames(subject_test) = c("subjectID")

#merge the data sets into one

merge_train = cbind(ytrain,xtrain,subject_train)
merge_test = cbind(ytest, xtest,subject_test)
final_merged_data = rbind(merge_test,merge_train)


#2.Extracts only the measurements on the mean and standard deviation for each measurement.
subset_data = final_merged_data[,grepl( "activityID|mean|std|subjectID" , names( final_merged_data ) )]

#3.Uses descriptive activity names to name the activities in the data set
populate_activity_name = merge(subset_data,activity_labels,by.x = "activityID", by.y = "activityID")

#4.Appropriately labels the data set with descriptive variable names.
colnames(populate_activity_name)<-gsub("^t", "time", colnames(populate_activity_name))
colnames(populate_activity_name)<-gsub("^f", "frequency", colnames(populate_activity_name))
colnames(populate_activity_name)<-gsub("Acc", "Accelerometer", colnames(populate_activity_name))
colnames(populate_activity_name)<-gsub("Gyro", "Gyroscope", colnames(populate_activity_name))
colnames(populate_activity_name)<-gsub("Mag", "Magnitude", colnames(populate_activity_name))
colnames(populate_activity_name)<-gsub("BodyBody", "Body", colnames(populate_activity_name))
#colnames(populate_activity_name)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
populate_activity_name = populate_activity_name[,1:81]
tidyData = ddply(populate_activity_name, c("activityID","subjectID"), numcolwise(mean))
write.table(tidyData, file="tidyData.txt")

