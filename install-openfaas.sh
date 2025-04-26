#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Start OpenFaaS
echo "Starting OpenFaaS Gateway..."
docker-compose up -d

# Wait for gateway to be ready
echo "Waiting for gateway to start..."
sleep 10

# Print access information
echo "OpenFaaS has been installed successfully!"
echo "Access the portal at: http://localhost:8081"