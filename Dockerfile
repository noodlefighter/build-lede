FROM daocloud.io/library/ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y apt-transport-https apt-utils \
    && apt-get install -y --reinstall ca-certificates \
    && apt-get clean

RUN echo "deb https://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list \
    && echo "deb https://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb https://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb https://mirrors.sjtug.sjtu.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y ssh sudo \
        ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
        bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
        git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
        libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
        mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils \
        rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev \
        proxychains4 \
    && apt-get clean \
    && ln -sf bash /bin/sh
 
COPY gosu-amd64 /usr/local/bin/gosu
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY tmp/id_rsa.pub /authorized_keys
RUN chmod +x /usr/local/bin/gosu \
    && chmod a+x /usr/local/bin/docker-entrypoint.sh \
    && useradd --shell /bin/bash -c "" -m vagrant \
    && echo -n 'vagrant:vagrant' | chpasswd \
    && echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant \
    && chmod 440 /etc/sudoers.d/vagrant \
    && mkdir -p /home/vagrant/.ssh \
    && chmod 700 /home/vagrant/.ssh \
    && mv /authorized_keys /home/vagrant/.ssh/authorized_keys \
    && chmod 600 /home/vagrant/.ssh/authorized_keys \
    && chown -R vagrant:vagrant /home/vagrant/.ssh \
    && sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers \
    && sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

