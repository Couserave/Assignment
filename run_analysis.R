setwd("F:/coursera/UCI HAR Dataset")
test_x<-read.table("./test/X_test.txt",header=F)
test_y<-read.table("./test/y_test.txt",header=F)
test_sub<-read.table("./test/subject_test.txt",header=F)




test<-cbind(test_x,test_y,test_sub)
nrow(test)
ncol(test)


train_x<-read.table("./train/X_train.txt",header=F)
train_y<-read.table("./train/y_train.txt",header=F)
train_sub<-read.table("./train/subject_train.txt",header=F)



train<-cbind(train_x,train_y,train_sub)
nrow(train)
ncol(train)


complete<-rbind(train,test)
nrow(complete)
ncol(complete)
names(complete)





variable_name<-read.table("./features.txt",header=F)
feature<-as.character(variable_name[,2])

feature[562]<-"Activity"
feature[563]<-"Subject"


for(i in 1:563){
names(complete)[i]<- feature[i]
}


dd<-complete[grep("mean\\(\\)|std\\(\\)",names(complete))
]
ncol(dd)
names(dd)



complete$Activity[complete$Activity==1]<-"WALKING"
complete$Activity[complete$Activity==2]<-"WALKING_UPSTAIRS"
complete$Activity[complete$Activity==3]<-"WALKING_DOWNSTAIRS"
complete$Activity[complete$Activity==4]<-"SITTING"
complete$Activity[complete$Activity==5]<-"STANDING"
complete$Activity[complete$Activity==6]<-"LAYING"

dd$Activity<-complete$Activity
dd$Subject<-complete$Subject




names(dd)<-sub("^t","Time",names(dd))
names(dd)<-sub("\\(\\)","",names(dd))
names(dd)<-sub("\\-","_",names(dd))
names(dd)<-sub("\\-","_",names(dd))
names(dd)<-sub("^f","Frequency",names(dd))


install.packages("reshape2")
library(reshape2)

independent_dataset<-ddply(dd,.(Activity,Subject),summarize,
AVG_TimeBodyAcc_mean_X=mean(TimeBodyAcc_mean_X),
AVG_TimeBodyAcc_mean_Z=mean(TimeBodyAcc_mean_Z),
AVG_TimeBodyAcc_std_Y=mean(TimeBodyAcc_std_Y),
AVG_TimeGravityAcc_mean_X =mean(TimeGravityAcc_mean_X),
AVG_TimeGravityAcc_mean_Z =mean(TimeGravityAcc_mean_Z),
AVG_TimeGravityAcc_std_Y =mean(TimeGravityAcc_std_Y  ),
AVG_TimeBodyAccJerk_mean_X =mean(TimeBodyAccJerk_mean_X  ),
AVG_TimeBodyAccJerk_mean_Z =mean(TimeBodyAccJerk_mean_Z  ),
AVG_TimeBodyAccJerk_std_Y =mean(TimeBodyAccJerk_std_Y  ),
AVG_TimeBodyGyro_mean_X =mean(TimeBodyGyro_mean_X  ),
AVG_TimeBodyGyro_mean_Z =mean(TimeBodyGyro_mean_Z  ),
AVG_TimeBodyGyro_std_Y =mean(TimeBodyGyro_std_Y  ),
AVG_TimeBodyGyroJerk_mean_X =mean(TimeBodyGyroJerk_mean_X  ),
AVG_TimeBodyGyroJerk_mean_Z =mean(TimeBodyGyroJerk_mean_Z  ),
AVG_TimeBodyGyroJerk_std_Y =mean(TimeBodyGyroJerk_std_Y  ),
AVG_TimeBodyAccMag_mean =mean(TimeBodyAccMag_mean  ),
AVG_TimeGravityAccMag_mean=mean(TimeGravityAccMag_mean  ),
AVG_TimeBodyAccJerkMag_mean=mean(TimeBodyAccJerkMag_mean  ),
AVG_TimeBodyGyroMag_mean=mean(TimeBodyGyroMag_mean  ),
AVG_TimeBodyGyroJerkMag_mean=mean(TimeBodyGyroJerkMag_mean  ),
AVG_FrequencyBodyAcc_mean_X  =mean(FrequencyBodyAcc_mean_X  ),
AVG_FrequencyBodyAcc_mean_Z  =mean(FrequencyBodyAcc_mean_Z  ),
AVG_FrequencyBodyAcc_std_Y  =mean(FrequencyBodyAcc_std_Y  ),
AVG_FrequencyBodyAccJerk_mean_X  =mean(FrequencyBodyAccJerk_mean_X  ),
AVG_FrequencyBodyAccJerk_mean_Z  =mean(FrequencyBodyAccJerk_mean_Z  ),
AVG_FrequencyBodyAccJerk_std_Y  =mean (FrequencyBodyAccJerk_std_Y  ),
AVG_FrequencyBodyGyro_mean_X  =mean(FrequencyBodyGyro_mean_X  ),
AVG_FrequencyBodyGyro_mean_Z  =mean(FrequencyBodyGyro_mean_Z  ),
AVG_FrequencyBodyGyro_std_Y  =mean(  FrequencyBodyGyro_std_Y  ),
AVG_FrequencyBodyAccMag_mean  =mean(  FrequencyBodyAccMag_mean),
AVG_FrequencyBodyBodyAccJerkMag_mean  =mean(  FrequencyBodyBodyAccJerkMag_mean  ),
AVG_FrequencyBodyBodyGyroMag_mean  =mean(  FrequencyBodyBodyGyroMag_mean  ),
AVG_FrequencyBodyBodyGyroJerkMag_mean  =mean(  FrequencyBodyBodyGyroJerkMag_mean  ),
AVG_TimeBodyAcc_mean_Y  =mean(TimeBodyAcc_mean_Y  ),
AVG_TimeBodyAcc_std_X  =mean(  TimeBodyAcc_std_X  ),
AVG_TimeBodyAcc_std_Z  =mean(  TimeBodyAcc_std_Z  ),
AVG_TimeGravityAcc_mean_Y  =mean(  TimeGravityAcc_mean_Y  ),
AVG_TimeGravityAcc_std_X  =mean(  TimeGravityAcc_std_X  ),
AVG_TimeGravityAcc_std_Z  =mean(  TimeGravityAcc_std_Z  ),
AVG_TimeBodyAccJerk_mean_Y  =mean(  TimeBodyAccJerk_mean_Y  ),
AVG_TimeBodyAccJerk_std_X  =mean(  TimeBodyAccJerk_std_X  ),
AVG_TimeBodyAccJerk_std_Z  =mean(  TimeBodyAccJerk_std_Z  ),
AVG_TimeBodyGyro_mean_Y  =mean(  TimeBodyGyro_mean_Y  ),
AVG_TimeBodyGyro_std_X  =mean(  TimeBodyGyro_std_X  ),
AVG_TimeBodyGyro_std_Z  =mean(  TimeBodyGyro_std_Z  ),
AVG_TimeBodyGyroJerk_mean_Y  =mean(  TimeBodyGyroJerk_mean_Y  ),
AVG_TimeBodyGyroJerk_std_X  =mean(  TimeBodyGyroJerk_std_X  ),
AVG_TimeBodyGyroJerk_std_Z  =mean(  TimeBodyGyroJerk_std_Z  ),
AVG_TimeBodyAccMag_std  =mean(  TimeBodyAccMag_std  ),
AVG_TimeGravityAccMag_std  =mean(  TimeGravityAccMag_std  ),
AVG_TimeBodyAccJerkMag_std  =mean(  TimeBodyAccJerkMag_std  ),
AVG_TimeBodyGyroMag_std  =mean(  TimeBodyGyroMag_std  ),
AVG_TimeBodyGyroJerkMag_std  =mean(  TimeBodyGyroJerkMag_std  ),
AVG_FrequencyBodyAcc_mean_Y  =mean(  FrequencyBodyAcc_mean_Y  ),
AVG_FrequencyBodyAcc_std_X  =mean(  FrequencyBodyAcc_std_X  ),
AVG_FrequencyBodyAcc_std_Z  =mean(  FrequencyBodyAcc_std_Z  ),
AVG_FrequencyBodyAccJerk_mean_Y  =mean(  FrequencyBodyAccJerk_mean_Y  ),
AVG_FrequencyBodyAccJerk_std_X  =mean(  FrequencyBodyAccJerk_std_X  ),
AVG_FrequencyBodyAccJerk_std_Z  =mean(  FrequencyBodyAccJerk_std_Z  ),
AVG_FrequencyBodyGyro_mean_Y  =mean(  FrequencyBodyGyro_mean_Y  ),
AVG_FrequencyBodyGyro_std_X  =mean(FrequencyBodyGyro_std_X),
AVG_FrequencyBodyGyro_std_Z  =mean(FrequencyBodyGyro_std_Z),
AVG_FrequencyBodyAccMag_std  =mean(FrequencyBodyAccMag_std),
AVG_FrequencyBodyBodyAccJerkMag_std  =mean(FrequencyBodyBodyAccJerkMag_std),
AVG_FrequencyBodyBodyGyroMag_std  =mean(FrequencyBodyBodyGyroMag_std),
AVG_FrequencyBodyBodyGyroJerkMag_std =mean(FrequencyBodyBodyGyroJerkMag_std))


write.csv(dd,"./first_dataset.csv")
write.csv(independent_dataset,"./second_dataset.csv")
