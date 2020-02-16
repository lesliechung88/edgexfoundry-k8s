#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
echo "准备安装 K8S edgex master 服务"
echo "包括的内容如下："
echo "1、安装nfs软件，机子需要连接互联网！"
echo "2、部署nfs服务"
echo "3、装载镜像"
echo "4、添加/etc/hosts相应的解析"

while true
do
	read -r -p "请确定本机是否为master机，并连接上互联网？决定安装吗? [Y/n] " input
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
echo ""
echo "开始安装nfs软件......."
sleep 3
./nfs-master-install.sh

echo ""
echo "开始部署nfs服务......."
sleep 3
./deploy-nfs-master.sh

echo ""
echo "开始装载镜像......."
sleep 3
./load-images.sh

echo ""
echo "向/etc/hosts添加解析"
sleep 3

sed -i "s/^M//g" ../hosts
cat ../hosts >> /etc/hosts
sed -i "s/^M//g" ../hosts

echo ""
echo ""

echo "消息redis启动设置立即生效 -> 为了消除这个警告： you have Transparent Huge Pages"
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

echo "修改/etc/rc.d/rc.local，消除redis启动警告设置"
chmod +x /etc/rc.d/rc.local

cat >> /etc/rc.d/rc.local << EOF
# disable THP hugepage
echo never > /sys/kernel/mm/transparent_hugepage/enabled  #hugepage
echo never > /sys/kernel/mm/transparent_hugepage/defrag #hugepage

EOF


cat ./subin/banner.txt
echo ""
echo ""
echo "Edgex Foundry fuji master安装完毕!"
echo "请去各node节点执行install-edgex-node.sh，完成edgex集群安装!"
echo ""
echo ""
echo "确保其它node节点安装完成后，执行如下命令启动edgex服务"
echo "redis版：    ./start-edgex.sh redis"
echo "mongo版：    ./start-edgex.sh mongo"

