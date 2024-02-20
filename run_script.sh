#!/bin/bash

mkdir ~/kubernertesWorker
cd ~/kubernertesWorker
wget https://dl.k8s.io/v1.24.1/kubernetes-node-linux-amd64.tar.gz
tar -xzvf kubernetes-node-linux-amd64.tar.gz