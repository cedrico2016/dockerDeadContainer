#!/bin/bash

mkdir /home/cedrico2015/kubernertesMaster
cd /home/cedrico2015/kubernertesMaster

wget https://dl.k8s.io/v1.24.1/kubernetes-server-linux-amd64.tar.gz
tar -xzvf kubernetes-server-linux-amd64.tar.gz
cd /home/cedrico2015/kubernertesMaster/kubernetes/server/bin/
wget https://github.com/etcd-io/etcd/releases/download/v3.5.4/etcd-v3.5.4-linux-amd64.tar.gz
tar -xzvf etcd-v3.5.4-linux-amd64.tar.gz