notfound=$(oc get catalogsource  ibm-operator-catalog -n openshift-marketplace |grep found)
echo $notfound
if [[  -n $notfound ]]
then
 echo "Define IBM catalog in openshift marketplace"
 oc apply -f https://raw.githubusercontent.com/ibm-cloud-architecture/eda-gitops-catalog/main/ibm-catalog/catalog_source.yaml
fi