#!/bin/bash
# Java installation for jenkins

sudo apt update
sudo apt install openjdk-11-jre -y

# Jenkins installation 
#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

# Update package list and install Jenkins dependencies
sudo apt-get update -y
sudo apt-get install -y openjdk-11-jdk

# Add Jenkins repository and key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

# Change Jenkins default port if needed
# sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=9090/' /etc/default/jenkins

# Start Jenkins service
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

# Check Jenkins service status
sudo systemctl status jenkins.service


# Terraform Installation

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform -y

# Installing kubernetes

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 

