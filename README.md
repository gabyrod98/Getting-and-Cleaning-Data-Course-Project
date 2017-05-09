
# Getting-and-Cleaning-Data-Course-Project

This repository includes all the asked items for the Getting and Cleaning Data course 

Let me explain what I did with all the files we had in this assignment

1.- The first part  of this program reads 8 files from files installed in the working directory and are stored.
2.-  We put files together. Using “rbind” we put together all the information from
train and test files. X_train and X_test are now together (this data frame includes all the information from the sensosrs. Then we put together subject_train with subject_test (this vector has the information of the subjects, total_subjects).
3.- A vector that has the labels for the sensor’s data is created with data from the activity_labels.txt file
4.- Since we only need columns with means and standard deviations, we select from the fused data from the sensors
(total_data) everything that contains “Mean”, “mean” or “std“ from the labels' file from the previous step.
5.- A new data frame is built, with only the columns that contain “Mean”, “mean” or “std”. It is stored in  a data frame named clean_data.
6.- A label that has all the data with the information of the subjects is created and named as “subject”.
7.- Using cbind, information of sensors (clean_data) is merged with (total_subjects) to form a new data frame (DF)
8.- Activity column is created using rbind and numbers are changed to descriptive labels using factor with levels
=1:6 and labels= c("walk", "walkupstairs" walkdownstairs", "sit", "stand", "lay").
9.- “activity” is added as label for the newly created column.
10.- “activity” column data is bind with DF to form a new data frame (DF2).
11.- The second data set that contains the means per activity per subject is built using group_by and summarise_all(funs(mean)).
This data set is stored in “averages”
12.- In this step, we “polish” column labels to make them tidy. They are lowercase, there is no ( or , and they are
descriptive. It took me several steps to clean the labels. So, if you know a
faster way, please let me know in the comments!
13.-  Finally, we store data from the two data frames in files “DF2.txt” and “averages.txt” using row.name = FALSE as
indicated in the instructions.  


 


 


 


