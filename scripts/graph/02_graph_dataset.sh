#!/bin/bash

#SBATCH --job-name="gp_02_graph_dataset"
#SBATCH --output=logs/%x_%j.log
#SBATCH --error=logs/%x_%j.err
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=40G
#SBATCH --gres=gpu:1
#SBATCH --partition=all_usr_prod
#SBATCH --account=cvcs2026

source "${VENV_DIR:-$HOME/floorplan-env}/bin/activate"
source "${PROJECT_DIR:-${SLURM_SUBMIT_DIR:-$PWD}}/scripts/graph/_common.sh"

cd "$PROJECT_DIR"

rm -rf embeddings/graph/rplan/processed/

python -c "from src.graph.graph_dataset import RplanGraphDataset; print(RplanGraphDataset())"