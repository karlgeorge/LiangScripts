bash SETTINTS.sh
CUDA_VISIBLE_DEVICES=0,1,2,3
python -u train.py --task language_modeling $COMPILED_DATA \
  --save-dir checkpoints/transformer_wikitext-103 --arch transformer_lm_wiki103 \
  --max-update 286000 --max-lr 1.0 --t-mult 2 --lr-period-updates 270000 --lr-scheduler cosine --lr-shrink 0.75 \
  --warmup-updates 16000 --warmup-init-lr 1e-07 --min-lr 1e-09 --optimizer nag --lr 0.0001 --clip-norm 0.1 \
  --criterion adaptive_loss --max-tokens 3072 --update-freq 2 --tokens-per-sample 3072 --seed 1 \
  --sample-break-mode none --skip-invalid-size-inputs-valid-test --ddp-backend=no_c10d