# GettingAndCleanDataAssignment
assignment of Getting and Cleaning Data github project

In the assignment, I need create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Input: Data collected from the accelerometers from the Samsung Galaxy S.

Step 1 : Read the train and test data from txt file and merge them. 
Step 2 : Only extract the measurements on the mean and standard deviation for each measurement from 561 columns. (Use mean() and std() as the key word to filter)
Step 3 : Set the Activity name column according to its index according to the activity discription file.
Step 4: Merge all the data together to generage a dataset which has 68 variables (all mean and std measurements , activity and subject)
Step 5: Rename all the columns.
Step 6 : Generage a new factor column names ActivitySubject to mark the class using combination of these two values. 
Step 7: Generage another data set called dataset2 which has only two columns of activity and subject valued according to the levels of ActivitySubject.
Step 7 : Calculate mean value of every variable by ActivitySubject using tapply and add them to dataset2.
Step 8 : Rename columns in dataset2
Step 9 : Write dataset2 into a txt file.

