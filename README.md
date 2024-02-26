# final_project
# README

This README file explains the analysis files included in this repository.

## Files

1. `run_analysis.R`: R script that performs the following tasks:
    - Merges the training and test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set.
    - Appropriately labels the data set with descriptive variable names.
    - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2. `tidy_data.txt`: Tidy data set containing the average of each variable for each activity and each subject.

3. `codebook.md`: Codebook providing information about the variables and summaries calculated in the tidy data set.

## Usage

To reproduce the analysis:

1. Ensure that the "UCI HAR Dataset" dataset is available in your working directory.
2. Run the `run_analysis.R` script.
3. The script will generate the tidy data set (`tidy_data.txt`) and the codebook (`codebook.md`).

## Notes

- The tidy data set is derived from the "UCI HAR Dataset" dataset. 
- For more information about the dataset and its variables, refer to the original documentation.
