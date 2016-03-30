#!/bin/bash

if [ $USER = root ]; then
    echo "Must run as non-root user"
fi

pushd $HOME
git clone https://github.com/uwsampa/grappa.git grappa
# TODO fix grappa PR #275
cd grappa && \
   git fetch && \
   git checkout bmyerz/libunwind && \
   cd ..

cd grappa && \
    ./configure --cc=$(which gcc) --gen=Make #\
#          --third-party=/grappa-third-party && \
# TODO download prebuilt third party
cd build/Make+Release && \
make -j 2
