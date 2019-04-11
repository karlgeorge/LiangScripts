python preprocess.py \
-train_src /home/zhangliang/train_set/train_bpe30k.shuf.zh \
-train_tgt /home/zhangliang/train_set/train_bpe30k.shuf.en \
-valid_src /home/zhangliang/pure/mt02_u8.zh \
-valid_tgt /home/zhangliang/pure/mt02_u8.en \
-src_seq_length 256 \
-tgt_seq_length 256 \
-lower \
-save_data data/base_zhen/base_zhen
