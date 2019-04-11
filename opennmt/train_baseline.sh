source ./SETTINGS.sh

export CUDA_VISIBLE_DEVICES=0


# sh average_models.sh 9 19 2 


python -u train.py -data $TRAIN_DATA_DIR/base_zhen -save_model $MODEL_DIR/checkpoint \
        -layers 6 \
        -rnn_size 512 -word_vec_size 512 -transformer_ff 2048 -heads 8 \
        -encoder_type transformer -decoder_type transformer -position_encoding \
        -train_steps 44000  -max_generator_batches 10 -dropout 0.1 -report_every 50 \
        -batch_size 4096 -batch_type tokens -normalization tokens  -accum_count 8 \
        -optim adam -adam_beta1 0.9 -adam_beta2 0.98 -decay_method noam -warmup_steps 8000 -learning_rate 2 \
        -max_grad_norm 0 -param_init 0  -param_init_glorot \
        -label_smoothing 0.1 -valid_steps 1000 -save_checkpoint_steps 1000 -keep_checkpoint 15 --share_decoder_embeddings \
        -world_size 1 --gpu_ranks 0 \
#	-train_from $MODEL_DIR/checkpoint_step_30000.pt >> train.3.log

#sh decode_base_zhen.sh 26000 44000 1000 
#sh average_models.sh 26 40 2 
#sh decode_5_average.sh 26000 40000 2000


