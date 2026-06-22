#!/bin/bash
PYTHON=/home/p3766/miniconda3/envs/misdd_mm/bin/python
ORIGINAL=/home/p3766/MISDD-MM/MISDD_MM/model.py
BACKUP=/home/p3766/MISDD-MM/MISDD_MM/model_full.py

for config in innov2_only innov3_only innov4_only innov1_3 innov1_4; do
    echo "Testing $config..."
    cp ~/MISDD-MM/ablation_models/model_${config}.py $ORIGINAL
    WANDB_MODE=offline $PYTHON train_cls.py \
        --dataset mvtec3d --class_name bagel \
        --missing_type both --missing_rate 0.7 \
        --seed 111 --Epoch 2 > /tmp/test_${config}.log 2>&1
    if [ $? -eq 0 ]; then
        echo "  PASS: $config"
    else
        echo "  FAIL: $config"
        tail -5 /tmp/test_${config}.log
    fi
    cp $BACKUP $ORIGINAL
done
echo "All tests done"
