#!/usr/bin/env Rscript
# Standalone CLI script for linear regression (converted from r_lin_reg.ipynb)

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 3) {
  stop("Usage: Rscript r_lin_reg.r <filename> <x_column> <y_column>")
}

filename <- args[1]
x_col <- args[2]
y_col <- args[3]

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("ggplot2 is required. Install it with install.packages('ggplot2').")
}

data <- read.csv(filename)
if (!(x_col %in% names(data)) || !(y_col %in% names(data))) {
  stop(paste("Error: columns must be one of", paste(names(data), collapse = ", ")))
}

formula <- as.formula(paste(y_col, "~", x_col))
model <- lm(formula, data = data)

predictions <- predict(model, newdata = data)
r_squared <- summary(model)$r.squared
rmse <- sqrt(mean((data[[y_col]] - predictions)^2))

plot <- ggplot2::ggplot(data, ggplot2::aes(x = .data[[x_col]], y = .data[[y_col]])) +
  ggplot2::geom_point(color = "red") +
  ggplot2::geom_line(
    ggplot2::aes(y = predictions),
    color = "blue"
  ) +
  ggplot2::ggtitle(paste(y_col, "vs", x_col)) +
  ggplot2::xlab(x_col) +
  ggplot2::ylab(y_col)

ggplot2::ggsave("lin_reg_r_output.png", plot, width = 8, height = 6, dpi = 150)

cat("Intercept:", coef(model)[1], "\n")
cat("Coefficient (", x_col, "):", coef(model)[2], "\n", sep = "")
cat("R-squared:", round(r_squared, 4), "\n")
cat("RMSE:", round(rmse, 2), "\n")
cat("Plot saved to lin_reg_r_output.png\n")
