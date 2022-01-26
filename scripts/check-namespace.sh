#!/bin/bash

#set -x

NAMESPACE=$1
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh

function help() {
    echo "[HELP] call script '${scriptname}' with <NAMESPACE>"
}

checkParam1 "$@"

kubectl get namespace "${NAMESPACE}" -o yaml
kubectl get quota --namespace="${NAMESPACE}"
kubectl describe quota compute-resources --namespace="${NAMESPACE}"
kubectl describe quota object-counts --namespace="${NAMESPACE}"
