#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_NAME="hello-env"

if ! command -v conda &>/dev/null; then
  echo "Error: conda is not installed or not on PATH." >&2
  exit 1
fi

if conda env list | awk '{print $1}' | grep -qx "${ENV_NAME}"; then
  echo "Updating existing conda environment '${ENV_NAME}' ..."
  conda env update -n "${ENV_NAME}" -f "${SCRIPT_DIR}/environment.yml" --prune
else
  echo "Creating conda environment '${ENV_NAME}' from environment.yml ..."
  conda env create -f "${SCRIPT_DIR}/environment.yml"
fi

echo "Installing Python packages from requirements.txt ..."
conda run -n "${ENV_NAME}" pip install -r "${SCRIPT_DIR}/requirements.txt"

echo
echo "Environment ready. Activate with:"
echo "  conda activate ${ENV_NAME}"
echo
echo "Run the hello scripts:"
echo "  bash ${SCRIPT_DIR}/hello.sh"
echo "  python ${SCRIPT_DIR}/hello.py"
echo "  Rscript ${SCRIPT_DIR}/hello.R"
