#!/bin/bash

rm -rf openssl-1.0.2h/
tar xzf openssl-1.0.2h.tar.gz
chmod a+x setenv-android-arm64.sh

. ./setenv-android-x86.sh

cd openssl-1.0.2h/

perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org
./config shared no-ssl2 no-ssl3 no-hw  --openssldir=/usr/local/ssl/android19

make clean
make depend
make all

sudo -E make install CC=$ANDROID_TOOLCHAIN/i686-linux-android-gcc RANLIB=$ANDROID_TOOLCHAIN/i686-linux-android-gcc-ranlib

