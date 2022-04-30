Usage:

在宿主上完成feeds拉取、配置

```
$ cd lede/
$ ./scripts/feeds update -a
$ ./scripts/feeds install -a
$ make menuconfig

```

初始化构建环境

```
$ cd virtual_env/
$ source ./setenv
$ vagrant up
```

进入环境，执行构建

```
$ vagrant ssh

(虚拟机内)
$ cd $HOME/lede
$ make -j8
```

取出构建结果

```
$ ./do_sync.sh
```
