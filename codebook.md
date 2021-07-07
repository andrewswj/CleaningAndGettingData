About the Raw Data
------------------

The raw data was obtained from the ‘Human Activity Recognition Using
Smartphones Dataset’ by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro
Ghio and Luca Oneto. The dataset measured accelerometer and gyroscope
data of 30 individuals performing 6 activities.

A full description of the data is available at
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>,
and the raw data can be downloaded from
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>.

The raw data was in multiple .txt files.

About tidydata.txt
------------------

### Dimensions

180 rows (observations), 68 columns (variables). There were 30
participants, and 6 activities in the experiment.

### NA/Missing Values

No missing values.

### Data Processing

The aim of the data processing was to merge all experimental
observations into one data set before filtering out only the variables
which involved means and standard deviations. The final output was a
tidy data set containing the average of each experimental subject’s
readings for each of the 6 activities they did (e.g. walking) across all
variables.

A step-by-step explanation of how the data was processed is available by
viewing run\_analysis.R, but here is a brief explanation:

1.  The different .txt files data sets were read into R and merged.
2.  The data set was filtered so that only columns measuring means or
    standard deviations remained.
3.  The column names were processed to simplify long and confusing
    variables.
4.  The codes 1 to 6 originally used to designate activities were
    replaced by the actual activity names for better tidiness and
    readability.
5.  The data set was processed once more, taking the average grouped by
    individual and activity to obtain tidydata.txt.

### Column Info

The column names of tidydata.txt are all set to lowercase so that they
can be more easily analyzed. The variables have shortened names. Below
is a list explaining some of the column names in more detail:

1.  mean = Average
2.  std = Standard Deviation
3.  time = Time Domain
4.  freq = Frequency Domain
5.  acc = Accelerometer
6.  gyro = Gyroscope
7.  jerk = Jerk Signal
8.  mag = Magnitude
9.  x/y/z = Directional readings in 3 dimensions
10. id = Subject ID number from 1 to 30
11. activity = The name of the activity the subject performed. The set
    of possible activity elements are:

-   walking
-   walking\_upstairs
-   walking\_downstairs
-   sitting
-   standing
-   laying

### Variables

The list of column names in tidydata.txt:

    setwd("UCI HAR Dataset")
    print(read.table("./filteredcolnames.txt"))

    ##                              x
    ## 1                           id
    ## 2                     activity
    ## 3             timebodyaccmeanx
    ## 4             timebodyaccmeany
    ## 5             timebodyaccmeanz
    ## 6              timebodyaccstdx
    ## 7              timebodyaccstdy
    ## 8              timebodyaccstdz
    ## 9          timegravityaccmeanx
    ## 10         timegravityaccmeany
    ## 11         timegravityaccmeanz
    ## 12          timegravityaccstdx
    ## 13          timegravityaccstdy
    ## 14          timegravityaccstdz
    ## 15        timebodyaccjerkmeanx
    ## 16        timebodyaccjerkmeany
    ## 17        timebodyaccjerkmeanz
    ## 18         timebodyaccjerkstdx
    ## 19         timebodyaccjerkstdy
    ## 20         timebodyaccjerkstdz
    ## 21           timebodygyromeanx
    ## 22           timebodygyromeany
    ## 23           timebodygyromeanz
    ## 24            timebodygyrostdx
    ## 25            timebodygyrostdy
    ## 26            timebodygyrostdz
    ## 27       timebodygyrojerkmeanx
    ## 28       timebodygyrojerkmeany
    ## 29       timebodygyrojerkmeanz
    ## 30        timebodygyrojerkstdx
    ## 31        timebodygyrojerkstdy
    ## 32        timebodygyrojerkstdz
    ## 33          timebodyaccmagmean
    ## 34           timebodyaccmagstd
    ## 35       timegravityaccmagmean
    ## 36        timegravityaccmagstd
    ## 37      timebodyaccjerkmagmean
    ## 38       timebodyaccjerkmagstd
    ## 39         timebodygyromagmean
    ## 40          timebodygyromagstd
    ## 41     timebodygyrojerkmagmean
    ## 42      timebodygyrojerkmagstd
    ## 43            freqbodyaccmeanx
    ## 44            freqbodyaccmeany
    ## 45            freqbodyaccmeanz
    ## 46             freqbodyaccstdx
    ## 47             freqbodyaccstdy
    ## 48             freqbodyaccstdz
    ## 49        freqbodyaccjerkmeanx
    ## 50        freqbodyaccjerkmeany
    ## 51        freqbodyaccjerkmeanz
    ## 52         freqbodyaccjerkstdx
    ## 53         freqbodyaccjerkstdy
    ## 54         freqbodyaccjerkstdz
    ## 55           freqbodygyromeanx
    ## 56           freqbodygyromeany
    ## 57           freqbodygyromeanz
    ## 58            freqbodygyrostdx
    ## 59            freqbodygyrostdy
    ## 60            freqbodygyrostdz
    ## 61          freqbodyaccmagmean
    ## 62           freqbodyaccmagstd
    ## 63  freqbodybodyaccjerkmagmean
    ## 64   freqbodybodyaccjerkmagstd
    ## 65     freqbodybodygyromagmean
    ## 66      freqbodybodygyromagstd
    ## 67 freqbodybodygyrojerkmagmean
    ## 68  freqbodybodygyrojerkmagstd

Instructions for running run\_analysis.R
----------------------------------------

Ensure that the dplyr package is installed. The tidydata dataset is
already available in a .txt file. However, to ensure that
run\_analysis.R works, the raw data must be first installed in a folder
called “UCI HAR Dataset”.

Once the file ‘tidydata.txt’ has been created, a line of code to read
the table is supplied at the bottom of run\_analysis.R for your
convenience.
