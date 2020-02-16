#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
echo "准备卸载node edgex服务，包括的内容如下："
echo "1、卸载nfs软件"
echo "2、删除edgex相关镜像"


while true
do
	read -r -p "确定卸载master edgex吗? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			echo "是"
			break
			;;
	    [nN][oO]|[nN])
			echo "否"
			exit 1
			;;
	    *)
			echo "无效的输入..."
			;;
	esac
done

echo ""
echo "卸载nfs软件...."
./undeploy-nfs-node.sh

echo ""
echo "卸载镜像...."
./unload-images.sh

echo "移除/etc/rc.local中的hugepage配置"
sed -i '/hugepage/d' /etc/rc.d/rc.local

echo ""
echo ""
echo "edgex node 卸载完毕!"
echo ""
cat ./subin/banner.txt
echo ""
rm  -rf ../../edgex-fuji-k8s