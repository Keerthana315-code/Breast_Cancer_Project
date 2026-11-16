
# =====================================
# MODEL EVALUATION
# =====================================

# 1. Load dataset
breast_cancer <- read.csv("data/breast_cancer_clean.csv")

breast_cancer$diagnosis <- factor(
  breast_cancer$diagnosis,
  levels = c("Benign", "Malignant")
)

# 2. Recreate the same training and testing split
set.seed(123)

benign_rows <- which(breast_cancer$diagnosis == "Benign")
malignant_rows <- which(breast_cancer$diagnosis == "Malignant")

train_benign <- sample(
  benign_rows,
  floor(0.8 * length(benign_rows))
)

train_malignant <- sample(
  malignant_rows,
  floor(0.8 * length(malignant_rows))
)

train_rows <- c(train_benign, train_malignant)

test_data <- breast_cancer[-train_rows, ]

# 3. Load trained model
model <- readRDS("results/logistic_regression_model.rds")

# 4. Predict probabilities
probabilities <- predict(
  model,
  newdata = test_data,
  type = "response"
)

# 5. Convert probabilities into classes
predictions <- ifelse(
  probabilities >= 0.5,
  "Malignant",
  "Benign"
)

predictions <- factor(
  predictions,
  levels = c("Benign", "Malignant")
)

# 6. Confusion Matrix
conf_matrix <- table(
  Actual = test_data$diagnosis,
  Predicted = predictions
)

print(conf_matrix)

# 7. Calculate evaluation metrics
TP <- conf_matrix["Malignant", "Malignant"]
TN <- conf_matrix["Benign", "Benign"]
FP <- conf_matrix["Benign", "Malignant"]
FN <- conf_matrix["Malignant", "Benign"]

accuracy <- (TP + TN) / sum(conf_matrix)
precision <- TP / (TP + FP)
recall <- TP / (TP + FN)
specificity <- TN / (TN + FP)
f1_score <- 2 * precision * recall / (precision + recall)

cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("Specificity:", specificity, "\n")
cat("F1 Score:", f1_score, "\n")

# 8. Save evaluation results
evaluation_results <- data.frame(
  Metric = c("Accuracy", "Precision", "Recall",
             "Specificity", "F1 Score"),
  Value = c(accuracy, precision, recall,
            specificity, f1_score)
)

write.csv(
  evaluation_results,
  "results/model_evaluation.csv",
  row.names = FALSE
)

print("Model evaluation completed successfully!")
