#!/bin/bash

# SLURM GPU Job

#SBATCH --job-name=${JOB_NAME}
#SBATCH --output=${JOB_NAME}_%A_%a.out
#SBATCH --error=${JOB_NAME}_%A_%a.err
#SBATCH --array=0-10%1
#SBATCH --time=24:00:00
#SBATCH --partition=${PARTITION}
#SBATCH --ntasks=7
#SBATCH --gres=gpu:1


