
# Breast Cancer Project
# Step 1: Download the dataset

dataset_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"

download.file(
  dataset_url,
  destfile = "data/wdbc.data",
  mode = "wb"
)

# Check whether the file exists
file.exists("data/wdbc.data")
