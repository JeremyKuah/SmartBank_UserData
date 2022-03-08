#!/bin/bash
sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -

sudo yum install -y git
sudo yum install -y nodejs 

git clone https://github.com/JeremyKuah/smartbankreact-mercury.git

cd smartbankreact-mercury
sudo npm install

sudo echo "export const API_URL = 'http://${lb_dns_name}:8080/'" > src/Constants.js

sudo npm run build
sudo npm install -g serve
sudo serve -s build -l 80