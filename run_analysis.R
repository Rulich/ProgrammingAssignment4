# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.


require(dplyr)

#################################################################
# Get and extract the initial dataset
#

zipfile<-"UCI_HAR_Dataset.zip"
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download zip file if does not exist
if (!file.exists(zipfile)){
  download.file(fileURL,zipfile, method="curl")
}  

# Unpack zip file if folder does not exist
if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipfile) 
}

#################################################################
# 1) Merge the training and the test sets to create one data set.
#

# read test data set
x_test<-read.table("UCI HAR Dataset\\test\\X_test.txt", colClasses="numeric")

# read activity labels of test data set
y_test<-read.table("UCI HAR Dataset\\test\\y_test.txt", colClasses="numeric")

# read test subjects data 
subj_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt", colClasses="numeric")

# read train data set
x_train<-read.table("UCI HAR Dataset\\train\\X_train.txt", colClasses="numeric")

# read activity labels of train data set
y_train<-read.table("UCI HAR Dataset\\train\\y_train.txt", colClasses="numeric")

# read train subjects data 
subj_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt", colClasses="numeric")

# combine test data
test_data<-cbind(subj_test,y_test,x_test)

# combine train data
train_data<-cbind(subj_train,y_train,x_train)

#concatenate test and train data sets
raw_data<-rbind(test_data,train_data)

#################################################################
# 2) Extract only the measurements on the mean and standard deviation for each 
#  measurement. 
#

# read measures labels
features<-read.table("UCI HAR Dataset\\features.txt",col.names = c("n","measures"))

# load pure column names
cnames<-c("subject","activityID",features[,2])
# get column indexes to load
colIdx<-c(1,2,grep("mean\\(|std\\(",cnames))
# select mean and std dev columns using index
selected_data<-raw_data[,colIdx]

#################################################################
# 3) Use descriptive activity names to name the activities in the data set
#

# rename activity column, prepare to join
names(selected_data)[2]<-"activityID"

#read activity lables
activities<-read.table("UCI HAR Dataset\\activity_labels.txt",col.names = c("activityID","activity"))
# join data sets
selected_data<-inner_join(selected_data, activities, by="activityID")

# replace activityID by activity column
selected_data$activityID<-selected_data$activity
selected_data$activity<- NULL
names(selected_data)[2]<-"activity"
cnames[2]<-"activity"


#################################################################
# 4) Appropriately label the data set with descriptive variable names. 
#

# select column names using index
cnames<-cnames[colIdx]

# replace prefixes: tBody, fBody, tGravity 
cnames<-gsub("tBody","time_body_",cnames,fixed=TRUE)
cnames<-gsub("fBody","frequency_body_",cnames,fixed=TRUE)
cnames<-gsub("tGravity","time_gravity_",cnames,fixed=TRUE)

#replace column name descriptors: Acc, Gyro, Jerk, Mag, Body
cnames<-gsub("Acc","acceleration_",cnames,fixed=TRUE)
cnames<-gsub("Gyro","gyroscopic_",cnames,fixed=TRUE)
cnames<-gsub("Jerk","jerk_",cnames,fixed=TRUE)
cnames<-gsub("Mag","magnitude_",cnames,fixed=TRUE)
cnames<-gsub("Body","body_",cnames,fixed=TRUE)

# replace descriptors: mean() and std()
cnames<-gsub("-mean()","mean",cnames,fixed=TRUE)
cnames<-gsub("-std()","standard_deviation",cnames,fixed=TRUE)
      
# replace suffixes: X, Y, Z
cnames<-gsub("-X","_x",cnames,fixed=TRUE)
cnames<-gsub("-Y","_y",cnames,fixed=TRUE)
cnames<-gsub("-Z","_z",cnames,fixed=TRUE)

# apply column names
names(selected_data)<-cnames


#################################################################
# 5) From the data set in step 4, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

tidy_data<-selected_data %>% group_by(subject,activity) %>% summarise_all(list(mean))
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
