#!/bin/bash

cd ~/kubernertesMaster/certificates

cat > openssl-cedrico2015-workerfull.cnf <<EOF
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = cedrico2015-workerfull
IP.1 = 192.168.56.102
EOF

openssl genrsa -out cedrico2015-workerfull.key 2048

openssl req -new -key cedrico2015-workerfull.key -subj "/CN=system:node:cedrico2015-workerfull/O=system:nodes" -out cedrico2015-workerfull.csr -config openssl-cedrico2015-workerfull.cnf
openssl x509 -req -in cedrico2015-workerfull.csr -CA ca.crt -CAkey ca.key -CAcreateserial  -out cedrico2015-workerfull.crt -extensions v3_req -extfile openssl-cedrico2015-workerfull.cnf -days 1000