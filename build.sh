#!/bin/bash
mkdir -p layer/bin
cd layer/bin
rm -rf * # clear old stuff if present
curl -0 https://storage.googleapis.com/hey-release/hey_linux_amd64 > hey
chmod +x hey