if [ "$OCP_TOKEN" == "" ]; then
    echo "Please log into the OpenShift cluster and get a new login token before running this command..."
    echo "---> Set the OCP_TOKEN variable to the new loging token"
    exit 1
fi

OCP_TOKEN=sha256~arL22IZIA7YSsdhH21jlr0O_6kUJ-nc0jZDGfazP030
echo "OCP Token:" $OCP_TOKEN

echo "Logging into OCP using new token and setting default project..."
oc login --token=$OCP_TOKEN --server=https://api.ocp.ibm.edu:6443
oc project bamoe-apps

echo "Logging into Docker using new token..."
HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
docker login -u $(oc whoami) -p $(oc whoami -t) $HOST
