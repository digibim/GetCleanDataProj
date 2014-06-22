## run_analysis.R
## Note that this script assumes that the working directory is the UCI HAR Dataset folder.

## Read in all of the files
stest<-read.table("test/subject_test.txt")
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/y_test.txt")
strain<-read.table("train/subject_train.txt")
xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/y_train.txt")
features<-read.table("features.txt")
activities<-read.table("activity_labels.txt")

## Combine into a single dataframe
test<-cbind(stest,ytest,xtest)
train<-cbind(strain,ytrain,xtrain)
data<-rbind(train,test)

## Select and label the "mean" and "std" columns
## keepvars is the list of original variable names
## keepdata is the dataframe with those columns, plus the first two (subjects and activities)
cols<-sort(c(grep("mean",features[,2]),grep("std",features[,2])))
keepvars<-features[cols,2]
datacols<-cols+2
keepcols<-c(1,2,datacols)
keepdata<-data[,keepcols]

## cleanvars strips all extra characters from variable names, and converts to lowercase
cleanvars<-function(x) {
        x<-gsub("\\(","",x)
        x<-gsub("\\)","",x)
        x<-gsub("-","",x)
        x<-gsub("\\,","",x)
        x<-tolower(x)
        x
}

## cleanedvars contains the names of just the 79 response variables
## varnames includes the identifier labels, and gets applied to the dataframe
cleanedvars<-sapply(keepvars,cleanvars)
varnames<-c("subjects","activitynum",cleanedvars)
names(keepdata)<-varnames
names(activities)<-c("activitynum","activityname")

## merged to get the activity names in the dataframe
finaldata<-merge(activities,keepdata)

## getaverages takes a vector of variable names and aggregates over each, putting the results in a single dataframe
getaverages<-function(vars,data,id1,id2) {
        averages<-aggregate(get(vars[[1]]) ~ get(id1) + get(id2), data = data, mean)
        for(i in seq_along(vars)) {
                if(i==1) next
                new<-aggregate(get(vars[[i]]) ~ get(id1) + get(id2), data = data, mean)
                averages<-cbind(averages,new[,3])
        }
        averages
}

## tidyaves is the (wide) dataframe containing all means for each of the 180 possible combinations
tidyaves<-getaverages(cleanedvars,finaldata,"subjects","activityname")
names(tidyaves)<-c("subjects","activityname",cleanedvars)

## output to a text file
write.table(tidyaves,file="tidyavefile.txt")
