run_analysis<-function(){
#     Read the data.
    trainx<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt");
    trainy<-read.table(".\\UCI HAR Dataset\\train\\Y_train.txt");
    trainsubject<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt");
    
    testx<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt");
    testy<-read.table(".\\UCI HAR Dataset\\test\\Y_test.txt");
    testsubject<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt");
    
    features<-read.table(".\\UCI HAR Dataset\\features.txt");
    
    
    x<-rbind(trainx,testx);
    
#     Extracts only the measurements on the mean and standard deviation for each measurement. 
    index<-which(grepl(x = features[,2],pattern = "mean()",fixed = TRUE)|grepl(x = features[,2],pattern = "std()",fixed = TRUE))
    
    y<-rbind(trainy,testy);
    subject<-rbind(trainsubject,testsubject);
    
#     Uses descriptive activity names to name the activities in the data set.
    activity<-character();
    for(i in 1:nrow(y)){
        if(y[i,1]==1){
            activity[i]="WALKING";
        }
        else if(y[i,1]==2) {
            activity[i]="WALKING_UPSTAIRS";
        }
        else if(y[i,1]==3) {
            activity[i]="WALKING_DOWNSTAIRS";
        }
        else if(y[i,1]==4) {
            activity[i]="SITTING";
        }
        else if(y[i,1]==5) {
            activity[i]="STANDING";
        }
        else if(y[i,1]==6) {
            activity[i]="LAYING";
        }
    }
    
# Appropriately labels the data set with descriptive variable names. 
    colnames(x)<-features[,2];
    filterx<-x[,index];  
    dataset<-data.frame(filterx, Activity=activity, Subject=subject[,1])
    
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    dataset$ActivitySubject<-as.factor(paste(dataset$Activity,as.character(dataset$Subject)));  
    lv<-levels(dataset$ActivitySubject);
    splitlv<-data.frame(strsplit(lv,' '));
    activitylevel<-as.vector(t(splitlv[1, ]));
    subjectlevel<-as.vector(t(splitlv[2, ]));
    dataset2<-data.frame(Activity=activitylevel,Subject=subjectlevel);
    colname<-character()
    for(i in 1:ncol(filterx)){
        dataset2[,i+2]<-tapply(dataset[,i],dataset$ActivitySubject,mean);
        colname[i]<-paste("Average_",colnames(filterx[i]),sep="");    
    }
    colnames(dataset2)[3:ncol(dataset2)]<-colname;

# Write the result into a txt file.
    write.table(dataset2,file = "sumsang_analysis.txt",row.names =FALSE);
}


