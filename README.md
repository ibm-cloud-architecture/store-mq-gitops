# Store inventory demonstration with IBM MQ and Event Streams

This is a gitops that let you install in a minimum set of commands a simple demonstration
that is using the following components:

![](docs/es-mq-demo.png)

* Store seller simulator
* IBM MQ as part of IBM Cloud Pak for Integration
* IBM Event Streams as part of IBM Cloud Pak for Integration
* Kafka Connector as part of Event Streams
* A simple Kafka consumer or the Event Streams console to demonstrate the items topic content.


There are two ways to use this demonstration:

* You have already a Cloud Pak for Integration deployed on OpenShift 4.7 cluster
* You have only an OpenShift 4.7+ cluster


## Audience

* Understand Event Streams, Kafka Connectors, MQ connectors

## Option 1: From Cloud Pak for Integration

* login to OpenShift cluster
* 


## Option 2: From a OpenShift Cluster

In this option we start from a OpenShift Cluster on IBM Cloud (ROKS cluster) with minimum of three nodes.

* create `cp4i` project

  ```sh
  ./boostrap/scripts/defineProject.sh
  ```

* Get your entitlement key from IBM site and use the following scripts: 

  ```sh
  ./boostrap/scripts/defineEntitlementSecret.sh your_long_entitlement_key 
  ```

* Deploy OpenShift GitOps operator

  ```sh
  ```

* Deploy IBM Event Streams Operator

  ```sh
    oc apply -k bootstrap/eventstreams
  ```

* Deploy IBM MQ Operator

  ```sh
    oc apply -k bootstrap/mq
  ```

* Create ArgoCD project

  ```sh
  oc apply -k bootstrap/argocd-project
  ```

* Get ArgoCD admin password

  ```sh
   oc extract secret/openshift-gitops-cluster -n openshift-gitops --to=- 
  ```

* Get ArgoCD URL

  ```sh
  oc get routes -n openshift-gitops
  ```

  Login to the url like: openshift-gitops-server-openshift-gitops.........appdomain.cloud 

  In the Argo application, filter on the project named `smq`, you should see no application.

* Lets Go!: Start GitOps

  ```sh
   oc apply -k config/argocd 
  ```

  Now in the ArgoCD console you should see ArgoCD applications