Usage:

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

可以在宿主上先完成feeds拉取、下载源码包，当然也可以在虚拟环境中做

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
