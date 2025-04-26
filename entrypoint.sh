#!/bin/bash

# Deploy OpenFaaS gateway
cd /openfaas
docker-compose up -d

# Keep container running
tail -f /dev/null