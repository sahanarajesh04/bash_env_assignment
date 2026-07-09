#!/usr/bin/env python3
"""Standalone CLI script for linear regression (converted from python_lin_reg.ipynb)."""

import sys

import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score


def main() -> None:
    if len(sys.argv) != 4:
        print("Usage: python python_lin_reg.py <filename> <x_column> <y_column>")
        sys.exit(1)

    filename, x_col, y_col = sys.argv[1], sys.argv[2], sys.argv[3]

    data = pd.read_csv(filename)
    if x_col not in data.columns or y_col not in data.columns:
        print(f"Error: columns must be one of {list(data.columns)}")
        sys.exit(1)

    X = data[[x_col]]
    y = data[y_col]

    model = LinearRegression()
    model.fit(X, y)
    predictions = model.predict(X)

    r2 = r2_score(y, predictions)
    rmse = mean_squared_error(y, predictions) ** 0.5

    plt.figure(figsize=(8, 6))
    plt.scatter(data[x_col], data[y_col], color="red", label="Observations")
    plt.plot(data[x_col], predictions, color="blue", label="Regression line")
    plt.title(f"{y_col} vs {x_col}")
    plt.xlabel(x_col)
    plt.ylabel(y_col)
    plt.legend()
    plt.savefig("lin_reg_py_output.png", dpi=150, bbox_inches="tight")
    plt.close()

    print(f"Intercept: {model.intercept_:.2f}")
    print(f"Coefficient ({x_col}): {model.coef_[0]:.2f}")
    print(f"R-squared: {r2:.4f}")
    print(f"RMSE: {rmse:.2f}")
    print("Plot saved to lin_reg_py_output.png")


if __name__ == "__main__":
    main()
