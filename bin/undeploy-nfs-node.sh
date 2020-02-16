#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

echo "准备卸载nfs软件，请先在master机子执行undeploy-nfs-master.sh"

echo "systemctl stop nfs && systemctl disable nfs"
systemctl stop nfs && systemctl disable nfs

#卸载nfs软件
yum remove nfs-utils -y

echo "卸载nfs node 软件完毕！"




