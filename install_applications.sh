#!/bin/bash
# Update package lists
sudo apt-get upgrade -y

# Install Java
sudo apt install openjdk-11-jre-headless -y
sudo java --version

#install git
sudo apt-get install git -y
git --version

#install docker
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo docker run hello-world
sudo systemctl enable docker
docker --version
sudo usermod -a -G docker $(whoami)


# Install nginx
# Use this for your user data (script from the top to bottom)
#install apache2 (ubuntu version)
sudo apt update -y
sudo apt install -y nginx
sudo service nginx start
sudo systemctl enable nginx
#echo "<h1>Hello World from Raymond Ogbebor. Learning terraform from this instance $(hostname -f)</h1>" > /var/www/html/index.html


#install Jenkins

sudo apt-get update -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null -y

sudo apt-get install -y jenkins
sudo jenkins --version
sudo systemctl enable jenkins
sudo systemctl start jenkins


#Install Ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt upgrade -y
sudo apt install ansible -y

#clone the git
#sudo cd /
#sudo cd /var/www/html/
#sudo git clone https://github.com/sujoyduttajad/Landing-Page-React.git
#sudo git clone https://github.com/gabrielecirulli/2048.git
#sudo rm index.nginx-debian.html
#cd Landing-Page-React/
#cp -r * /var/www/html/


# install nvm
# sudo su -
# sudo apt-get update -y
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash -y
# . ~/.nvm/nvm.sh -y
# nvm install 16.0.0 -y 
# node -e "console.log('Running Node.js ' + process.version)" -y
# git clone https://github.com/raymondogbe/Landing-Page-React.git -y
# cd Landing-Page-React/
# npm install -y
# npm start -y

