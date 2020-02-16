#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
echo "准备卸载master edgex服务，请先在master机子执行uninstall-master.sh"
echo "包括的内容如下："
echo "1、卸载edgex 应用，如果没有启动应用则可会报错，可忽略"
echo "2、卸载nfs服务与应用，删除相关目录，如果没有启动应用则可会报错，可忽略"
echo "3、删除edgex相关镜像"
echo "4、清除/etc/hosts相应的解析"

while true
do
	read -r -p "确定卸载master edgex，并在master机子执行uninstall-master.sh吗? [Y/n] " input
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
echo "卸载edgex 应用，如果没有启动应用则可会报错，可忽略"
sleep 5
./subin//stop-mongo-edgex.sh
./subin/stop-redis-edgex.sh
echo "等待卸载edgex应用约15秒......."
sleep 15

echo ""
echo "开始卸载nfs服务......."
sleep 3
./undeploy-nfs-master.sh

#kubectl get pods -n default | grep nfs-pv | awk '{print $1}' | xargs kubectl delete pod -n default
kubectl delete pod recycler-for-nfs-pvconsulconfig-go --force --grace-period=0
kubectl delete pod recycler-for-nfs-pvconsuldata-go --force --grace-period=0
kubectl delete pod recycler-for-nfs-pvdb-go --force --grace-period=0
kubectl delete pod recycler-for-nfs-pvlogs-go --force --grace-period=0
kubectl delete pod recycler-for-nfs-pvrules-go --force --grace-period=0
kubectl delete pod recycler-for-nfs-pvrulestemplate-go --force --grace-period=0

echo ""
echo "开始卸载镜像......."
sleep 3
./unload-images.sh

echo ""
echo "清理/etc/hosts相应解析"
sed -i '/edgex/d' /etc/hosts

echo "移除/etc/rc.local中的hugepage配置"
sed -i '/hugepage/d' /etc/rc.d/rc.local


echo ""
echo ""

echo "edgex master卸载完毕!"

echo ""
echo ""
cat ./subin/banner.txt
rm  -rf ../../edgex-fuji-k8s