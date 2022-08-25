#!/bin/bash

kubectl create -n istio-system secret tls foobarcom-credential --key=foo.bar.com.key --cert=foo.bar.com.crt
