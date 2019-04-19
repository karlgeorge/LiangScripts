source SETTINGS.sh
python -u preprocess.py --source-lang zh --target-lang en \
        --trainpref $TRAIN_DATA \
        --validpref $VALID_DATA \
        --testpref $TEST_DATA \
        --destdir $COMPILED_DATA_DIR \
        --nwordssrc 32768 --nwordstgt 32768
