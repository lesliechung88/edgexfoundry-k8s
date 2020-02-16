#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

echo ""
echo "INSTALL NFS utils FOR Edgex Foundry K8S NODE"
echo "====================================================="
echo ""
echo "install nfs-utils start"
yum -y install nfs-utils
echo "install nfs-utils finish!"
echo ""
echo ""

echo ""
echo "systemctl restart nfs && systemctl enable nfs"
systemctl restart nfs && systemctl enable nfs
echo ""
echo ""

echo "Test NFS HOST, LIST DIR BELOW ============================"
showmount -e `cat ../edgex.conf | grep NFS_HOST | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
echo "============================================"
echo ""
echo "INSTALL NFS utils FINISH!"
echo ""