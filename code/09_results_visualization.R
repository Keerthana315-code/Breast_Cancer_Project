
# =====================================
# RESULTS VISUALIZATION
# =====================================

# 1. Load evaluation results
evaluation <- read.csv("results/model_evaluation.csv")

# 2. Create figures folder
dir.create(
  "results/figures",
  showWarnings = FALSE,
  recursive = TRUE
)

# 3. Evaluation metrics bar chart
png(
  "results/figures/model_performance.png",
  width = 900,
  height = 600
)

barplot(
  evaluation$Value * 100,
  names.arg = evaluation$Metric,
  main = "Logistic Regression Model Performance",
  xlab = "Evaluation Metrics",
  ylab = "Percentage (%)",
  col = "skyblue",
  ylim = c(0, 100),
  las = 2
)

dev.off()

# 4. Recreate test dataset
breast_cancer <- read.csv("data/breast_cancer_clean.csv")

breast_cancer$diagnosis <- factor(
  breast_cancer$diagnosis,
  levels = c("Benign", "Malignant")
)

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

# 5. Load model and predict
model <- readRDS("results/logistic_regression_model.rds")

probabilities <- predict(
  model,
  newdata = test_data,
  type = "response"
)

predictions <- ifelse(
  probabilities >= 0.5,
  "Malignant",
  "Benign"
)

predictions <- factor(
  predictions,
  levels = c("Benign", "Malignant")
)

# 6. Create confusion matrix
conf_matrix <- table(
  Actual = test_data$diagnosis,
  Predicted = predictions
)

print(conf_matrix)

# 7. Save confusion matrix
write.csv(
  as.data.frame.matrix(conf_matrix),
  "results/confusion_matrix.csv"
)

# 8. Confusion matrix visualization
png(
  "results/figures/confusion_matrix.png",
  width = 800,
  height = 600
)

fourfoldplot(
  conf_matrix,
  color = c("lightblue", "salmon"),
  main = "Confusion Matrix - Logistic Regression"
)

dev.off()

print("Results visualization completed!")
