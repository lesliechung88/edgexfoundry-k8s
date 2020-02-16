#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

dir=../images

if [ ! -n "$1" ] ;then
    for file in $dir/*; do
        echo $file
        docker load -i $dir/$file
    done
else
    for file in $dir/*; do
       result=$(echo $file | grep "$1")
       if [[ "$result" != "" ]]
       then
             echo $file
             docker load -i $dir/$file
       fi
    done
fi



