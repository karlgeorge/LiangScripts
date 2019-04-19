source SETTINGS.sh
export CUDA_VISIBLE_DEVICES=2
python -u train.py $COMPILED_DATA_DIR \
    --arch $EXPERIMENT_ARCH \
    --save-dir $MODEL_DIR \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr-scheduler inverse_sqrt --warmup-init-lr 1e-07 --warmup-updates 4000 \
    --lr 0.0007 --min-lr 1e-09 --me 20 \
    --dropout 0.1 --attention-dropout 0.0 --relu-dropout 0.0 --weight-decay 0.0 --criterion label_smoothed_cross_entropy \
    --label-smoothing 0.1 --max-tokens 4096 --update-freq 8 \
    --no-progress-bar --log-format json --log-interval 10 --save-interval-updates 1000 \
    --keep-interval-updates 5
# average last 5 checkpoints
#modelfile=checkpoints
#python -u scripts/average_checkpoints.py --inputs $modelfile --num-update-checkpoints 5 \
#    --output $modelfile/average-model.pt
