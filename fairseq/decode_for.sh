PROJECT=/home/zhangliang/fairseq
model=transformer_zhen_mulit_xjyyx_mean_test_4
MODEL_DIR=$PROJECT/checkpoints/$model
TEXT=$PROJECT/data-bin
export CUDA_VISIBLE_DEVICES=1
echo $$ >> pid.txt
list=`seq $1 $2`
for i in $list
do
python generate.py $TEXT/base_zhen_new \
    --path $MODEL_DIR/checkpoint${i}.pt  \
    --beam 5 --batch-size 250 \
    --gen-subset test \
    --remove-bpe | tee fair.out_7


grep ^H fair.out_7 | cut -f1,3- | cut -c3- | sort -k1n | cut -f2-   > pred.out_7

echo checkpoint_${i}.pt >> checkpoints/$model/result.txt
ref=$PROJECT/data/mfd/mt03_u8.en.low
perl eval/multi-bleu.perl  ${ref} < $PROJECT/pred.out_7  >> checkpoints/$model/result.txt
done
