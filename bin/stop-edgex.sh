#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

dir=../edgex-service

if [ ! -n "$1" ] ;then
    echo "请在脚本后输入停止的版本，参数为 mongo 或 redis"
    exit
else
       if [[ "$1" = "mongo" ]]; then
            ./subin/stop-mongo-edgex.sh
            echo ""
            echo "由于部分服务没有启动，上面错误信息可忽略!"
            echo "Edgex Foundry （mongo版）服务已提交k8s卸载，服务即将已停止！"
            echo ""
            cat ./subin/banner.txt
       elif [[ "$1" = "redis" ]]; then
            ./subin/stop-redis-edgex.sh
            echo ""
            echo "由于部分服务没有启动，上面错误信息可忽略"
            echo "Edgex Foundry （redis版）服务已提交k8s卸载，服务即将已停止！"
            echo ""
            cat ./subin/banner.txt
       else
          echo "输入停止的版本不对，参数为 mongo 或 redis"
       fi

fi

