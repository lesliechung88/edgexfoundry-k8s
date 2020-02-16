#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

NFSHOST=`cat ../edgex.conf | grep NFS_HOST | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`

sed -i "s/NFS-HOST/$NFSHOST/g" ../nfs/pv/*.yaml

#删除pv pvc静态卷
kubectl delete -f ../nfs/pvc
kubectl delete -f ../nfs/pv

echo "systemctl stop nfs && systemctl disable nfs"
systemctl stop nfs && systemctl disable nfs

#卸载nfs软件
yum remove nfs-utils -y

#删除nfs相关应用目录
rm -rf /etc/exports
rm -rf /nfs
echo ""
echo ""
echo "卸载master nfs完毕！"


