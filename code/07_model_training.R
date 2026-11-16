
# =====================================
# BREAST CANCER CLASSIFICATION
# LOGISTIC REGRESSION MODEL
# =====================================

# 1. Load cleaned dataset
breast_cancer <- read.csv("data/breast_cancer_clean.csv")

# Convert diagnosis into factor
breast_cancer$diagnosis <- factor(
  breast_cancer$diagnosis,
  levels = c("Benign", "Malignant")
)

# 2. Split dataset into training and testing data
set.seed(123)

benign_rows <- which(breast_cancer$diagnosis == "Benign")
malignant_rows <- which(breast_cancer$diagnosis == "Malignant")

train_benign <- sample(
  benign_rows,
  size = floor(0.8 * length(benign_rows))
)

train_malignant <- sample(
  malignant_rows,
  size = floor(0.8 * length(malignant_rows))
)

train_rows <- c(train_benign, train_malignant)

train_data <- breast_cancer[train_rows, ]
test_data <- breast_cancer[-train_rows, ]

# 3. Check dataset sizes
print(dim(train_data))
print(dim(test_data))

# 4. Build Logistic Regression model
model <- glm(
  diagnosis ~ mean_radius + mean_texture +
    mean_smoothness + mean_concavity,
  data = train_data,
  family = binomial
)

# 5. Display model results
summary(model)

# 6. Save model
saveRDS(model, "results/logistic_regression_model.rds")

print("Logistic Regression model created successfully!")
