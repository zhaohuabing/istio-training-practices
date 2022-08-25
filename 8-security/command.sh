kubectl -n istio-system port-forward services/istio-ingressgateway 8443:443

curl -v -HHost:foo.bar.com \
    --cacert foo.bar.com.crt \
    --resolve "foo.bar.com:8443:127.0.0.1" \
    "https://foo.bar.com:8443/productpage"

istioctl proxy-config listener istio-ingressgateway-b7796bc74-gnj74.istio-system --port 8443 -ojson|fx
