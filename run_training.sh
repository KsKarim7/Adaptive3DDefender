#!/bin/bash
if pgrep -f train_cls.py > /dev/null; then
    exit 0
fi
export PATH=/usr/local/cuda-11.8/bin:/usr/bin:/bin:/home/p3766/miniconda3/envs/misdd_mm/bin:/home/p3766/miniconda3/bin
export CUDA_HOME=/usr/local/cuda-11.8
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
export CC=/usr/bin/gcc-11
export CXX=/usr/bin/g++-11
source /home/p3766/miniconda3/etc/profile.d/conda.sh
source activate misdd_mm
cd /home/p3766/MISDD-MM
nohup bash /home/p3766/MISDD-MM/run_seed222_09.sh >> /home/p3766/MISDD-MM/seed_sweep.log 2>&1 &
