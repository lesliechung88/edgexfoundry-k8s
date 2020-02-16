#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

function start_service(){

    echo "开始创建 $1"
    kubectl apply -f $2 ;
    kubectl apply -f $3 ;
    declare -i count;
    while true
          do

            result=$(echo `curl -s http://$1:32080/api/v1/ping`);
            echo "test service $1.....";
            if [[ "$result" = "pong" ]]; then
               echo "$1 创建成功！！！！！！！！！！！！！！！！！！！！";
               break;
            fi
            sleep 4;
            count=$((count+1)) ;
            b=$(( $count % 3 )) ;
            if [ $b == 0 ]; then
               echo "删除启动失败的$1,重新创建.............";
               kubectl delete -f $3 ;
               sleep 12;
               kubectl apply -f $3 ;
               sleep 5;
            fi
    done
}

if [ ! -n "$1" ] ;then
    echo "请输入开始的服务名，可模糊匹配"
    exit
else
    for svc in edgex-support-logging edgex-support-notifications edgex-core-metadata edgex-core-data \
            edgex-core-command edgex-export-client edgex-export-distro;
    do
       result=$(echo $svc | grep "$1")
       if [[ "$result" != "" ]]
       then
             start_service $svc ../edgex-service/$svc.yaml ../edgex-service/$svc-deploy.yaml
       fi
    done
fi

