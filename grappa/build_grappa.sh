#!/bin/bash

if [ $USER = root ]; then
    echo "Must run as non-root user"
fi

pushd $HOME
git clone https://github.com/uwsampa/grappa.git grappa

cd grappa && \
    ./configure --cc=$(which gcc) --gen=Make #\
#          --third-party=/grappa-third-party && \
# TODO download prebuilt third party
cd build/Make+Release && \
make -j 2
