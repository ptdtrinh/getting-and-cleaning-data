- Step 1:

Load the "X_train" and "X_test" dataset, the merge them into "allData".
 + Load files text: use the "read.table" function.
 + Merge train and test data: use the "rbind" function. 
 
- Step 2:

Extract mesurements of dataset: use "mean" and "sd" function.
 + Make sure all variables you need to calculate are type "numeric".
 + To calculate the mean and standard deviation, we use the "mean"  and "sd" function.
 + Use the "apply" function to calculate on vectors.
 + Rememeber to choose the parameter is "c(2)" in "apply" function to determine that you want to calculate on just columns.
 
- Step 3:

Name the activities in the dataset.
 + Read all the label from "y_train" & "y_test" then bind it to "allData" (this time: use "cbind" function).
 + Replace values with specific strings as describe in "activity_labels.txt"

- Step 4:

Labels the data set with descriptive variable names:
 + Read the variables' names from "features.txt".
 + Change the names of variables in "allData" by "colnames" function.

- Step 5:

Create tidy_data:
 + Convert label of "allData" to factor type.
 + Use "aggregate" & "mean" function to perform calculation of each variable for each activity in each subject.
 
