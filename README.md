# README.MD
This repository holds all my files for the Coursera Week 4 Cleaning and Getting Data peer-reviewed assignment. 

This repository contains 4 files: README.md, tidydata.txt, run_analysis.R and a code book.

The code book contains information about the raw data, the data processing and instructions for running the code. The code may be found in run_analysis.R if you wish to view the data processing steps. 

tidydata.txt contains the output of the data processing.

Note that the original raw data is not supplied here. A link to download the raw data can be found from the code book.

The data processing steps were:
1. The different .txt files data sets were read into R and merged.
2. The data set was filtered so that only columns measuring means or standard deviations remained.
3. The column names were processed to simplify long and confusing variables.
4. The codes 1 to 6 originally used to designate activities were replaced by the actual activity names for better tidiness and readability. 
5. The data set was processed once more, taking the average grouped by individual and activity to obtain tidydata.txt.
