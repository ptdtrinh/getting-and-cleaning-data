setwd("~/Coursera/Getting-And-Cleaning-Data/")
# 1. Merges the training and the test sets to create one data set.
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")

names(train)
names(test)
length(which(names(train) != names(test)))

allData <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
class(allData$V1)
mean <- apply(allData, c(2), mean)
std <- apply(allData, c(2), sd)

# 3. Uses descriptive activity names to name the activities in the data set
train_label <- readLines("./UCI HAR Dataset//train//y_train.txt")
test_label <- readLines("./UCI HAR Dataset/test/y_test.txt")
label <- c(train_label, test_label)

allData <- cbind(allData, label)
allData$label <- as.character(allData$label)
unique(allData$label)
allData[allData$label == "1", ]$label <- "WALKING"
allData[allData$label == "2", ]$label <- "WALKING_UPSTAIRS"
allData[allData$label == "3", ]$label <- "WALKING_DOWNSTAIRS"
allData[allData$label == "4", ]$label <- "SITTING"
allData[allData$label == "5", ]$label <- "STANDING"
allData[allData$label == "6", ]$label <- "LAYING"

# 4. Appropriately labels the data set with descriptive variable names.
variable_names <- read.table("./UCI HAR Dataset/features.txt")
variable_names$V2 <- as.character(variable_names$V2)
colnames(allData) <- c(variable_names$V2, "label")
names(allData)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
allData$label <- as.factor(allData$label)
tidy_data <- aggregate(allData[, 1:561], by = list(allData$label), mean)
write.table(tidy_data, "tidy_data.txt", row.name = F)





