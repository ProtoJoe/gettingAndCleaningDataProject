# THe summarizing function requires dplyr to function.
library(dplyr)

.loadRawDataFrom <- function(prefix, recordsToRead = -1)
{
    # First, read the raw data from the X file (the truth is out there).
    data <- read.fwf(sprintf("%s/X_%s.txt", prefix, prefix), c(rep(c(-1, 15), 561)), n=recordsToRead)

    # Now that the data is read in, label the columns based on the column names listed in
    # the features file.
    tableColumns = read.table("features.txt")
    colnames(data) <- as.vector(tableColumns[,2])
    
    # Load the activity labels.
    activities <- read.table("activity_labels.txt")
    
    # Tidy the activity names a bit...
    for (i in seq_along(levels(activities[,2])))
    {
        levels(activities[,2])[i] <- gsub("_", " ", levels(activities[,2])[i])
        levels(activities[,2])[i] <- gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", levels(activities[,2])[i], perl=TRUE)
    }
    
    # Load the Y file (the truth is... in here?).
    dataAct <- read.table(sprintf("%s/y_%s.txt", prefix, prefix), nrows=recordsToRead)
    
    # Mapping the activity ID to the activities string table.
    for (i in 1:nrow(dataAct))
    {
        dataAct[i,1] <- as.character(activities[dataAct[i,1], 2])
    }
    
    # Label the activity field.
    colnames(dataAct) <- c("activity")
    
    # Next, read the user ID from the subject file.
    users <- read.table(sprintf("%s/subject_%s.txt", prefix, prefix), nrows=recordsToRead)
    
    # Go ahead and label the user ID field.
    colnames(users) <- c("userID")
    
    # Merge the activity into the data.
    data <- cbind(dataAct, data)
    
    # Merge the userID into the data.
    data <- cbind(users, data)
}

loadRawData <- function(recordsToRead = -1)
{
    testData <- .loadRawDataFrom("test", recordsToRead)
    trainData <- .loadRawDataFrom("train", recordsToRead)

    # Finally, bind both test and train data into a single table
    rbind(testData, trainData)
}

extractMeanAndStd <- function(rawDataSet)
{
    # Get just columns with means
    meanCols <- as.vector(mapply(grep, "mean()", colnames(rawDataSet), fixed=TRUE) == 1)
    meanCols <- as.vector(mapply(function(x) if (is.na(x)) x = FALSE else x = TRUE, meanCols))
    
    # Get just the columns with std
    stdCols <- as.vector(mapply(grep, "std()", colnames(rawDataSet), fixed=TRUE) == 1)
    stdCols <- as.vector(mapply(function(x) if (is.na(x)) x = FALSE else x = TRUE, stdCols))
    
    # Keep the identifying columns -- userID and activity
    idCols <- c(TRUE, TRUE, rep(FALSE, 561))
    
    # Restrict to just columns we want
    rawDataSet[meanCols | stdCols | idCols]
}

fixColumnNames <- function(dataSet)
{
    # Replace the leading "t" with "time"
    colnames(dataSet) <- as.vector(mapply(sub, "^t", "time", colnames(dataSet)))

    # Replace the leading "f" with "frequency"
    colnames(dataSet) <- as.vector(mapply(sub, "^f", "frequency", colnames(dataSet)))
    
    # Replace "-std" with "Std"
    colnames(dataSet) <- as.vector(mapply(sub, "-std()", "Std", colnames(dataSet), fixed=TRUE))
    
    # Replace "-mean" with "Mean"
    colnames(dataSet) <- as.vector(mapply(sub, "-mean()", "Mean", colnames(dataSet), fixed=TRUE))
    
    # Remove remaining -'s.
    colnames(dataSet) <- as.vector(mapply(gsub, "-", "", colnames(dataSet)))
    
    colnames(dataSet)
}

# NOTE: REQUIRES dplyr VERSION .2 OR GREATER.
tidyData <- function(dataSet)
{
    # First, use dplyr to convert the data frame into a table.
    dataTbl <- tbl_df(dataSet)
    
    # Next, group the data first by userID, then by activity.
    groupTbl <- group_by(dataTbl, userID, activity)
    
    # Finally, summarize the data.
    sumTbl <- summarise_each(groupTbl, funs(mean))
    
    # Return the data as a data frame.
    as.data.frame(sumTbl)
}