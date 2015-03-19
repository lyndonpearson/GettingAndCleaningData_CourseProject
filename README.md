# GettingAndCleaningData_CourseProject
Contains analysis script, readme.md file and codebook.md file
According to the course project detailed at:

https://class.coursera.org/getdata-012/human_grading/view/courses/973499/assessments/3/submissions

The README.md file should contain a description of all scripts used in the processing
of the data. All processes pertaining to this project are contained in a single .R file, 
which can be found at Lyndon Pearson's "GettingAndCleaningData_CourseProject" repository.

The script, run_analysis.R, operates as follows:

1.Checks to see if the data preexists. If not, downloads the .zip file and unzips it.
2.Reads in the training data set from the X_train.txt, subject_train.txt and y_train.txt files.
3.Obtains variable (column) names for training/test sets from the activity_labels.txt and features.txt files
4.Reads in the test data set from X_test.txt, subject_test.txt and y_test.txt files.
5.Combines the data obtained in steps two and four.
6.Extracts only mean and standard deviation measurements from the dataset created in step five.
7.Cleans/formats existing variable (column) names of the dataset.
8.Using the dataset created in step six, calculates the average of each variable for each activity and subject.
9.Writes this dataset to a file titled "tidaydata.txt"

Additional detail of variables, data and transformations can be found in the "Codebook.md" file.
