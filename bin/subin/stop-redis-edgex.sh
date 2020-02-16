#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/


kubectl delete -f ../edgex-service/edgex-consul.yaml
kubectl delete -f ../edgex-service/edgex-consul-deploy.yaml

kubectl delete -f ../edgex-service/edgex-configredis-deploy.yaml

kubectl delete -f ../edgex-service/edgex-redisdb-deploy.yaml

kubectl delete -f ../edgex-service/edgex-support-logging.yaml
kubectl delete -f ../edgex-service/edgex-support-logging-deploy.yaml

kubectl delete -f ../edgex-service/edgex-support-notifications.yaml
kubectl delete -f ../edgex-service/edgex-support-notifications-deploy.yaml

kubectl delete -f ../edgex-service/edgex-core-metadata.yaml
kubectl delete -f ../edgex-service/edgex-core-metadata-deploy.yaml

kubectl delete -f ../edgex-service/edgex-core-data.yaml
kubectl delete -f ../edgex-service/edgex-core-data-deploy.yaml

kubectl delete -f ../edgex-service/edgex-core-command.yaml
kubectl delete -f ../edgex-service/edgex-core-command-deploy.yaml

kubectl delete -f ../edgex-service/edgex-export-client.yaml
kubectl delete -f ../edgex-service/edgex-export-client-deploy.yaml

kubectl delete -f ../edgex-service/edgex-export-distro.yaml
kubectl delete -f ../edgex-service/edgex-export-distro-deploy.yaml

kubectl delete -f ../edgex-service/edgex-appconfig-rules.yaml
kubectl delete -f ../edgex-service/edgex-appconfig-rules-deploy.yaml

kubectl delete -f ../edgex-service/support-rulesengine.yaml
kubectl delete -f ../edgex-service/support-rulesengine-deploy.yaml

kubectl delete -f ../edgex-service/device-mqtt.yaml
kubectl delete -f ../edgex-service/device-mqtt-deploy.yaml

kubectl delete -f ../edgex-service/edgex-ui.yaml
kubectl delete -f ../edgex-service/edgex-ui-deploy.yaml

kubectl delete -f ../edgex-service/edgex-mosquitto.yaml
kubectl delete -f ../edgex-service/edgex-mosquitto-deploy.yaml

kubectl delete -f ../edgex-service/device-virtual.yaml
kubectl delete -f ../edgex-service/device-virtual-deploy.yaml

kubectl delete -f ../edgex-service/device-modbus.yaml
kubectl delete -f ../edgex-service/device-modbus-deploy.yaml

kubectl delete -f ../edgex-service/device-simple.yaml
kubectl delete -f ../edgex-service/device-simple-deploy.yaml

kubectl delete -f ../edgex-service/device-mqtt.yaml
kubectl delete -f ../edgex-service/device-mqtt-deploy.yaml

kubectl delete -f ../edgex-service/hostdev-plugin-ds.yaml


kubectl delete -f ../edgex-service/edgex-appconfig-images-deploy.yaml

kubectl delete -f ../edgex-service/edgex-appconfig-kafka-deploy.yaml

kubectl delete -f ../edgex-service/edgex-kafkabroker-deploy.yaml

kubectl delete -f ../edgex-service/edgex-zookeeper-deploy.yaml