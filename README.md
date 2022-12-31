Usage:

依赖的工具

- Make
- Docker

初始化环境

```

拉取子模块
$ cd this_repo/
$ git submodule update --init --recursive

构建Docker镜象
$ make build
展开虚拟机环境
$ make up
进入虚拟机环境
$ make ssh
```

容器内
```
配置代理
$ vim $HOME/.proxychains/proxychains.conf
拉取feeds
$ ./scripts/feeds update -a
$ ./scripts/feeds install -a
编辑配置
$ make menuconfig
修改配置之后，记得先先挂代理下载源码包，再编译
$ proxychains make download -j8
$ make -j8
```


