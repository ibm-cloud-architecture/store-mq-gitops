notfound=$(oc get operators  openshift-gitops-operator.openshift-operators  |grep found)
echo $notfound
if [[  -n $notfound ]]
then
 echo "Define OpenShift GitOps"
 oc apply -k  https://github.com/ibm-cloud-architecture/eda-gitops-catalog/openshift-gitops/operator/overlays/stable
fi