#!/bin/bash

if test ! -f tla.zip; then
    curl -f -Ss -R -O https://tla.msr-inria.inria.fr/tlatoolbox/dist/tla.zip
fi

rm -rf tla
unzip tla.zip >/dev/null
cd tla
zip -r ../tla.jar * >/dev/null

cd ..
touch -r tla.zip tla.jar

rm -rf tla

java -cp tla.jar tlc2.TLC |grep Version
