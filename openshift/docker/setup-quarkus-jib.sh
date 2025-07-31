echo "Logging into OCP and setting default project..."
oc login --username=ocadmin --password=ibmrhocp https://api.ocp.ibm.edu:6443
oc project bamoe-apps

echo "Logging into Docker using new token..."
HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
docker login -u $(oc whoami) -p $(oc whoami -t) $HOST
