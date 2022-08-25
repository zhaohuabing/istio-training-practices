#!/bin/bash

echo "1. 创建 foo.bar.com 的私钥和CSR(证书签名请求)。"
echo "Press any key to continue"
read
openssl req -out foo.bar.com.csr -newkey rsa:2048 -nodes -keyout foo.bar.com.key -subj "/CN=foo.bar.com/O=foobar organization"

echo ""
echo 2. 使用证书机构的私钥、根证书和 foo.bar.com 的CSR创建数字证书。
echo "Press any key to continue"
read
openssl x509 -req -sha256 -days 365 -CA rootCA.crt -CAkey rootCA.key -set_serial 0 -in foo.bar.com.csr -out foo.bar.com.crt
