Usage:

依赖的工具

- vagrant
- vagrant scp plugin (安装命令 vagrant plugin install vagrant-scp)
- virtualbox


初始化环境

```

拉取子模块
$ cd this_repo/
$ git submodule update --init --recursive

可选，如果需要代理，修改PROXY_HOST为自己的代理
$ vi ./scripts/setenv
展开环境变量
$ source ./scripts/setenv
可选，如果需要代理，执行这条，同理在虚拟机环境内也可以这样操作
$ setproxy
展开虚拟机环境
$ vagrant up
```

进入虚拟机环境，构建

```
$ vagrant ssh

(虚拟机内)
$ source $HOME/scripts/setenv
配置代理
$ setproxy
$ cd $HOME/lede
拉取feeds
$ ./scripts/feeds update -a
$ ./scripts/feeds install -a
编辑配置，下载源码包
$ make menuconfig
$ make download -j8
$ make -j8
```


常用操作：
```
手动执行同步
$ vagrant rsync
取出构建结果
$ ./scripts/fetch.sh
关闭虚拟机
$ vagrant halt
销毁虚拟机
$ vagrant destroy
```

