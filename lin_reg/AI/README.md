# Linear Regression Project (Python + R + Bash)

This folder is a **small, self-contained project**. It reads a CSV file, makes a scatter plot, fits a straight-line model (linear regression), draws the line on the plot, and checks how good the fit is.

Everything you need lives in `lin_reg/AI`.

---

## What is in this folder?

| File | What it does (in plain English) |
|------|----------------------------------|
| `regression_data.csv` | The data file (years of experience and salary) |
| `python_lin_reg.ipynb` | Python notebook — step-by-step, clickable version |
| `r_lin_reg.ipynb` | R notebook — same analysis in R |
| `python_lin_reg.py` | Python script you run from the terminal |
| `r_lin_reg.r` | R script you run from the terminal |
| `run_lin_reg.sh` | **Bash script** that runs Python, R, and HTML export for you |
| `environment.yml` | List of software packages for **conda** |
| `requirements.txt` | List of extra Python packages for **pip** |
| `setup_env.sh` | One script that installs everything |
| `lin_reg_py_output.png` | Picture made by the Python script |
| `lin_reg_r_output.png` | Picture made by the R script |
| `python_lin_reg.html` | Saved web page version of the Python notebook |
| `r_lin_reg.html` | Saved web page version of the R notebook |

---

## The 3 setup files (explained simply)

### 1. `environment.yml` — the "big toolbox" list

Think of this like a shopping list for **conda** (a program that installs other programs).

It says: "Please install Python, R, Jupyter, pandas, matplotlib, and the other tools this project needs."

The environment is named `lin_reg_env` so it does not mix with other class projects.

### 2. `requirements.txt` — extra Python tools

Some Python tools are installed with **pip** (another installer).

This file is a short list of Python packages. `setup_env.sh` runs `pip install -r requirements.txt` after conda finishes.

### 3. `setup_env.sh` — the "set everything up" button

This is a **Bash script**. Bash is the language your terminal speaks.

When you run it, it:

1. Loads conda (on the cluster)
2. Creates the `lin_reg_env` environment
3. Installs pip packages
4. Registers Python and R kernels so Jupyter can use them

**Run setup once:**

```bash
cd lin_reg/AI
bash setup_env.sh
```

Then, before working, turn the environment on:

```bash
conda activate lin_reg_env
```

---

## How to run the project

### Easiest way: use the Bash script

The Bash script `run_lin_reg.sh` calls Python and R for you, then saves HTML copies of the notebooks.

```bash
cd lin_reg/AI
conda activate lin_reg_env
bash run_lin_reg.sh regression_data.csv YearsExperience Salary
```

The three pieces of information after the script name are:

1. **filename** — which CSV to read (`regression_data.csv`)
2. **x_column** — the column on the horizontal axis (`YearsExperience`)
3. **y_column** — the column on the vertical axis (`Salary`)

### Run Python by itself

```bash
python python_lin_reg.py regression_data.csv YearsExperience Salary
```

### Run R by itself

```bash
Rscript r_lin_reg.r regression_data.csv YearsExperience Salary
```

### Open the notebooks in Jupyter

```bash
jupyter lab python_lin_reg.ipynb
jupyter lab r_lin_reg.ipynb
```

Pick the kernels named **Python (lin_reg_env)** or **R (lin_reg_env)** when Jupyter asks.

---

## What the analysis does

1. **Read the CSV** — load the table into memory
2. **Scatter plot** — draw dots for each row (red points)
3. **Fit a line** — find the best straight line through the dots
4. **Overlay the line** — draw the line on top of the dots (blue line)
5. **Evaluate** — print numbers like R-squared (how well the line fits)

On this dataset, R-squared is about **0.785**, which means the line explains a good chunk of the pattern.

---

## Output files

| Output | Made by |
|--------|---------|
| `lin_reg_py_output.png` | Python script |
| `lin_reg_r_output.png` | R script |
| `python_lin_reg.html` | Bash script (`run_lin_reg.sh`) or manual `nbconvert` |
| `r_lin_reg.html` | Bash script (`run_lin_reg.sh`) or manual `nbconvert` |

---

## Quick glossary

- **CSV** — a simple spreadsheet saved as text
- **Terminal** — the text window where you type commands
- **Conda** — installs groups of tools into named "environments"
- **Pip** — installs Python tools one list at a time
- **Jupyter notebook** — a document that mixes explanation, code, and results
- **Linear regression** — finding the best straight line to describe a relationship
- **Bash script** — a saved list of terminal commands that run in order
