#!/bin/bash
./env.sh
kops update cluster ${NAME} --yes
sleep 10m
helm install monitoring stable/prometheus-operator
kubectl delete secret alertmanager-monitoring-prometheus-oper-alertmanager
kubectl create secret generic alertmanager-monitoring-prometheus-oper-alertmanager --from-file ../secrets/alertmanager.yaml
kubectl apply -f .