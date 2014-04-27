Assignment
==========
1.Column bind of X_test, y_test, subject_test,then column bind of X_train,y_train,subject_train data
test<-cbind(test_x,test_y,test_sub)   
train<-cbind(train_x,train_y,train_sub)

2. Row bind the newly created test and train dataframe
complete<-rbind(train,test)

3. Variable name where read from feature.txt file by using a for loop the varaiable names are added to the complete dataset

for(i in 1:563){
names(complete)[i]<- feature[i]
}

4.grep() function is used to extract the patter which match with mean() and std() measures.
grep("mean\\(\\)|std\\(\\)",names(complete))

5.Labeled the Activity variable with its activity descrpition.
complete$Activity[complete$Activity==1]<-"WALKING"
complete$Activity[complete$Activity==2]<-"WALKING_UPSTAIRS"

6.sub() function is used to describe the varaible names,
names(dd)<-sub("^t","Time",names(dd))
names(dd)<-sub("\\(\\)","",names(dd))
names(dd)<-sub("\\-","_",names(dd))
names(dd)<-sub("\\-","_",names(dd))
names(dd)<-sub("^f","Frequency",names(dd))

t is replaced with time, f is replaced with frequency and removed ().

7.Average of each variable for each activity and each subject is calculated using the ddply() function.

8.Using the write.csv function the two cleaned dataframes where write back to local desk.



