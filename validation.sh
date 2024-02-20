#!/bin/bash


export SERVER_IP=192.168.56.103
echo $SERVER_IP

cd /home/cedrico2015/kubernertesMaster/certificates
openssl genrsa -out admin.key 2048
openssl req -new -key admin.key -subj "/CN=admin/O=system:masters" -out admin.csr
openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -CAcreateserial  -out admin.crt -days 1000

{
  kubectl config set-cluster kubernetes-from-scratch \
    --certificate-authority=ca.crt \
    --embed-certs=true \
    --server=https://${SERVER_IP}:6443 \
    --kubeconfig=admin.kubeconfig

  kubectl config set-credentials admin \
    --client-certificate=admin.crt \
    --client-key=admin.key \
    --embed-certs=true \
    --kubeconfig=admin.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-from-scratch \
    --user=admin \
    --kubeconfig=admin.kubeconfig

  kubectl config use-context default --kubeconfig=admin.kubeconfig
}

mkdir ~/.kube/
kubectl get componentstatuses --kubeconfig=admin.kubeconfig
cp /home/cedrico2015/kubernertesMaster/certificates/admin.kubeconfig ~/.kube/config
kubectl get componentstatuses

sleep 15 

kubectl create namespace kplabs
kubectl get namespace kplabs -o yaml

kubectl create secret generic prod-secret --from-literal=username=admin --from-literal=password=password123

kubectl get secret