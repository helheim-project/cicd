#!/bin/sh

date 

id 

VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -L https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl 
chmod +x /usr/bin/kubectl

echo "show tool versions"
kubectl version
git version

git clone https://github.com/Continuous-X/cx-tekton-catalog.git
cd cx-tekton-catalog

chmod u+x scripts/*.sh

pwd
ls -latr
ls -latr scripts


NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
./scripts/catalog-install.sh "${NAMESPACE}"