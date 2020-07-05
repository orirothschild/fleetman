#!/bin/bash
. ./env.sh
kops edit cluster --name ${NAME}
#add these authenticationTokenWebhook: true    authorizationMode: Webhook
kops update cluster ${NAME} --yes
sleep 6m
helm repo add stable https://kubernetes-charts.storage.googleapis.com
kubectl apply -f .
kubectl delete secret alertmanager-monitoring-prometheus-oper-alertmanager
helm install monitoring stable/prometheus-operator
helm install spinnaker  stable/spinnaker --version 2.0.0-rc9
kubectl delete secret alertmanager-monitoring-prometheus-oper-alertmanager
kubectl create secret generic alertmanager-monitoring-prometheus-oper-alertmanager --from-file ../secrets/alertmanager.yaml
