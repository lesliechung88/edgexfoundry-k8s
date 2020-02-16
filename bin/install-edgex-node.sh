#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
echo "准备安装 K8S edgex node"
echo "包括的内容如下："
echo "1、安装nfs软件，机子需要连接互联网！"
echo "2、装载镜像"
echo "3、修改/etc/rc.local，消息redis启动警告"

while true
do
	read -r -p "请确定本机是否为node节点，并连接上互联网？ [Y/n] " input
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

./nfs-node-install.sh
./load-images.sh

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

echo ""
cat ./subin/banner.txt
echo ""
echo ""
echo "Edgex Foundry fuji 本node节点安装完毕!"
echo ""


