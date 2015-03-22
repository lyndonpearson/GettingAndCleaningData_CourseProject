According to the instructions listed on the course project website found here:

https://class.coursera.org/getdata-012/human_grading/view/courses/973499/assessments/3/submissions

This file will describe data, variables and any transformations done upon the data to complete the project.

DATA

The raw data can be located at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

and the main reference in processing this data was written by the course TA, David Hood, and is located at the following URL:

https://class.coursera.org/getdata-012/forum/thread?thread_id=9

As stated in Mr. Hood's course project FAQ, the intertial folder was omitted from any processing. Omitting these files meant
that both the "test" and "train" folders consisted of three files-a "subject" file (contain the ID number of the individual
performing the activity), an "X" file (containing the actual data measurements) and a "Y" file (identifying which of the six
activities was being performed at time of measurement). The three files in both the "test" and "train" folders were jointed together to create a complete training dataset and a complete
test dataset.

VARIABLES

Much of the text in this area will be discussing how the variable names were obtained and assigned. The "Subject" and "Y" files in both the "train" and "test" folders were given the variable names "Subject_ID" and "Activity", respectively. An existing file named "features.txt" was located one file level up in the directory and was used as a starting point for the variable names for each column of the "X" file. The final, tidy dataset including only those variable names that included "Mean" or "Std" in the string (greater discussion is found in the "DATA TRANSFORMATION" section). Finally, the variable names were cleaned up by
removing parenthesis in the names, removing redudant titles, etc.

DATA TRANSFORMATION
Dicussion will be made in following the order set forth in the analysis script, run_analysis.R. After reading in the three
files ("Subject", "X", and "Y") in both folders and storing them in variables, assignment of variable names began with the
train data. Whereas the "Y" file previously consisted of an integer between one and six, those numbers were cross-referenced
with a vector created by reading in the "activity_labels.txt" file and were replaced by the corresponding string.

The "features.txt" file was used in assigning names to the "X" files of both train and test data. The variable names were
cleaned and reformatted as detailed in the "VARIABLES" section. After naming the single column of the "Y" and "Subject" data,
the three train files ("Suject","Y" and "X") were combined using the cbind function.

A similar process was applied to the test files, resulting in a comprehensive test ("test_complete") and train ("train_complete")
dataset. The two datasets were combined using the rbind function to make a complete dataset. From this all measurements
pertaining to mean and standard deviation were extracted and stored in a new variable. As there was some ambiguity in 
which measurements to extract the author decided to extract all measurements that had "mean" or "std" in their variable name.
Extraction of this sort was accomplished by using the grepl function to identify which variable (column) names of the dataset
contained "mean" or "std" in a case-insensitive manner. 

The results from the mean and standard deviation search were stored separately and combined with the "Activity" and "Subject_ID"
of the original dataset using the cbind function. This combination was converted to a dataframe table using the "tbl_df" function and the "dplyr" library. The resulting dataframe table was used to create the mean of each variable (column name) for each subject and activity by calling the "group_by" and "summarise_each" functions. The final step was to write this dataset to a file
named "tidydata.txt" using the "write_table" function.



