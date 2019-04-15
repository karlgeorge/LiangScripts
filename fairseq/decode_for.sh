source SETTINGS.sh

export CUDA_VISIBLE_DEVICES=1
echo $$ >> pid.txt
list=`seq $1 $2`
for j in {2,3,4,5,6,8}
do
TEXT_PER=mt0${j}_u8
for i in $list
do

python -u interactive.py $COMPILED_DATA_DIR \
    --path $MODEL_DIR/checkpoint${i}.pt  \
    --beam 4 --batch-size 250 \
    --input $PURE_DATA_DIR/${TEXT_PER}.zh \
    --remove-bpe > fair.out_7


grep ^H fair.out_7 | cut -f1,3- | cut -c3- | sort -k1n | cut -f2-   > $EXPERIMENT_DIR/pred.out_7

echo checkpoint_${i}.pt >> $MODEL_DIR/result_${TEXT_PER}.txt
ref=$PURE_DATA_DIR/$TEXT_PER.en.low
perl eval/multi-bleu.perl  ${ref} < $EXPERIMENT_DIR/pred.out_7  >> $MODEL_DIR/result_${TEXT_PER}.txt
done
done
