source SETTINGS.sh

export CUDA_VISIBLE_DEVICES=1
echo $$ >> pid.txt
list=`seq $1 $2`
for j in {2,3,4,5,6,8}
do
TEXT_PER=mt0${j}_u8
SUBSET=test$[j-3]
if (( "$j" == 2 )); then
	SUBSET=valid
elif (( "$j" == 3 )); then
	SUBSET=test
elif (( "$j"== 8 )); then
	SUBSET=test4
fi
echo $TEXT_PER
echo $SUBSET

for i in $list
do

python -u generate.py $COMPILED_DATA_DIR \
    --path $MODEL_DIR/checkpoint${i}.pt  \
    --beam 4 --batch-size 250 \
    --lenpen 0.6 \
    --gen-subset $SUBSET \
    --remove-bpe > translate.log


grep ^H translate.log | cut -f1,3- | cut -c3- | sort -k1n | cut -f2-   > $EXPERIMENT_DIR/translate_out.log

echo checkpoint_${i}.pt >> $MODEL_DIR/result_${TEXT_PER}.txt
ref=$PURE_DATA_DIR/$TEXT_PER.en.low
perl eval/multi-bleu.perl  ${ref} < $EXPERIMENT_DIR/translate_out.log  >> $MODEL_DIR/result_${TEXT_PER}.txt
done
done
