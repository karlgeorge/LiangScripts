#CUDA_VISIBLE_DEVICES=1
#update-freq
exp=transformer_zhen_mulit_xjyyx_mean_test_4
mkdir checkpoints/$exp
cp -r fairseq checkpoints/$exp
#--update-freq 2 \
#CUDA_VISIBLE_DEVICES=4,5,6,7
export CUDA_VISIBLE_DEVICES=1
python -u train.py data-bin/base_zhen_new \
  --arch transformer_wmt_en_de --optimizer adam --lr 0.0005 -s zh -t en \
  --clip-norm 0.0 \
  --lr-scheduler inverse_sqrt --warmup-init-lr 1e-07 --warmup-updates 4000 \
  --lr 0.0005 --min-lr 1e-09 \
  --update-freq 8 \
  --max-epoch 60 \
  --dropout 0.2 --weight-decay 0.0 --criterion label_smoothed_cross_entropy \
  --label-smoothing 0.1 --max-tokens 4096 \
  --no-progress-bar --save-interval-updates 10000 \
  --keep-interval-updates 20 --log-interval=50\
  --save-dir checkpoints/$exp
