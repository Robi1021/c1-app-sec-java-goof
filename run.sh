#!/bin/bash
sudo rm logs/appsec.log logs/defence.log
DOCKER_BUILDKIT=1 docker build -t java-goof .

docker run -p 8080:8080 --rm \
  --name java-goof \
  -e TREND_AP_KEY=${APPSEC_KEY} \
  -e TREND_AP_SECRET=${APPSEC_SECRET} \
  -v $(pwd)/logs:/var/log/appsec:rw \
   java-goof
