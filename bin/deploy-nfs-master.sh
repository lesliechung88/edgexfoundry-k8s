#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

NFSHOST=`cat ../edgex.conf | grep NFS_HOST | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sed -i "s/NFS-HOST/$NFSHOST/g" ../nfs/pv/*.yaml
echo "创建PV"
kubectl apply -f ../nfs/pv
sleep 5

echo "创建PVC"
kubectl apply -f ../nfs/pvc

