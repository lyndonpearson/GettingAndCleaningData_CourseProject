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




