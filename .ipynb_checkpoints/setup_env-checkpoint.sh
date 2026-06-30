#!/bin/bash

# Load Miniconda
module load miniconda3/24.1.2-py310

# Create Conda environment
conda env create -f environment.yml

# Activate the environment
conda activate 7030_class_1

# Install optional pip packages
# pip install -r requirements.txt

# Register Python kernel
python -m ipykernel install --user --name 7030_class_1 --display-name "Python (7030_class_1)"

# Register R kernel
Rscript -e 'IRkernel::installspec(name="ir_7030_class_1", displayname="R (7030_class_1)")'

# Start JupyterLab
jupyter lab --no-browser --port=2000