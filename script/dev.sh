#!/usr/bin/env bash

set -e

./node_modules/.bin/webpack --colors --progress --watch --devtool inline-source-map &
./node_modules/.bin/fsmonitor -p -s -d build/ script/dev_fixup.sh

kill %1
