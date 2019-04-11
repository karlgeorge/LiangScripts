source SETTINGS.sh
python -u preprocess.py --source-lang zh --target-lang en \
        --trainpref $TRAIN_SET/$TRAIN_DATA \
        --validpref $TEXT/$VALID_DATA \
        --testpref $TEXT/${TEST_DATA} \
        --destdir data-bin/$NAME \
        --nwordssrc 40000 --nwordstgt 32768
