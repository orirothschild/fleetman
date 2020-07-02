#!/bin/bash
./env.sh
kops create cluster --zones us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1e,us-east-1f ${NAME}
helm repo add stable https://kubernetes-charts.storage.googleapis.com
kops edit ig nodes --name  ${NAME}
