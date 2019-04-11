source ./SETTINGS.sh

for((i=$1;i<=$2;i=i+$3))
do
for((j=2;j<=8;j=j+1))
do
MT=mt0${j}_u8
echo ${MT}
CUDA_VISIBLE_DEVICES=1 python translate.py -src $TEXT/$MT.zh \
    --tgt $TEXT/$MT.en \
    --gpu 0 \
    --model $MODEL_DIR/checkpoint_step__5avg_${i}.pt  \
    --beam_size 4 --batch_size 200 \
    --length_penalty wu --alpha 0.6 --max_length 150 \
    --report_bleu 

echo checkpoint_5avg_${i}.pt >> $MODEL_DIR/result_5avg_$MT.txt
ref=$HOME/pure/$MT.en.low
sed -r 's/(@@ )|(@@ ?$)//g' pred.txt > pred.out
perl eval/multi-bleu.perl  ${ref} < $EXPERIMENT_DIR/pred.out  >> $MODEL_DIR/result_5avg_$MT.txt
done
done

