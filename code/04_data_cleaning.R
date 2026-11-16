
# Step 3: Data Cleaning

# Import original dataset
breast_cancer <- read.csv("data/wdbc.data", header = FALSE)

# Assign meaningful column names
feature_names <- c(
  "radius", "texture", "perimeter", "area",
  "smoothness", "compactness", "concavity",
  "concave_points", "symmetry", "fractal_dimension"
)

column_names <- c(
  "id",
  "diagnosis",
  paste0("mean_", feature_names),
  paste0("se_", feature_names),
  paste0("worst_", feature_names)
)

colnames(breast_cancer) <- column_names

# Remove ID column
breast_cancer$id <- NULL

# Convert diagnosis into categories
breast_cancer$diagnosis <- factor(
  breast_cancer$diagnosis,
  levels = c("B", "M"),
  labels = c("Benign", "Malignant")
)

# Check missing values
sum(is.na(breast_cancer))

# Check duplicate rows
sum(duplicated(breast_cancer))

# Check cleaned dataset
head(breast_cancer)
dim(breast_cancer)
str(breast_cancer)

# Save cleaned dataset
write.csv(
  breast_cancer,
  "data/breast_cancer_clean.csv",
  row.names = FALSE
)
