#!/bin/bash

# install_docker.sh
# Script to install Docker Engine + Docker Compose on Ubuntu 24.04

set -e

echo "🔄 Updating system..."
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "🔑 Adding Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📦 Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🚀 Installing Docker Engine and Docker Compose..."
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "👤 Adding current user ($USER) to docker group..."
sudo usermod -aG docker $USER
newgrp docker 
echo "✅ Installation complete!"
docker --version
docker compose version

echo "⚠️ Please log out and log back in, or run: newgrp docker"

