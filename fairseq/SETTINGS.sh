#!usr/bin/bash
HOME_DIR=~/
CORPUS=$HOME_DIR/Corpus
RAW=$CORPUS/raw
PURE_DATA_DIR=$RAW/pure
CORPUS_NAME=nist_zh-en
COMPILED=$CORPUS/compiled
EXPERIMENT_DIR=${HOME_DIR}/fairseq
EXPERIMENT_NAME=LINEAR
EXPERIMENT_ARCH=transformer_sp
MODEL_DIR=$EXPERIMENT_DIR/checkpoints/$EXPERIMENT_NAME
RAW_DATA_DIR=$RAW/$CORPUS_NAME
COMPILED_DATA_DIR=$COMPILED/$CORPUS_NAME

TRAIN_DATA=$RAW_DATA_DIR/train_bpe30k.shuf
VALID_DATA=$PURE_DATA_DIR/mt02_u8
TEST_DATA=$PURE_DATA_DIR/mt03_u8,$PURE_DATA_DIR/mt04_u8,$PURE_DATA_DIR/mt05_u8,$PURE_DATA_DIR/mt06_u8,$PURE_DATA_DIR/mt08_u8
TOOLS=$EXPERIMENT_DIR/tools

mkdir -p $EXPERIMENT_DIR
mkdir -p $MODEL_DIR
mkdir -p $COMPILED_DATA_DIR
mkdir -p $RAW_DATA_DIR
mkdir -p $PURE_DATA_DIR
