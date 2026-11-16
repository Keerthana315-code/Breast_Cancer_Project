
# Step 4: Exploratory Data Analysis

# Load cleaned dataset
breast_cancer <- read.csv("data/breast_cancer_clean.csv")

# Count diagnosis categories
diagnosis_count <- table(breast_cancer$diagnosis)

# Display counts
print(diagnosis_count)

# Create bar chart
barplot(
  diagnosis_count,
  main = "Distribution of Breast Cancer Diagnosis",
  xlab = "Diagnosis",
  ylab = "Number of Samples",
  col = c("skyblue", "salmon")
)
