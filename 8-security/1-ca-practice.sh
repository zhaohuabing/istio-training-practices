#!/bin/bash

echo 1. 模拟一个证书机构，为该证书机构创建私钥和自签名的根证书。
echo "Press any key to continue"
read
openssl req -newkey rsa:2048 -nodes -keyout rootCA.key -x509 -days 365 -out rootCA.crt

echo ""
echo "2. 创建Alice的私钥和CSR(证书签名请求)，该CSR中包含了Alice的私钥对应的公钥，以及Alice的姓名，机构等身份信息。"
echo "Press any key to continue"
read
openssl req -new -nodes -keyout Alice.key -out Alice.csr

echo ""
echo 3. 使用证书机构的私钥、根证书和Alice的CSR为Alice创建数字证书。
echo "Press any key to continue"
read
openssl x509 -req -in Alice.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out Alice.crt

echo ""
echo 4. 查看 Alice 证书的内容
echo "Press any key to continue"
read
openssl x509 -in Alice.crt -text

echo ""
echo 5. Alice使用私钥对商业合同签名，然后把签名后的合同和Alice的数字证书一起发给Bob。
echo "Press any key to continue"
read
echo "A very important business contract to Bob" > alice-contract
openssl dgst -sha256 -sign Alice.key -out alice-contract-sign.sha256 alice-contract

echo ""
echo 6. Bob收到该合同后，需要先验证Alice的数字证书是否合法。
echo "Press any key to continue"
read
openssl verify Alice.crt
echo 这里验证失败了，原因是签发Alice证书的的根证书是由我们生成的一个自签名证书，不是内置在操作系统内的权威机构的根证书。

echo ""
echo 7. 我们可以在验证Alice证书的命令行中指定证书机构的根证书,可以看到在指定根证书后，验证成功了。
echo "Press any key to continue"
read
openssl verify -CAfile rootCA.crt  Alice.crt


echo ""
echo 8. 使用Alice的证书中的公钥对合同的电子签名进行验证，以证明该合同的确是由Alice发出的。
echo "Press any key to continue"
read
echo 从Alice的证书中导出Alice的公钥
openssl x509 -pubkey -noout -in Alice.crt  > Alice-pub.key
echo 使用公钥对合同签名进行验证
openssl dgst -sha256 -verify Alice-pub.key -signature alice-contract-sign.sha256 alice-contract
