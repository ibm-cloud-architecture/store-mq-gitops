YOUR_PROJECT_NAME=$1
oc project $YOUR_PROJECT_NAME
oc get secret ibm-entitlement-key -n ibm-common-services -o json | jq -r '.metadata.namespace="'${YOUR_PROJECT_NAME}'"' | oc apply -f -