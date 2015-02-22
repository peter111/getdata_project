##dowloading and unziping data

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="data.zip")
unzip("data.zip")

## installing package dplyr
install.packages("dplyr")
library(dplyr)

##loading tables
body_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")

body_gyro_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

total_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

body_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")

body_gyro_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

total_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

# 1. merging test and train datasets
full_data<-rbind(X_train,X_test)

# 4. using variable names from features dataset names
names(full_data)<-t(features$V2)

# 2. Extracting only columns with a mean() or std() postfix
red_data<-full_data[,c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z",
                       "tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z",
                       "tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z",
                       "tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z",
                       "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z",
                       "tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
                       "tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z",
                       "tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z",
                       "tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z",
                       "tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z",
                       "tBodyAccMag-mean()","tBodyAccMag-std()","tGravityAccMag-mean()",
                       "tGravityAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()",
                       "tBodyGyroMag-mean()","tBodyGyroMag-std()","tBodyGyroJerkMag-mean()",
                       "tBodyGyroJerkMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y",
                       "fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z",
                       "fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z",
                       "fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z",
                       "fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z",
                       "fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z",
                       "fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()",
                       "fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()",
                       "fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")]

#4. continues 
names(red_data)<-c("tBodyAccX","tBodyAccY","tBodyAccZ","tBodyAccX","tBodyAccY","tBodyAccZ",
                "tGravityAccX","tGravityAccY","tGravityAccZ","tGravityAccX","tGravityAccY","tGravityAccZ",
                "tBodyAccJerkX","tBodyAccJerkY","tBodyAccJerkZ","tBodyAccJerkX","tBodyAccJerkY","tBodyAccJerkZ",
                "tBodyGyroX","tBodyGyroY","tBodyGyroZ","tBodyGyroX","tBodyGyroY","tBodyGyroZ",
                "tBodyGyroJerkX","tBodyGyroJerkY","tBodyGyroJerkZ","tBodyGyroJerkX","tBodyGyroJerkY","tBodyGyroJerkZ",
                "tBodyAccMag","tBodyAccMag","tGravityAccMag","tGravityAccMag","tBodyAccJerkMag","tBodyAccJerkMag",
                "tBodyGyroMag","tBodyGyroMag","tBodyGyroJerkMag","tBodyGyroJerkMag","fBodyAccX","fBodyAccY",
                "fBodyAccZ","fBodyAccX","fBodyAccY","fBodyAccZ","fBodyAccJerkX","fBodyAccJerkY","fBodyAccJerkZ",
                "fBodyAccJerkX","fBodyAccJerkY","fBodyAccJerkZ","fBodyGyroX","fBodyGyroY","fBodyGyroZ",
                "fBodyGyroX","fBodyGyroY","fBodyGyroZ","fBodyAccMag","fBodyAccMag","fBodyBodyAccJerkMag",
                "fBodyBodyAccJerkMag","fBodyBodyGyroMag","fBodyBodyGyroMag","fBodyBodyGyroJerkMag","fBodyBodyGyroJerkMag")

# putting together actvities and test subjects from test and train dataset
activity<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)

# adding activities and test subjects to dataset
red_data[67]<-activity
red_data[68]<-subject
names(red_data)[68]<-paste("subject")

# activity labels
red_data_lab<-merge(red_data,activity_labels,by="V1")
red_data_lab<-red_data_lab[2:69]
names(red_data_lab)[68]<-paste("activity")

#5. Creating tidy data
tidy_data<-aggregate(cbind(tBodyAccX,tBodyAccY,tBodyAccZ,tBodyAccX.1,tBodyAccY.1,tBodyAccZ.1,tGravityAccX,tGravityAccY,tGravityAccZ,
                           tGravityAccX.1,tGravityAccY.1,tGravityAccZ.1,tBodyAccJerkX,tBodyAccJerkY,tBodyAccJerkZ,
                           tBodyAccJerkX.1,tBodyAccJerkY.1,tBodyAccJerkZ.1,tBodyGyroX,tBodyGyroY,tBodyGyroZ,
                           tBodyGyroX.1,tBodyGyroY.1,tBodyGyroZ.1,tBodyGyroJerkX,tBodyGyroJerkY,tBodyGyroJerkZ,
                           tBodyGyroJerkX.1,tBodyGyroJerkY.1,tBodyGyroJerkZ.1,tBodyAccMag,tBodyAccMag.1,tGravityAccMag,
                           tGravityAccMag.1,tBodyAccJerkMag,tBodyAccJerkMag.1,tBodyGyroMag,tBodyGyroMag.1,tBodyGyroJerkMag,
                           tBodyGyroJerkMag.1,fBodyAccX,fBodyAccY,fBodyAccZ,fBodyAccX.1,fBodyAccY.1,
                           fBodyAccZ.1,fBodyAccJerkX,fBodyAccJerkY,fBodyAccJerkZ,fBodyAccJerkX.1,fBodyAccJerkY.1,
                           fBodyAccJerkZ.1,fBodyGyroX,fBodyGyroY,fBodyGyroZ,fBodyGyroX.1,fBodyGyroY.1,
                           fBodyGyroZ.1,fBodyAccMag,fBodyAccMag.1,fBodyBodyAccJerkMag,fBodyBodyAccJerkMag.1,fBodyBodyGyroMag,
                           fBodyBodyGyroMag.1,fBodyBodyGyroJerkMag,fBodyBodyGyroJerkMag.1)~subject+activity,data=red_data_lab,mean)

write.table(tidy_data,file="tidy_data.txt")