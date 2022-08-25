istioctl install -y -f ./istio-config.yaml\
 --set "components.egressGateways[0].name=istio-egressgateway"\
 --set "components.egressGateways[0].enabled=true"