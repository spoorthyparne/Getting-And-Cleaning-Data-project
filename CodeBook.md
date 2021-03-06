#Code Book

###Variables
* activity_labels: contains data from "activity_labels.txt"
* features: contains data from "features.txt"
* xtrain: contains data from "train/X_train.txt"
* ytrain: contains data from "train/y_train.txt"
* xtest: contains data from "test/X_test.txt"
* ytest: contains data from "test/Y_test.txt"
* subject_train: contains data from "train/subject_train.txt"
* subject_test: contains data from "test/subject_test.txt"

###Data Transformation
1.Read data from the files and assign appropriate column names
The data is read from the raw files is read.table and the column names are assigned using colnames function.

2.Merge the training and the test sets to create one data set.
Merged data set is created by merging test data (xtest,ytest) , training data (xtrain, ytrain), subject ids(subject_train, subject_test). The merged data is assigned to the variable "final_merged_data".

3.Subset the data
Subset of the data is generated by extracting activityID, subjectID, mean and standard deviation measurements from the merged data and assigned to the variable "subset_data".

4.Populate activity name
The subset is merged with activity_labels on activity ID to populate the activity names.

5.Assign appropriate names to the columns
The column names are renamed and made more meaningful.
Ex: 't' in the measurement denotes time, 'f' means frequency so they are renamed accordingly.

6.Calculate average of each variable for each activity and each subject.
Using ddply() from plyr library the mean of the measurements is calculated for each activity and subject.