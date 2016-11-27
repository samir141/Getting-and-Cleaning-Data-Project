
## downloading the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./data/Dataset.zip")){
	download.file(fileUrl,destfile="./data/Dataset.zip")
}

## unzipping the file
if (!file.exists("./data/UCI HAR Dataset")){
	unzip(zipfile="./data/Dataset.zip",exdir="./data")
}

## viewing the files in the folder
filePath <- file.path("./data", "UCI HAR Dataset")
files<-list.files(filePath, recursive=TRUE)
files

## reading training data
trainSubjects <- read.table(file.path(filePath, "train/subject_train.txt"))
trainActivities <- read.table(file.path(filePath, "train/y_train.txt"))
trainFeatures <- read.table(file.path(filePath, "train/X_train.txt"))

## reading testing data
testSubjects <- read.table(file.path(filePath, "test/subject_test.txt"))
testActivities <- read.table(file.path(filePath, "test/y_test.txt"))
testFeatures <- read.table(file.path(filePath, "test/X_test.txt"))

## merging all the data
train <- cbind(trainSubjects, trainActivities, trainFeatures)
test <- cbind(testSubjects, testActivities, testFeatures)
allData <- rbind(train, test)

## adding labels to the data
featureNames <- read.table(file.path(filePath, "features.txt"))
colnames(allData) <- c("subject", "activity", as.character(featureNames[,2]))

## extracting only the mean and sd
featureNamesDesired <- featureNames[,2][grepl("mean\\(\\)|std\\(\\)", featureNames[,2])]
data<-subset(allData,select=c("subject", "activity", as.character(featureNamesDesired)))

## turning activities & subjects into factors
activityLabels <- read.table(file.path(filePath, "activity_labels.txt"))
activityLabels[,2] <- as.character(activityLabels[,2])
data$activity <- factor(data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
data$subject <- as.factor(data$subject)

## appropriately labelling the data
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("-mean", "Mean", names(data))
names(data) <- gsub("-std", "Std", names(data))
names(data) <- gsub("[-()]", "", names(data))

## creating a second independent tidy data set
library(reshape2)
dataMelt <- melt(data, id = c("subject", "activity"))
dataMean <- dcast(dataMelt, subject + activity ~ variable, mean)
write.table(dataMean, file = "tidydata.txt",row.name=FALSE)
