#!/bin/bash
USERNAME=$USER

sudo ufw allow 22
sudo ufw allow 2376
sudo ufw allow 2377
sudo ufw allow 7946
sudo ufw allow 4789

sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io sshd -y
sudo groupadd docker
sudo usermod -aG docker $USERNAME
sudo reboot