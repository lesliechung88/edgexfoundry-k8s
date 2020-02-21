# Automate deploy edgexfoundry on kubernetes
Currently only supports Centos kuternetes cluster ,Suggest Centos 6+ amd64   
自动化部署edgexfoundry到K8S集群，目前只支持操作系统Centos K8S 集群，建议  Centos 6+

Warning: the shell scripts mentioned below, make sure to execute in the bin directory  
警告：下面提到的shell 脚本，需在bin目录下执行  
 
## Install on k8s master host 
### Step 1: Grant executable permissions in the bin directory
chmod -R +x ./bin 
 
### Step 2: Modify config file

edit edgex.conf, modify NFS_HOST to your nfs server real IP  
edit hosts, modify IPs to your k8s master host IP

### Step 3: Put images into images directory

In directory of images holds using images which is defined in *-deploy.yaml file in  directory of edgex-service

### Step 4: Modify deploy files 

In the directory of edgex-service ,modify image to yours in *-deploy.yaml file

### Step 5: Perform the installation

cd ./bin  
./install-edgex-master.sh

## Install on k8s normal nodes

INSTALL normal nodes MUST AFTER master install finished !

### Step 1: Grant executable permissions in the bin directory
chmod -R +x ./bin 

### Step 2: Modify config file

modify edgex.conf, change NFS_HOST to your nfs server real IP  

### Step 3: Put images into images directory

same to master host

## Start or Stop edgex services

execute the following command to start or stop edgex:  

cd ./bin  

./start-edgex.sh redis  
or  
./start-edgex.sh mongo  

./stop-edgex.sh redis  
or  
./stop-edgex.sh mongo  


## Start or Stop single service

cd ./bin  

Creating services is different  

For core、support、export、service use:  
./create-edgex-service.sh SERVICENAME  

Other service use:
./create-service.sh

Delete service is the same, both use:
./delete-service.sh SERVICENAME  

value of SERVICENAME is file name in directory of edgex-service,Support fuzzy matching, but make sure to locate the only service you want  

## Unload edgexfoundry

if you want to unload edgexfoundry from k8s cluster, execute the following command:  

cd ./bin  

first unload on k8s master host:  
./uninstall-edgex-master.sh  

then unload on normal k8s nodes host:  
./uninstall-edgex-node.sh  


# Package release
Finally, you can package it into a * .tar.gz and publish it.

# Download the prepared installation package
下载安装包edgexfoundry fuji版  
[edgex-fuji-k8s_standard_1.1.0.tar.gz](http://edgexfoundry.net/discuz/forum.php?mod=viewthread&tid=75&extra=page%3D1)



## application images
![image](https://github.com/lesliechung88/edgexfoundry-k8s/blob/master/appimg/edgex-k8s-1.png)
![image](https://github.com/lesliechung88/edgexfoundry-k8s/blob/master/appimg/edgex-k8s-2.png)
![image](https://github.com/lesliechung88/edgexfoundry-k8s/blob/master/appimg/edgex-k8s-3.png)
![image](https://github.com/lesliechung88/edgexfoundry-k8s/blob/master/appimg/edgex-run1.png)
![image](https://github.com/lesliechung88/edgexfoundry-k8s/blob/master/appimg/edgex-k8s-1.png)
![安装界面](https://images.gitee.com/uploads/images/2020/0218/110737_dc2f6896_1674860.png "edgex-k8s.png")  
![安装完成](https://images.gitee.com/uploads/images/2020/0218/110950_cb35f1e8_1674860.png "edgex-k8s-2.png")  
![UI显示图片](https://images.gitee.com/uploads/images/2020/0218/111031_70574ff7_1674860.png "edgex-run1.png")
![KAFKA接收消息](https://images.gitee.com/uploads/images/2020/0218/111117_68386b45_1674860.png "edgex-k8s-3.png")
![13157166232](https://github.com/lesliechung88/edgexfoundry-k8s/blob/master/appimg/weixin.png)
![images](https://images.gitee.com/uploads/images/2020/0221/085125_9cdb9290_1674860.png "weixin.png")
