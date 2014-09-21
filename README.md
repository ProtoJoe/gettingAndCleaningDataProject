gettingAndCleaningDataProject
=============================

Code for the course project of the Coursera "Getting and Cleaning Data" course in the Data Science track.

The script here (run_analysis.R) expects the dplyr library, version .2 or later, so if that isn't already installed in your version of R, go ahead and install it by running 

    install.packages("dplyr")

from within RStudio. This will allow the tidying function to do what it needs to do.

The steps for tidying the data are relatively straightforward, and I've set up functions that allow different tidying operations to occur at various levels. The steps are basically this:

1. Load the raw data (from both the train and test directories). There is a tiny bit of tidying done here, where it merges the data that is split across several files and stores them in a sinlge data.frame. Specifically, it loads the activity labels, makes the strings tidier, and adds a new column to the raw data to hold the string value of the activity being performed for each row. It also adds the user ID to each row.
2. Strip out only the data that we are interested in -- std() and mean() columns. (Also, keep the identifying columns -- userID and activity.)
3. Fix the column names to be easier to read. This strips out all non-alpha-numeric characters, replaces "t" and "f" abbreviations with "time" and "frequency" respectively, and makes the entire string proper camel case. 
4. Take the data, group it by user and activity, and take the mean of each one. This is the tidying step. The output data is a full frame of just the means for each user broken down by activity.
	
To actually perform these steps, once the source file is loaded, set the current working directory to the base directory in the zipped data file ("UCI HAR Dataset"). There should be several files in the working directory (such as features.txt and activity_labels.txt) and two directories, test and train, which house the actual data.

Once the working source file is loaded and the working directory set, then the following commands will yield a final tidy data set:

    rawData <- loadRawData() # This step takes some time... It's a lot of data to load.
	subData <- extractMeanAndStd(rawData)
	colnames(subData) <- fixColumnNames(subData)
	tidy <- tidyData(subData)
	
Yes, to save some memory, you could just use the same variable to hold the data set each time, I'm just demonstrating the different stages of the data here. You could even clone the data set before changing the column names so that all 4 steps are represented in 4 different variables. For simplicity's sake, I just have the sample code above reusing the step 2 data for step 3. (Also, please note that my steps do not necessarily correspond to the steps given in the assignment. I short circuited a few things for sake of ease/speed.)
