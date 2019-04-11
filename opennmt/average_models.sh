source ./SETTINGS.sh
export CUDA_VISIBLE_DEVICES=3
declare -i i
for((i=$1;i+4<=$2;i=i+$3));
do
python $TOOLS/average_models.py -m {$MODEL_DIR/${MODEL_NAME}${i}000.pt,$MODEL_DIR/${MODEL_NAME}$((i+1))000.pt,$MODEL_DIR/${MODEL_NAME}$((i+2))000.pt,$MODEL_DIR/${MODEL_NAME}$((i+3))000.pt,$MODEL_DIR/${MODEL_NAME}$((i+4))000.pt} \
-o $MODEL_DIR/${MODEL_NAME}_5avg_${i}000.pt
done
