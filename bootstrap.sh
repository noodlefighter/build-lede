#!/usr/bin/env bash

set -e

echo "deb http://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list
echo "deb http://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list

apt-get update
apt-get install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
        bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
        git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
        libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
        mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils \
        rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev \
        proxychains4
apt-get clean
ln -sf bash /bin/sh
