#!/usr/bin/env sh
VER=${1:-1.19.0}
DIR=~/Downloads
MIRROR=https://github.com/yarnpkg/yarn/releases/download/v$VER
FILE=yarn-v$VER.tar.gz
URL=$MIRROR/$FILE
LFILE=$DIR/$FILE

if [ ! -e $LFILE ];
then
    wget -q -O $LFILE $URL
fi

printf "  # %s\n" $URL
printf "  '%s': sha256:%s\n" $VER `sha256sum $LFILE | awk '{print $1}'`


