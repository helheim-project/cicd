# cicd
separates CI/CD - mit Absicht werden nicht GH Actions genutzt.

## local dev
Für die lokale Entwicklung wird ein minikube genutzt.

- `helm template -f values-local.yaml . > helm-templates.yaml`
- `kubectl apply -f helm-templates.yaml`
