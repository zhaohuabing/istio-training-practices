curl -v --header "host: foo.bar.com"  http://127.0.0.1:8080/productpage
kubectl -n istio-system port-forward services/istio-ingressgateway 8080:8