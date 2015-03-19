library(dplyr)
library(tidyr)

#If data doesn't preexist, download source data and unzip
if(!file.exists("./data")){dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")}
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

#Read in train data
train_data<-read.table(file.path(path_rf,"train","X_train.txt"))
train_subject<-read.table(file.path(path_rf,"train","subject_train.txt"))
train_activity<-read.table(file.path(path_rf,"train","y_train.txt"))

##Obtain activity and data variable names to be used with both train and test datasets
activity_label<-read.table(file.path(path_rf,"activity_labels.txt"))
data_label<-read.table(file.path(path_rf,"features.txt"))

#Assign variable names to columns of train data
train_activity<-within(train_activity, V1 <- factor(V1, labels = activity_label[,2]))
colnames(train_activity)<-c("Activity")
colnames(train_subject)<-c("Subject_ID")
colnames(train_data)<-as.character(data_label[,2])
train_complete<-cbind(train_subject,train_activity,train_data)

#Read in test data
test_data<-read.table(file.path(path_rf,"test","X_test.txt"))
test_subject<-read.table(file.path(path_rf,"test","subject_test.txt"))
test_activity<-read.table(file.path(path_rf,"test","y_test.txt"))

#Assign variable names to columns of test data
test_activity<-within(test_activity,V1 <-factor(V1, labels = activity_label[,2]))
colnames(test_activity)<-c("Activity")
colnames(test_subject)<-c("Subject_ID")
colnames(test_data)<-as.character(data_label[,2])
test_complete<-cbind(test_subject,test_activity,test_data)

#create complete raw dataset
complete_data<-rbind(train_complete,test_complete)

#Extracts only mean and standard deviation measurements (Project Step #2)
mean_string<-c("mean")
std_string<-c("std")
mean_index<-grepl(mean_string,names(complete_data), ignore.case = TRUE)
std_index<-grepl(std_string,names(complete_data), ignore.case = TRUE)
mean_data<-complete_data[,mean_index]
std_data<-complete_data[,std_index]
tidy_data<-tbl_df(cbind(complete_data[,1:2],mean_data,std_data))

#Adds clean, descriptive activity names for variables (columns) of mean & standard deviation data (Project Step #3/#4)
colnames(tidy_data)<-gsub("-","_",colnames(tidy_data))
colnames(tidy_data)<-gsub("\\()","",colnames(tidy_data))
names(tidy_data)<-gsub("^t", "time", names(tidy_data))
names(tidy_data)<-gsub("^f", "frequency", names(tidy_data))
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))

#From mean & standard deviation data, creates a tidy dataset with the mean of each variable for each activity and subject (Project Step #5)
tidy_complete<-group_by(tidy_data,Subject_ID,Activity)
tidy_complete<-summarise_each(tidy_complete,funs(mean))
write.table(tidy_complete,file = "tidydata.txt",row.name = FALSE)

