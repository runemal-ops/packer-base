#!/bin/sh
echo "Hello from the provisioner shell"
echo "Updating alpine packages"
apk update
apk add nginx