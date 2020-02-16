#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

if [ ! -n "$1" ] ;then
    docker rmi --force `docker images | grep edgexfoundry | awk '{print $3}'`
    docker rmi --force `docker images | grep guqiaochina | awk '{print $3}'`
    docker rmi redis:5.0.5-alpine
    docker rmi ccr.ccs.tencentyun.com/paas/hostdev:latest
    docker rmi consul:1.3.1
else
    docker rmi --force `docker images | grep "$1" | awk '{print $3}'`
fi

docker rmi --force `docker images | grep none | awk '{print $3}'`
