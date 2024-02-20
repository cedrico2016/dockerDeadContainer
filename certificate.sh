#!/bin/bash

mkdir ~/kubernertesMaster/certificates
cd ~/kubernertesMaster/certificates

openssl genrsa -out ca.key 2048

openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr

openssl x509 -req -in ca.csr -signkey ca.key -CAcreateserial  -out ca.crt -days 1000

openssl x509 -in ca.crt -text -noout

rm -f ca.csr