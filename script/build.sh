#!/usr/bin/env bash

set -e

FILE_PATH="build/$BUILD_FILE"

./node_modules/.bin/webpack --config webpack.config.js -p
cat $FILE_PATH | sed -E 's/^.{1}//' > build/temp
echo -e "return $(cat build/temp)" > $FILE_PATH
rm build/temp

echo 'built!'
