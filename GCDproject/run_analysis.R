##  Project for coursera, Getting and Cleaning Data
##  Data 


# import and tidy activity labels
activity <- read.table("activity_labels.txt")
activity[,2] <- tolower(gsub("_", " ", activity[,2]))

# import variable names
features <- read.table("features.txt", colClasses = "character")

# import data
test <- read.table("X_test.txt")
train <- read.table("X_train.txt")

# import subject labels
subjecttest <- read.table("subject_test.txt")
subjecttrain <- read.table("subject_train.txt")

# import coded activity labels
testlabels <- read.table("y_test.txt")
trainlabels <- read.table("y_train.txt")

# combine subject and activity labels and replace activity codes with names
k <- cbind(subjecttrain, trainlabels)
j <- cbind(subjecttest, testlabels)

combinelabels <- rbind(k, j)
combinelabels[,2] <- activity[combinelabels[,2],2]

# combine data sets and subset required columns
combineddata <- rbind(train, test)
colvec <- grep("mean\\(\\)|std\\(\\)", features[,2])

subdata <- combineddata[,colvec]
subdata <- cbind(combinelabels, subdata)
names(subdata) <- c("subject", "activity", features[colvec,2])

# calculate mean values and write to output data frame
meanvalues <- aggregate(subdata[,3:68], list(subdata$subject),mean)
meanvalues <- rbind(meanvalues, aggregate(subdata[,3:68], list(subdata$activity),mean))

names(meanvalues) <- names(meanvalues) <- c("subject/activity", names(meanvalues[2:67]))
write.csv(meanvalues, "meanvalues.csv")
