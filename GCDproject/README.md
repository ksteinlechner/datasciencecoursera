##Notes for run_analysis.R

This is the final submission of the project work for Getting and Cleaning Data, part of the Data Science track on Coursera.
The project instructions given were as follows;


###You should create one R script called run_analysis.R that does the following. 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is interpreted as follows;

*For each of 30 subjects, the mean of each selected variable is calculated
*For each of 6 activities, the mean of each selected variable is calculated

The code first imports the subject, activity and variable labels and tidies activity labels.  Variable labels are not tidied
because their naming convention clearly identifies each variable as described in "features.txt".

The data is imported and combined into a single file named "combineddata".

Subject and activity labels from both the train and test datasets are combined into a 10,299 by 2 data frame named "combinelabels" and the numeric activity labels are replaced with activity names.

Data is subsetted by searching on the strings"mean()" and "std()" in the variable names in data frame "features".
This extracts 66 columns to which are added the variable names.

The data frame containing subject and activity labels is attached to the subsetted data.

The required mean values are calculated, first for subjects, then activities with the result output to data frame "meanvalues".

Finally the labels are tidied and the data frame written to "meanvalues.csv".
