#!/bin/bash
export $(egrep -v '^#' .env | xargs)

# Create new folder
cd ..
if [ ! -d "$NEW_FOLDER_NAME" ];
then
    mkdir $NEW_FOLDER_NAME
fi

# Count total folder test
DIR=$FOLDER_PATH;
TOTAL=$(find $DIR -mindepth 1 -type d | wc -l);

# Copy testcase to new folder
NEW_DIR=./"$NEW_FOLDER_NAME"
PREFIX_TC="0"
for ((i = 1; i <= $TOTAL; i++))
do
    if (($i < 10))
    then
        PREFIX_TC="0$i";
    else
        PREFIX_TC="$i";
    fi
    FOLDER_TC="Test$PREFIX_TC"
    cp $FOLDER_PATH/$FOLDER_TC/Sprime.INP $NEW_DIR/"test0$PREFIX_TC.txt";
    cp $FOLDER_PATH/$FOLDER_TC/Sprime.OUT $NEW_DIR/"out0$PREFIX_TC.txt"
done
