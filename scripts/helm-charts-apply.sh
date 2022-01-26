#!/bin/bash

HELM_CHART_PATH=$1
ENV=$2
scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)
source ${basepath}/common.sh

function help() {
    echo """[HELP] call script '${scriptname}' with <HELM_CHART_PATH> <ENV>
    - HELM_CHART_PATH   - relativ path from repository root : ${HELM_CHART_PATH}
    - ENV               - environment takes value-[ENV].yaml: ${ENV}
    """
}

checkParam1 "$@"
checkParam2 "$@"

help

helmPath="${basepath}/../${HELM_CHART_PATH}"
helmTemplateFile="${helmPath}/helm-templates-${ENV}.yaml"

source ${basepath}/helm-template-create.sh "${helmPath}" "${ENV}" "${helmTemplateFile}"

kubectl apply -f "${helmTemplateFile}"

