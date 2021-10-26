#!/bin/bash
scriptDir=$(dirname $0)

############
### MAIN ###
############

function createProject {
    YOUR_PROJECT_NAME=$1
    ###############################
    # Create project if not exist #
    ###############################
    echo "Check if $YOUR_PROJECT_NAME OpenShift project exists"
    PROJECT_EXIST=$(oc get ns $YOUR_PROJECT_NAME 2> /dev/null)
    if [[ -z  $PROJECT_EXIST ]]
    then
        echo "Create $YOUR_PROJECT_NAME OpenShift project"
        oc new-project ${YOUR_PROJECT_NAME}
        if [[ $? -gt 0 ]]; then echo "[ERROR] - An error occurred while creating your OpenShift project"; exit 1; else echo "Done"; fi
    else
      echo "OpenShift Project ${YOUR_PROJECT_NAME} already exists"
    fi
    oc project ${YOUR_PROJECT_NAME}
}

createProject cp4i