#!/usr/bin/env bash

FILE_PATH="build/$BUILD_FILE"
OUTPUT_PATH="../grafana/app/dashboards/$BUILD_FILE"

echo 'adding return stmt'
echo -e "return $(cat $FILE_PATH)" > temp.js

echo "moving to $OUTPUT_PATH"
mv temp.js $OUTPUT_PATH
