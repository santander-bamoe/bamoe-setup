# IBM Business Automation Manager Open Editions - Setup Instructions for Red Hat OpenShift - Docker
From time to time you will need to re-login to the OpenShift cluster and refresh your token.  Once you do that, re-login to docker in order for container image
building to work from Maven...

## Login to OpenShift Cluster  
You will need to re-generate the login token before using the above command, get this from the OCP Admin Console (copy login command)

```shell
    login --token=sha256~_p8vX9pVedjEqC2Lj6XoEAlJlP2uKScI4KKpobsu0vE --server=https://api.ocp.ibm.edu:6443
```

## Login to Cocker using OCP Image Registry:    

```shell
    HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
    docker login -u $(oc whoami) -p $(oc whoami -t) $HOST
```
