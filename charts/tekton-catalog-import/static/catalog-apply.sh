#!/bin/sh

date 

id 

CUSTOMER_VALUES=$1
echo "use customer values: ${CUSTOMER_VALUES}"

VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
echo """
[INFO] Install kubbectl ${VERSION}
"""
curl -L https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl 
chmod +x /usr/bin/kubectl

echo """
[INFO] Install helm ${VERSION}
"""
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


kubectlVersion=$(kubectl version)
gitVersion=$(git version)
helmVersion=$(helm version)
echo """
[INFO] show tool versions
        - kubectl version: ${kubectlInfo}
        - git version: ${gitVersion}
        - helm version: ${helmVersion}

"""

tektonCatalogRepoName="cx-tekton-catalog"
tektonCatalogRepoUrl="https://github.com/Continuous-X/${tektonCatalogRepoName}.git"
echo """
[INFO] import tekton catalog from: ${tektonCatalogRepoUrl}

"""


git clone "${tektonCatalogRepoUrl}"
cd "${tektonCatalogRepoName}"

chmod u+x scripts/*.sh

pwd
ls -latr
ls -latr scripts


NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

echo """
[INFO] import tekton in namespace: ${NAMESPACE}

"""
./scripts/catalog-install.sh "${NAMESPACE}" "${CUSTOMER_VALUES}"
