#!/bin/bash
# run_lin_reg.sh
# Bash script that runs BOTH the Python and R linear regression tools.

set -e

if [ "$#" -ne 3 ]; then
  echo "Usage: bash run_lin_reg.sh <filename> <x_column> <y_column>"
  echo "Example: bash run_lin_reg.sh regression_data.csv YearsExperience Salary"
  exit 1
fi

FILENAME="$1"
X_COLUMN="$2"
Y_COLUMN="$3"

echo "======================================"
echo "Running Python linear regression..."
echo "======================================"
python python_lin_reg.py "$FILENAME" "$X_COLUMN" "$Y_COLUMN"

echo ""
echo "======================================"
echo "Running R linear regression..."
echo "======================================"
Rscript r_lin_reg.r "$FILENAME" "$X_COLUMN" "$Y_COLUMN"

echo ""
echo "======================================"
echo "Exporting notebooks to HTML..."
echo "======================================"
jupyter nbconvert --to html python_lin_reg.ipynb
jupyter nbconvert --to html r_lin_reg.ipynb

echo ""
echo "Done."
echo "Created:"
echo "  - lin_reg_py_output.png"
echo "  - lin_reg_r_output.png"
echo "  - python_lin_reg.html"
echo "  - r_lin_reg.html"
