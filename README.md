# cicd
separates CI/CD - mit Absicht werden GH Actions nicht genutzt, um die Automatisierungen auf einem PI k8s Cluster betreiben zu können.

Das Repository wird als Helm Chart Repository angeboten, mittels dem ein Cronjob angeboten wird, der die Installation eines Tekton Kataloges durchführt und durch die Crontab regelmäßig synchonisiert. Voraussetzung dafür ist, dass der Tekton Katalog ein zentrales Script für alle Bestandteile des Kataloges bereitstellt.

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

## Layout

Layout der Dateien in diesem Repository:
```
cicd
|
├── charts                                      - Einstieg zu den Helm Charts
|   │
│   └── tekton-catalog-import               - beinhaltet alle Ressourcen für den Tekton Katalog Importer inkl. der Benutzer Konfigurationen zum Tekton Katalog
│       ├── static                          - Dateien, die in ConfigMaps geladen werden
│       │   ├── catalog-apply.sh            - Script zum Aufruf des Installer Scriptes aus dem Tekton Katalog
│       │   └── values-custom-config.yaml   - Benutzer Konfigurationen zu Pipelines, Tasks des Tekton Kataloges
│       └── templates                       - ConfigMaps, ServiceAccounts (inkl. notwendiger Berechtigungen) zur Bereitstellung und Nutzung des Tekton Kataloges
|
└── scripts                                     - Hier liegen alle Scripts, die für die Installation und Deinstallation der Charts in diesem Repository benötigt werden
    └── namespace                               - zusätzliches Helm Chart für die Bereitstellung des Namspaces

```
