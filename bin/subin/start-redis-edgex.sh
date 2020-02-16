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

echo "清除复位consul与db文件开始"
rm -rf /nfs/data-go/logs/*
rm -rf /nfs/data-go/rules/*
rm -rf /nfs/data-go/db/*
rm -rf /nfs/data-go/consuldata/*
rm -rf /nfs/data-go/consulconfig/*
cp ../consulconf/00-consul.json /nfs/data-go/consulconfig/
cp ../consulconf/redis.json /nfs/data-go/consulconfig/
cp ../consulconf/rule-template.drl /nfs/data-go/rulestemplates/
echo "清除复位consul与db文件结束"

source ./create-service.sh consul ;
while true
do
       result=$(curl -s http://edgex-core-consul:32080/ | grep "404")
       if [[ "$result" != "" ]] ;then
           sleep 1
       else
           break
       fi
done
source ./create-service.sh configredis ;
sleep 12;
#删除configseed，防止k8s不断重启它
source ./delete-service.sh configredis ;
sleep 1;

source ./create-service.sh redisdb ;
sleep 8;



for svc in edgex-support-logging edgex-support-notifications edgex-core-metadata edgex-core-data \
        edgex-core-command edgex-export-client edgex-export-distro;

do
        start_service $svc ../edgex-service/$svc.yaml ../edgex-service/$svc-deploy.yaml &
done

wait


echo "启动 virtual 设备"
source ./create-service.sh virtual ;
sleep 8;

echo "启动 simple 设备"
source ./create-service.sh simple ;
sleep 5;

#echo "启动 imagesave"
#source ./create-service.sh images ;
#sleep 5;

#source ./create-service.sh hostdev ;
#sleep 8;

#echo "启动 modbus 设备"
#source ./create-service.sh modbus ;
#sleep 5;

echo "启动 mqtt-broker"
source ./create-service.sh edgex-mosquitto ;
sleep 3;

#echo "启动 mqtt 设备"
#source ./create-service.sh mqtt;
#sleep 5;

source ./create-service.sh hostdev ;
sleep 5;

echo "启动 UI"
source ./create-service.sh edgex-ui ;
sleep 5;

#echo "启动 zookeeper"
#source ./create-service.sh zookeeper ;
#sleep 5;

#echo "启动 kafkabroker"
#source ./create-service.sh kafkabroker ;
#sleep 5;

#echo "启动 appconfig-kafka"
#source ./create-service.sh appconfig-kafka ;
#sleep 5;



cat ./subin/banner.txt
echo "Edgex Foundry （redis版） 启动完毕！"

echo ""
echo "edgex-ui访问地址为 http://edgex-ui-go:32080   登录名与密码：admin/admin"
echo "consul-ui访问地址为 http://edgex-core-consul:32080 "
echo ""
echo "请确保配置了客户机的hosts域名解析"
echo "================================"
echo "masterIP edgex-core-consul"
echo "masterIP edgex-ui-go"
echo "masterIP edgex-redis"
echo "================================"
echo ""
echo "如果装了dashboard，访问地址：https://masterIP:30009"
echo ""
echo "停止edgex服务使用： ./stop-edgex.sh redis"
echo ""