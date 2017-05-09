library(dplyr)
setwd("C:/Users/Gaby/OneDrive/Examen Cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/Examen")

# read data from files
train_data_file <- read.table("X_train.txt")
test_data_file <- read.table("X_test.txt")
train_label_file <- read.table("y_train.txt")
test_label_file <- read.table("y_test.txt")
features_file <- read.table("features.txt")
activity_label_file <- read.table("activity_labels.txt")
train_subject_file <- read.table("subject_train.txt")
test_subject_file <- read.table("subject_test.txt")

#merge data 

total_data <- rbind(train_data_file,test_data_file)
total_subjects <- rbind(train_subject_file,test_subject_file)
activity_labels <- activity_label_file

# label columns

colnames(total_data) <- features_file[,2]

#select columns that contain "std" or "mean"

selectas <- grep("[Mm]ean|std", features_file[,2])

clean_data <- total_data[,selectas]

# label subject column
colnames(total_subjects) <- "subject"

# merge subjects with clean_data

DF <- cbind(total_subjects, clean_data)

# Building activity column and changing numbers to descriptive

activity <- rbind(train_label_file,test_label_file)

activity$V1 <- factor(activity$V1, levels = c(1:6), labels = c("walk", "walkupstairs", "walkdownstairs","sit","stand","lay"))


    #label activity column
colnames(activity) <- "activity"



#Merge activity with DF

DF2 <- cbind(activity,DF)

# Second data set

averages <- DF2 %>% group_by (activity,subject) %>% summarise_all(funs(mean))

#Nice and tidy labels in both data frames

lower <- tolower(names(DF2)) 
lower2 <-tolower(names(averages))
mini <-sub("[-]","",lower)
mini2 <- sub("[-)]","", lower2)
a <-sub("[(]","",mini)
a2 <- sub("[(]","",mini2)
b <-sub("[)]","",a)
b2 <- sub("[)]","",a2)
c <- sub("[-]","",b)
c2 <- sub("[-]","",b2)
namefinal <- sub("[,]","",c)
namefinal2 <- sub("[,]","",c)
names(DF2) <- namefinal
names(averages) <- namefinal2
View(DF2)
View(averages)

# save tidy data sets in file .txt
write.table(DF2,file="DF2.txt", row.name=FALSE)
write.table(averages,file="averages.txt", row.name=FALSE)


