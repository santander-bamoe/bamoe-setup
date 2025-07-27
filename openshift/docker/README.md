# IBM Business Automation Manager Open Editions - Setup Instructions for Red Hat OpenShift - Docker
From time to time you will need to re-login to the OpenShift cluster and refresh your token.  Once you do that, re-login to docker in order for container image
building to work from Maven...

## Login to OpenShift Cluster  
You will need to re-generate the login token before using the above command, get this from the OCP Admin Console (copy login command) and update the environment variable:

```shell
    OCP_TOKEN=sha256~bIP7c460VMaocxfosq_3NF0-KGVeve_OIpEpA4IId2A 
    login --token=s$OCP_TOKEN --server=https://api.ocp.ibm.edu:6443
```

## Login to Cocker using OCP Image Registry:    

```shell
    HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
    docker login -u $(oc whoami) -p $(oc whoami -t) $HOST
```
