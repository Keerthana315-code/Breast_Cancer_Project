
# =====================================
# EDA SUMMARY
# =====================================

# Load cleaned dataset
breast_cancer <- read.csv("data/breast_cancer_clean.csv")

# 1. Overall summary
summary(breast_cancer)

# 2. Compare selected features by diagnosis
group_summary <- aggregate(
  cbind(mean_radius, mean_texture, mean_perimeter,
        mean_area, mean_smoothness) ~ diagnosis,
  data = breast_cancer,
  FUN = mean
)

print(group_summary)

# 3. Save summary results
write.csv(
  group_summary,
  "results/eda_group_summary.csv",
  row.names = FALSE
)

# 4. Display completion message
print("EDA summary completed successfully!")
