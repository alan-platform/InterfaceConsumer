#!/bin/bash
set -e

node node_modules/tslint/lib/tslint-cli.js --project tslint.json src/index.ts
node node_modules/tslint/lib/tslint-cli.js --project tslint.json src/consumeInterface.ts

set +e
node node_modules/.bin/tsc -p src >> /dev/null
set -e

rm -fr                        build/npm
cp -r build/js                build/npm
cp    src/LICENSE             build/npm
cp    src/package.json        build/npm
cp -r src/lib/stream_handler  build/npm/lib/stream_handler
