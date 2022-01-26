#!/bin/bash

HELM_CHART_PATH=$1
ENV=$2
HELM_TEMPLATE_FILENAME=$3
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh

function help() {
    echo """[HELP] call script '${scriptname}' with <HELM_CHART_PATH> <ENV> <HELM_TEMPLATE_FILENAME>
    - HELM_CHART_PATH           - absolut path to helm charts       : '${HELM_CHART_PATH}'
    - ENV                       - environment takes value-[ENV].yaml: '${ENV}'
    - HELM_TEMPLATE_FILENAME    - helm template filename            : '${HELM_TEMPLATE_FILENAME}'
    """
}

checkParam1 "$@"
checkParam2 "$@"
checkParam3 "$@"

help

helmPath="${HELM_CHART_PATH}"
helmValueFile="${helmPath}/values-${ENV}.yaml"
helmTemplateFile="${helmPath}/helm-templates-${ENV}.yaml"

helm template "${helmPath}" -f "${helmValueFile}" > "${helmTemplateFile}"
