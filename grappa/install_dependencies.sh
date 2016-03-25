#!/bin/bash

apt-get update
apt-get install -y \
  libboost1.55-all-dev \
  wget \
  make \
  ninja-build \
  git \
  openssh-server \
  bash-completion \
  man \
  openssl
  
#cmake \

# cmake 3.12+
cd /root
wget https://cmake.org/files/v3.5/cmake-3.5.1-Linux-x86_64.sh && \
   chmod +x cmake-3.5.1-Linux-x86_64.sh && \
   ./cmake-3.5.1-Linux-x86_64.sh

# install gcc 4.8
apt-get install python-software-properties
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-4.8
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
apt-get install g++-4.8
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

# build recent version of Ruby
cd /root
wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz && \
  tar xzf ruby-2.1.2.tar.gz && \
  cd ruby-2.1.2 && \
  ./configure && \
  make && \
  make install


# build OpenMPI
cd /root
wget http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.1.tar.gz && \
  tar xzf openmpi-1.8.1.tar.gz && \
  cd openmpi-1.8.1 && \
  CC=$(which gcc) CXX=$(which g++) ./configure --enable-contrib-no-build=vt --prefix=/usr && \
  make && \
  make install

cd /root

# clean up
rm -rf openmpi-1.8.1* ruby-2.1.2*
