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

宿主上完成feeds拉取、下载源码包

```

$ cd lede/

$ ./scripts/feeds update -a
$ ./scripts/feeds install -a

编辑配置，下载源码包
$ make menuconfig
$ make download -j8
```

进入虚拟机环境，执行构建

```
$ vagrant ssh

(虚拟机内)
$ source $HOME/scripts/setenv
$ cd $HOME/lede
$ make -j8
```

取出构建结果

```
$ ./scripts/do_sync.sh
```

关闭+删除虚拟机
```
$ vagrant halt
$ vagrant destroy
```
