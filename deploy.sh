#!/bin/bash

docker login
DOCKER_BUILDKIT=1 docker build -t java-goof .
docker tag java-goof ${DOCKER_USERNAME}/java-goof:latest
docker push ${DOCKER_USERNAME}/java-goof:latest

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  annotations:
    service.alpha.kubernetes.io/tolerate-unready-endpoints: "true"
  name: goof
  labels:
    app: goof
spec:
  type: LoadBalancer
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: goof
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: goof
  name: goof
spec:
  replicas: 1
  selector:
    matchLabels:
      app: goof
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: goof
    spec:
      containers:
      - name: java-goof
        image: ${DOCKER_USERNAME}/java-goof:latest
        imagePullPolicy: Always
        env:
        - name: TREND_AP_KEY
          value: ${APPSEC_KEY}
        - name: TREND_AP_SECRET
          value: ${APPSEC_SECRET}
        ports:
        - containerPort: 8080
      restartPolicy: Always
EOF
