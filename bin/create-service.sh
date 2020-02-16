#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

dir=../edgex-service

if [ ! -n "$1" ] ;then
    echo "请输入开始的服务名，可模糊匹配"
    exit
else
    for file in $dir/*; do
       result=$(echo $file | grep "$1")
       if [[ "$result" != "" ]]
       then
             echo $file
             kubectl create -f $dir/$file
       fi
    done
fi

