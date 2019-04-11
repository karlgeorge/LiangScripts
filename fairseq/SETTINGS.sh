#!usr/bin/bash
EXPERIMENT_DIR=~/fairseq
NAME=EXP
MODEL_DIR=$EXPERIMENT_DIR/checkpoints/$NAME
TRAIN_DATA_DIR=$EXPERIMENT_DIR/data-bin/$NAME
TEXT=~/pure
TRAIN_SET=~/train_set
TRAIN_DATA=train_bpe30k.shuf
VALID_DATA=mt02_u8
TEST_DATA=mt03_u8
TOOLS=$EXPERIMENT_DIR/tools
MODEL_NAME=checkpoint_step_
mkdir -p $EXPERIMENT_DIR
mkdir -p $MODEL_DIR
mkdir -p $TRAIN_DATA_DIR

