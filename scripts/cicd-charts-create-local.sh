#!/bin/bash

scriptname=$(basename "$0")
basepath=$(cd $(dirname "$0") && pwd)

helmPath="."
env="local"

function help() {
    echo """[HELP] call script '${scriptname}'
    - helm chart path   : ${helmPath} (fullpath: '${basepath}/${helmPath}')
    - env               : ${env}
    """
}

help

source ${basepath}/helm-charts-apply.sh "${helmPath}" "${env}"
