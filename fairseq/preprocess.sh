source SETTINGS.sh
python -u preprocess.py --source-lang zh --target-lang en \
        --trainpref $RAW_DATA_DIR/$TRAIN_DATA \
        --validpref $PURE_DATA_DIR/$VALID_DATA \
        --testpref $PURE_DATA_DIR/$TEST_DATA \
        --destdir $CONPILED_DATA_DIR \
        --nwordssrc 40000 --nwordstgt 32768
