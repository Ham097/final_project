# Load required packages
library(dplyr)

# 1. Merging the training and test sets
train <- read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/train/X_train.txt")
test <- read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/test/X_test.txt")
merged_data <- rbind(train, test)
head(merged_data)
features <- read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/features.txt")
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features$V2)
selected_data <- merged_data[, mean_std_indices]
head(selected_data)
# 3. Using descriptive activity names
activity_labels <- read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/activity_labels.txt")
activity <- rbind(read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/train/y_train.txt"), read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/test/y_test.txt"))
activity <- factor(activity$V1, levels = activity_labels$V1, labels = activity_labels$V2)
# 4. Appropriately labeling the data set with descriptive variable names
names(selected_data) <- features$V2[mean_std_indices]

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
subject_train <- read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("D:/Users/suuser/Desktop/Coursera/UCI HAR Dataset/test/subject_test.txt")
subject <- factor(c(subject_train$V1, subject_test$V1))
tidy_data <- cbind(subject, activity, selected_data) %>%
  group_by(subject, activity) %>%
  summarise_all(mean)
# Writing the tidy data set to a file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
getwd()
