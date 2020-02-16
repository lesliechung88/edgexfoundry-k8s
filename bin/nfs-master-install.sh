#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

echo ""
echo "Make NFS FOR Edgex Foundry..................................."
echo "====================================================="
echo ""
echo "install nfs-utils start"
yum -y install nfs-utils
echo "install nfs-utils finish!"
echo ""
echo ""

echo "make dir start"
mkdir -p /nfs/data-go/consulconfig
echo "/nfs/data-go/consulconfig created"
mkdir -p /nfs/data-go/consuldata
echo "/nfs/data-go/consuldata created"
mkdir -p /nfs/data-go/db
echo "/nfs/data-go/db created"
mkdir -p /nfs/data-go/logs
echo "/nfs/data-go/logs created"
mkdir -p /nfs/data-go/rules
echo "/nfs/data-go/rules created"
mkdir -p /nfs/data-go/rulestemplates
echo "/nfs/data-go/rulestemplates created"
mkdir -p /nfs/data-go/db-devicevirtual
echo "/nfs/data-go/db-devicevirtual created"
mkdir -p /nfs/data-go/images
echo "/nfs/data-go/images created"


echo ""
chmod -R 777 /nfs/data-go
echo "chmod -R 777 /nfs/data-go"
echo ""

echo "make file=/etc/exports start"
cat <<EOF > /etc/exports
/nfs/data-go/consulconfig *(rw,no_root_squash,sync)
/nfs/data-go/consuldata *(rw,no_root_squash,sync)
/nfs/data-go/db *(rw,no_root_squash,sync)
/nfs/data-go/logs *(rw,no_root_squash,sync)
/nfs/data-go/rules *(rw,no_root_squash,sync)
/nfs/data-go/rulestemplates *(rw,no_root_squash,sync)
/nfs/data-go/db-devicevirtual *(rw,no_root_squash,sync)
/nfs/data-go/images *(rw,no_root_squash,sync)
EOF
echo "file=/etc/exports created"
echo ""

#配置生效
echo "enabled exportfs"
echo ""
exportfs -r
#查看生效
echo ""
echo "list exportfs dir"
exportfs
echo "enabled finish!"
echo ""

#查看 RPC 服务的注册状况
echo ""
echo "list rpcinfo"
echo ""
rpcinfo -p localhost
echo ""

echo "showmount "
echo ""
#showmount测试
showmount -e `cat ../edgex.conf | grep NFS_HOST | awk -F'=' '{ print $2 }' | sed s/[[:space:]]//g`
echo ""
echo ""

echo "systemctl restart rpcbind && systemctl enable rpcbind"
systemctl restart rpcbind && systemctl enable rpcbind
echo ""
echo "systemctl restart nfs && systemctl enable nfs"
systemctl restart nfs && systemctl enable nfs
echo ""
echo "Make NFS FOR Edgex Foundry FINISH!"
echo ""