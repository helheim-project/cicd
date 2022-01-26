# cicd
separates CI/CD - mit Absicht werden GH Actions nicht genutzt, um die Automatisierungen auf einem PI k8s Cluster betreiben zu können

## local dev
Für die lokale Entwicklung dieses Repos wird ein minikube genutzt.

### Bereitstellung Namespace
CI/CD soll in einem separaten Namespace laufen. \
Für die Bereitstellung des Namespaces kann folgendes Script genutzt werden.
- [namespace-create-local.sh](scripts/namespace-create-local.sh)

Der Name des Namespaces kann im [values-local.yaml](scripts/namespace/values-local.yaml) nachgelesen werden.

### Bereitstellung Tekton Katalog Installation
Im separaten Namespace wird der "Installer" des Tekton Kataloges bereitgestellt. \
Hierzu kann folgendes Script genutzt werden.
- [cicd-charts-create-local.sh](scripts/cicd-charts-create-local.sh)

## PI
Auf dem PI wird ein k8s Cluster erwartet.

### Bereitstellung Namespace
CI/CD soll in einem separaten Namespace laufen. \
Für die Bereitstellung des Namespaces kann folgendes Script genutzt werden.
- [namespace-create-pi.sh](scripts/namespace-create-pi.sh)

Der Name des Namespaces kann im [values-pi.yaml](scripts/namespace/values-pi.yaml) nachgelesen werden.

### Bereitstellung Tekton Katalog Installation
Im separaten Namespace wird der "Installer" des Tekton Kataloges bereitgestellt. \
Hierzu kann folgendes Script genutzt werden.
- [cicd-charts-create-pi.sh](scripts/cicd-charts-create-pi.sh)
