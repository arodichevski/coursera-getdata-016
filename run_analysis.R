## Constructs the vector of columns widths: columns to read and that to skip in order to
## extract only the measurements on the mean and standard deviation for each measurement.
w <- 16 # column width
w1 <- rep(c(rep(w, 6), -rep(w, 34)), 5) # 6 columns to read, 34 to skip, repeated 5 times (200)
w2 <- rep(c(rep(w, 2), -rep(w, 11)), 5) # 2 columns to read, 11 to skip, repeated 5 times (65)
w3 <- rep(c(rep(w, 6), -rep(w, 73)), 3) # 6 columns to read, 73 to skip, repeated 3 times (237)
w4 <- rep(c(rep(w, 2), -rep(w, 11)), 4) # 2 columns to read, 11 to skip, repeated 4 times (52)
w5 <- -rep(w, 7) # 7 columns to skip (7)
widths <- c(w1, w2, w3, w4, w5) # columns to read and not to read (66 of 561 columns)

## Reads the training and the test file
df <- rbind(
	cbind(
		read.table ("UCI\ HAR\ Dataset/train/subject_train.txt", col.names = "subject"),
		read.table ("UCI\ HAR\ Dataset/train/y_train.txt", col.names = "activity"),
		set = "train",
		read.fwf ("UCI\ HAR\ Dataset/train/X_train.txt", widths)
	),
	cbind(
		read.table ("UCI\ HAR\ Dataset/test/subject_test.txt", col.names = "subject"),
		read.table ("UCI\ HAR\ Dataset/test/y_test.txt", col.names = "activity"),
		set = "test",
		read.fwf ("UCI\ HAR\ Dataset/test/X_test.txt", widths)
	)
)

## Converts activity numbers to descriptive factors
df$activity <- factor(df$activity)
levels(df$activity) <- list(walking = "1", walking_upstairs = "2", walking_downstairs ="3", sitting = "4", standing = "5", laying = "6")

## Labels the data set with descriptive variable names
names(df) = c(
	"Subject",
	"Activity",
	"Set",
	"Body acceletation X mean",
	"Body acceletation Y mean",
	"Body acceletation Z mean",
	"Body acceletation X std dev",
	"Body acceletation Y std dev",
	"Body acceletation Z std dev",
	"Gravity acceletation X mean",
	"Gravity acceletation Y mean",
	"Gravity acceletation Z mean",
	"Gravity acceletation X std dev",
	"Gravity acceletation Y std dev",
	"Gravity acceletation Z std dev",
	"Jerk acceletation X mean",
	"Jerk acceletation Y mean",
	"Jerk acceletation Z mean",
	"Jerk acceletation X std dev",
	"Jerk acceletation Y std dev",
	"Jerk acceletation Z std dev",
	"Gyroscope X mean",
	"Gyroscope Y mean",
	"Gyroscope Z mean",
	"Gyroscope X std dev",
	"Gyroscope Y std dev",
	"Gyroscope Z std dev",
	"Jerk gyroscope X mean",
	"Jerk gyroscope Y mean",
	"Jerk gyroscope Z mean",
	"Jerk gyroscope X std dev",
	"Jerk gyroscope Y std dev",
	"Jerk gyroscope Z std dev",
	"Body acceletation magnitude mean",
	"Body acceletation magnitude std dev",
	"Gravity acceletation magnitude mean",
	"Gravity acceletation magnitude std dev",
	"Jerk acceletation magnitude mean",
	"Jerk acceletation magnitude std dev",
	"Gyroscope magnitude mean",
	"Gyroscope magnitude std dev",
	"Jerk gyroscope magnitude mean",
	"Jerk gyroscope magnitude std dev",
	"Body acceletation X mean (fourier)",
	"Body acceletation Y mean (fourier)",
	"Body acceletation Z mean (fourier)",
	"Body acceletation X std dev (fourier)",
	"Body acceletation Y std dev (fourier)",
	"Body acceletation Z std dev (fourier)",
	"Jerk acceletation X mean (fourier)",
	"Jerk acceletation Y mean (fourier)",
	"Jerk acceletation Z mean (fourier)",
	"Jerk acceletation X std dev (fourier)",
	"Jerk acceletation Y std dev (fourier)",
	"Jerk acceletation Z std dev (fourier)",
	"Gyroscope X mean (fourier)",
	"Gyroscope Y mean (fourier)",
	"Gyroscope Z mean (fourier)",
	"Gyroscope X std dev (fourier)",
	"Gyroscope Y std dev (fourier)",
	"Gyroscope Z std dev (fourier)",
	"Body acceletation magnitude mean (fourier)",
	"Body acceletation magnitude std dev (fourier)",
	"Jerk acceletation magnitude mean (fourier)",
	"Jerk acceletation magnitude std dev (fourier)",
	"Gyroscope magnitude mean (fourier)",
	"Gyroscope magnitude std dev (fourier)",
	"Jerk gyroscope magnitude mean (fourier)",
	"Jerk gyroscope magnitude std dev (fourier)"
)

## Creates a tidy data set with the average of each variable for each activity and each subject
avg.df <- aggregate(df[,-(1:3)], list(Activity = df[,2], Subject = df[,1]), mean)
write.table(avg.df, file = "uci_har_avg.txt", row.names = FALSE)
