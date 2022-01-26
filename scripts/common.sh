#!/bin/bash

function checkParam1() {
    echo "checkint param 1: $1"
    if [ -z "$1" ]; then 
        help
        exit 1
    fi
}

function checkParam2() {
    echo "checking param 2: $2"
    if [ -z "$2" ]; then 
        help
        exit 1
    fi
}

function checkParam3() {
    echo "checking param 3: $3"
    if [ -z "$3" ]; then 
        help
        exit 1
    fi
}

function getTektonSourcesInNamespace() {
    echo """
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Get Tekton Sources in '$1'
===========================

    tasks in namespace '$1':
    ----------------------------------------
    """
    kubectl get tasks -n "$1"

    echo """

    pipelines in namespace '$1':
    --------------------------------------------
    """
    kubectl get pipelines -n "$1"

    echo """

    trigger-templates in namespace '$1':
    --------------------------------------------
    """
    kubectl get tt -n "$1"

    echo """

    trigger-bindings in namespace '$1':
    --------------------------------------------
    """
    kubectl get tb -n "$1"

    echo """

    event-listener in namespace '$1':
    --------------------------------------------
    """
    kubectl get el -n "$1"

    echo """
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    """
}