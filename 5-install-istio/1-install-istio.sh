#!/bin/bash

BASE_DIR=$(dirname "$0")
export ISTIO_VERSION=1.14.4

set -ex

[ -n "$(istioctl version --remote=false |grep $ISTIO_VERSION)" ] || (curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION  sh - && sudo mv $PWD/istio-$ISTIO_VERSION/bin/istioctl /usr/local/bin/)

kubectl create ns istio-system || true
istioctl install -y -f ${BASE_DIR}/istio-config.yaml
kubectl label namespace default istio-injection=enabled --overwrite=true
