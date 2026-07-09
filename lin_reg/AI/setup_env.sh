#!/bin/bash
# setup_env.sh
# This script builds the tools this project needs.
# Run it once before you use the notebooks or scripts.

set -e

echo "=== Step 1: Load conda (if you are on the class cluster) ==="
if command -v module >/dev/null 2>&1; then
  module load miniconda3/24.1.2-py310 2>/dev/null || true
fi

echo "=== Step 2: Create or update the conda environment ==="
conda env update -f environment.yml --prune

echo "=== Step 3: Activate the environment ==="
# shellcheck disable=SC1091
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate lin_reg_env

echo "=== Step 4: Install extra Python packages with pip ==="
pip install -r requirements.txt

echo "=== Step 5: Register notebook kernels ==="
python -m ipykernel install --user --name lin_reg_env --display-name "Python (lin_reg_env)"
Rscript -e 'IRkernel::installspec(name="ir_lin_reg_env", displayname="R (lin_reg_env)", user=TRUE)'

echo ""
echo "Setup complete."
echo "Next steps:"
echo "  conda activate lin_reg_env"
echo "  bash run_lin_reg.sh regression_data.csv YearsExperience Salary"
