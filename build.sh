#!/bin/bash
# Load system CUDA and set vars
module load cuda/12.4
export CUDA_HOME=/appl/cuda/12.4.0/bin/nvcc  #$CUDA_ROOT

# Activate conda env
source ~/miniforge3/etc/profile.d/conda.sh
conda activate HunyuanWorld

# Re-export CUDA vars after activation to be safe
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# Upgrade pip tooling
pip install --upgrade pip setuptools wheel

# Install flash-attn first so it compiles with the cluster CUDA
CUDA_HOME=$CUDA_HOME pip install --no-cache-dir flash-attn==2.8.3

# Update remaining packages (make sure YAML has only https:// Git URLs)
conda env update -f docker/HunyuanWorld.yaml --prune
