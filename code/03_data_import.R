
# Step 2: Import the Breast Cancer Dataset

data <- read.csv(
  "data/wdbc.data",
  header = FALSE
)

# Display first 6 rows
head(data)

# Check number of rows and columns
dim(data)

# Check dataset structure
str(data)
