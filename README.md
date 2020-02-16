# Automate deploy edgexfoundry on kubernetes

 
 Currently only supports Centos kuternetes cluster ,Suggest Centos 6+ amd64
 
## Install on k8s master host 
### Step 1: Grant executable permissions in the bin directory
chmod -R +x ./bin 
 
### Step 2: edit config file

edit edgex.conf, change NFS_HOST to your nfs server real IP  
edit hosts, change IPs to your k8s master host IP

### Step 3: Perform the installation

cd ./bin  
./install-edgex-master.sh

## Install on k8s normal nodes

INSTALL normal nodes MUST AFTER master install finished !

### Step 1: Grant executable permissions in the bin directory
chmod -R +x ./bin 

### Step 2: edit config file

edit edgex.conf, change NFS_HOST to your nfs server real IP  

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

