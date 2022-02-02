#!/bin/bash
#SBATCH -J dep                      # Job name
##SBATCH -o JOB_%A_%a.out                # Name of stdout output log file (%j expands to jobID)
#SBATCH -e dep_%j.err                # Name of stderr output log file (%j expands to jobID)
#SBATCH -N 1                            # Total number of nodes requested
#SBATCH -n 1                            # Total number of cores requested
#SBATCH --mem=50000                     # Total amount of (real) memory requested (per node)
#SBATCH -t 02-00:00:00                  # Time limit (hh:mm:ss)
#SBATCH --partition=compling          # Request partition for resource allocation
#SBATCH --array 1-5

# These lines activate your conda environment for the job
# Replace CONDA_ENV_NAME with your environment name
eval "$(conda shell.bash hook)"
conda activate cluster-env

# Template SLURM script which adapts 25 models to the
#   Wikitext-2 validation partition while outputting word-level
#   complexity measures (like surprisal)
#   Pre-trained models from
#   van Schijndel et al (2019) https://zenodo.org/record/3559340
# Shows how to use SLURM arrays to dynamically determine job parameters

### JOB-SPECIFIC VARS 1
### (there's another set just before the main command at the bottom)

time python dependency_parsing.py wiki.train.tokens.${SLURM_ARRAY_TASK_ID}.toks