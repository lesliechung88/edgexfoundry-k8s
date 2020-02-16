#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

dir=../edgex-service

if [ ! -n "$1" ] ;then
    echo "请在脚本后输入启动的版本，参数为 mongo 或 redis"
    exit
else
       if [[ "$1" = "mongo" ]]; then
            ./subin/start-mongo-edgex.sh
       elif [[ "$1" = "redis" ]]; then
            ./subin/start-redis-edgex.sh
       else
          echo "输入启动的版本不对，参数为 mongo 或 redis"
       fi

fi

