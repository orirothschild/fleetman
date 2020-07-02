#!/bin/bash
export KOPS_STATE_STORE=s3://kops-state-ori 
export NAME=fleetman.k8s.local 
export AWS_ACCESS_KEY_ID=AKIAS53I7JZFQYIROJFV
export AWS_SECRET_ACCESS_KEY=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
kops create cluster --zones us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1e,us-east-1f ${NAME}
helm repo add stable https://kubernetes-charts.storage.googleapis.com
kops edit ig nodes --name  ${NAME}
