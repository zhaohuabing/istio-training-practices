kubectl -n istio-system port-forward services/istio-ingressgateway 8443:443

curl -v -HHost:foo.bar.com \
    --cacert foo.bar.com.crt \
    --resolve "foo.bar.com:8443:127.0.0.1" \
    "https://foo.bar.com:8443/productpage"

istioctl proxy-config listener istio-ingressgateway-b7796bc74-gnj74.istio-system --port 8443 -ojson|fx
cat jason.jwt | cut -d '.' -f2 - | base64 --decode -

python3 ./gen-jwt.py key.pem --expire=3153600000000000000 --sub "jason"  --iss "issuer@zhaohuabing.com" > jason.jwt
python3 ./gen-jwt.py key.pem --expire=3153600000000000000 --sub "alice"  --iss "issuer@zhaohuabing.com" > alice.jwt

export TOKEN=`cat jason.jwt`
curl http://150.158.224.216/productpage -H "Authorization: Bearer $TOKEN
