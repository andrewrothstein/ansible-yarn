#!/usr/bin/env sh
#set -x
DIR=~/Downloads
MIRROR=https://github.com/yarnpkg/yarn/releases/download

dl_ver()
{
    local ver=$1
    local file=yarn-v${ver}.tar.gz
    local url=$MIRROR/v${ver}/${file}
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver `sha256sum $lfile | awk '{print $1}'`
}

dl_ver ${1:-1.22.1}
