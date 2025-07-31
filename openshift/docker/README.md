# IBM Business Automation Manager Open Editions - Setup Instructions for Red Hat OpenShift - Docker
In order for Maven builds to produce a container image using Quarkus JIB, you must be logged into Docker.  From time to time you will need to re-login to the OpenShift cluster as well as login to Docker.  You can use the following commands in a terminal window or run the script named `setup-quarkus-jib.sh` from this folder.

```shell
echo "Logging into OCP and setting default project..."
oc login --username=ocadmin --password=ibmrhocp https://api.ocp.ibm.edu:6443
oc project bamoe-apps

echo "Logging into Docker using new token..."
HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
docker login -u $(oc whoami) -p $(oc whoami -t) $HOST
```

