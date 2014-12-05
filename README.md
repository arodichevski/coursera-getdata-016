coursera-getdata-016
====================

Coursera Getting and Cleaning Data Course Project

This is the exercise of Getting and Cleaning Data Course Project
(see https://class.coursera.org/getdata-016/human_grading/view/courses/973758/assessments/3/submissions)

###Input: datafiles in the UCI HAR Dataset directory
###Output: uci_har_avg.txt - the averages for each activity and each subject (see data frame avg.df)

The program
===========
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Writes the data set of the previous point using write.table().

Code book
=========

###widths
Vector of widths of columns to read and not to read from the input files X_*.txt.

###df
Data frame of the input measured data.
Every subject and activity have many rows corresponding to time series of measurements.
The columns are:
* Subject (1 to 30 corresponds to one of 30 person)
* Activity (factors for walking, walking_upstairs, walking_downstairs, sitting, standing, laying)
* Set (train or test)
* Body acceletation X mean
* Body acceletation Y mean
* Body acceletation Z mean
* Body acceletation X std dev
* Body acceletation Y std dev
* Body acceletation Z std dev
* Gravity acceletation X mean
* Gravity acceletation Y mean
* Gravity acceletation Z mean
* Gravity acceletation X std dev
* Gravity acceletation Y std dev
* Gravity acceletation Z std dev
* Jerk acceletation X mean
* Jerk acceletation Y mean
* Jerk acceletation Z mean
* Jerk acceletation X std dev
* Jerk acceletation Y std dev
* Jerk acceletation Z std dev
* Gyroscope X mean
* Gyroscope Y mean
* Gyroscope Z mean
* Gyroscope X std dev
* Gyroscope Y std dev
* Gyroscope Z std dev
* Jerk gyroscope X mean
* Jerk gyroscope Y mean
* Jerk gyroscope Z mean
* Jerk gyroscope X std dev
* Jerk gyroscope Y std dev
* Jerk gyroscope Z std dev
* Body acceletation magnitude mean
* Body acceletation magnitude std dev
* Gravity acceletation magnitude mean
* Gravity acceletation magnitude std dev
* Jerk acceletation magnitude mean
* Jerk acceletation magnitude std dev
* Gyroscope magnitude mean
* Gyroscope magnitude std dev
* Jerk gyroscope magnitude mean
* Jerk gyroscope magnitude std dev
* Body acceletation X mean (fourier)
* Body acceletation Y mean (fourier)
* Body acceletation Z mean (fourier)
* Body acceletation X std dev (fourier)
* Body acceletation Y std dev (fourier)
* Body acceletation Z std dev (fourier)
* Jerk acceletation X mean (fourier)
* Jerk acceletation Y mean (fourier)
* Jerk acceletation Z mean (fourier)
* Jerk acceletation X std dev (fourier)
* Jerk acceletation Y std dev (fourier)
* Jerk acceletation Z std dev (fourier)
* Gyroscope X mean (fourier)
* Gyroscope Y mean (fourier)
* Gyroscope Z mean (fourier)
* Gyroscope X std dev (fourier)
* Gyroscope Y std dev (fourier)
* Gyroscope Z std dev (fourier)
* Body acceletation magnitude mean (fourier)
* Body acceletation magnitude std dev (fourier)
* Jerk acceletation magnitude mean (fourier)
* Jerk acceletation magnitude std dev (fourier)
* Gyroscope magnitude mean (fourier)
* Gyroscope magnitude std dev (fourier)
* Jerk gyroscope magnitude mean (fourier)
* Jerk gyroscope magnitude std dev (fourier)

###avg.df
Average of each measured variable for each activity and each subject.
Every row corresponds to one activity and to one person.
Columns are the same of df data frame, except of Activity which is dropped.
